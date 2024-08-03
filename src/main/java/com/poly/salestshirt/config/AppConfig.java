package com.poly.salestshirt.config;

import org.modelmapper.ModelMapper;
import org.modelmapper.convention.MatchingStrategies;
import org.springframework.context.annotation.Bean;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

@Component
public class AppConfig {

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    public ModelMapper getModelMapper() {
        ModelMapper modelMapper = new ModelMapper();
        // cấu hình thuộc tính của đối tượng nguồn và đích phải trùng khớp hoàn toàn về tên và kiểu dữ liệu
        modelMapper.getConfiguration().setMatchingStrategy(MatchingStrategies.STRICT);
        // bỏ qua field là null
        modelMapper.getConfiguration().setSkipNullEnabled(true);
        return modelMapper;
    }
}
