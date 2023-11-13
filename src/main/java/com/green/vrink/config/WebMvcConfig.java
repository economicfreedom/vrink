package com.green.vrink.config;

import com.green.vrink.interceptor.AuthAdminInterceptor;
import com.green.vrink.interceptor.AuthEditorInterceptor;
import com.green.vrink.interceptor.AuthUserInterceptor;
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
    private final AuthUserInterceptor authUserInterceptor;
    private final AuthAdminInterceptor authAdminInterceptor;
    private final AuthEditorInterceptor authEditorInterceptor;
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        String[] authRequiredPaths = {
                "/payment/**",
                "/user/my-page",
                "/user/change-password",
                "/user/update/**",
                "/user/delete/**",
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
                "/report/**"
        };

        String[] authEditorPaths = {

                "/editor/request-list",
                "/editor/request-view",
                "/editor/editor-edit",
                "/editor/editor-price",
                "/editor/calculator/point",
                "/editor/calculate/point"


        };
        registry.addInterceptor(authUserInterceptor)
                .addPathPatterns(authRequiredPaths);
        registry.addInterceptor(authAdminInterceptor)
                .addPathPatterns("/admin/**");
        registry.addInterceptor(authEditorInterceptor)
                .addPathPatterns(authEditorPaths);
    }

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }
}
