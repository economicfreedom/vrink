package com.green.vrink.config;

import com.green.vrink.interceptor.AuthInterceptor;
import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Bean;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Component
@RequiredArgsConstructor
public class WebMvcConfig implements WebMvcConfigurer {
    private final AuthInterceptor authInterceptor;

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        String[] authRequiredPaths = {
                "/editor/editor-edit",
                "/editor/editor-price",
                "/payment/**",
                "/user/my-page",
                "/user/change-password",
                "/user/update/**",
                "/user/delete/**",
                "/editor/calculator/point",
                "/editor/calculate/point",
                "/suggest/post",
                "/suggest/patch/**",
                "/suggest/delete/**",
                "/suggest/reply/post",
                "/suggest/reply/patch",
                "/suggest/reply/delete/**",
                "/suggest/accept-suggest/**",
                "/free-reply/**",
                "/board/write",
                "/board/del",
                "/board/update",
                "/review/**",
        };

        registry.addInterceptor(authInterceptor)
                .addPathPatterns(authRequiredPaths);
    }

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }
}
