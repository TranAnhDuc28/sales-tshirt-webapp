package com.poly.salestshirt.config;

import org.sitemesh.builder.SiteMeshFilterBuilder;
import org.sitemesh.config.ConfigurableSiteMeshFilter;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class CustomSiteMeshFilter extends ConfigurableSiteMeshFilter {

    @Override
    protected void applyCustomConfiguration(SiteMeshFilterBuilder builder) {
        builder
                .setDecoratorPrefix("/decorators/")
                .addDecoratorPath("/*", "web.jsp")
                .addDecoratorPath("", "web.jsp")
                .addDecoratorPath("/admin/*", "admin.jsp")
                .addExcludedPath("/auth/login")
                .addExcludedPath("/auth/register")
                .addExcludedPath("/auth/forgot-pwd");
    }

    @Bean
    public FilterRegistrationBean<CustomSiteMeshFilter> siteMeshFilter() {
        FilterRegistrationBean<CustomSiteMeshFilter> filter = new FilterRegistrationBean<>();
        filter.setFilter(new CustomSiteMeshFilter());
        return filter;
    }
}
