package com.poly.salestshirt.security;

import jakarta.servlet.DispatcherType;
import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityCustomizer;
import org.springframework.security.config.annotation.web.configurers.AbstractHttpConfigurer;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
@EnableWebSecurity
@RequiredArgsConstructor
@EnableMethodSecurity
public class SecurityConfig {

    private final AccountAuthenticationProvider authenticationProvider;

    @Bean
    public AuthenticationManager authenticationManager(AuthenticationConfiguration config) throws Exception {
        return config.getAuthenticationManager();
    }

    @Bean
    public CustomAuthenticationSuccsesHandler customAuthenticationSuccsesHandler() {
        return new CustomAuthenticationSuccsesHandler();
    }

    @Bean
    public CustomAuthenticationFailure customAuthenticationFailure() {
        return new CustomAuthenticationFailure();
    }

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity httpSecurity) throws Exception {
        httpSecurity
                .csrf(AbstractHttpConfigurer::disable)
                .authorizeHttpRequests(authorizeHttpRequest ->
                        authorizeHttpRequest
                                .dispatcherTypeMatchers(DispatcherType.FORWARD).permitAll()
                                .requestMatchers("/auth/*").permitAll()
                                .requestMatchers("/home", "/").permitAll()
                                .requestMatchers("/admin/**", "/admin/*").hasAnyAuthority("ADMIN", "MANAGER")
                                .anyRequest().authenticated())
                .formLogin(formLogin ->
                        formLogin
                                .loginPage("/auth/login").permitAll()
                                .loginProcessingUrl("/auth/login")
                                .usernameParameter("username")
                                .passwordParameter("password")
                                .successHandler(customAuthenticationSuccsesHandler())
                                .failureHandler(customAuthenticationFailure()))
                .logout(logout ->
                        logout
                                .logoutUrl("/auth/logout")
                                .logoutSuccessUrl("/auth/login")
                                .invalidateHttpSession(true)
                                .deleteCookies("JSESSIONID"))
                .authenticationProvider(authenticationProvider)
                .sessionManagement(sessionManagement ->
                        sessionManagement.sessionCreationPolicy(SessionCreationPolicy.IF_REQUIRED));
        return httpSecurity.build();
    }

    @Bean
    public WebSecurityCustomizer webSecurityCustomizer() {
        return (web) -> web.ignoring().requestMatchers("/assets/**");
    }
}
