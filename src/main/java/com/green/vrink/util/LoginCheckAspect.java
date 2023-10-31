package com.green.vrink.util;

import com.green.vrink.user.repository.model.User;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpSession;

@Aspect
@Component
public class LoginCheckAspect {
    @Around("@annotation(LoginCheck)")
    public Object userSessionCheck(ProceedingJoinPoint joinPoint) throws Throwable {
        ServletRequestAttributes attr = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        HttpSession session = attr.getRequest().getSession(false);

        User user = (User) session.getAttribute("USER");
        System.out.println();
        if (user == null) {
            return ResponseEntity.badRequest().body("로그인이 필요한 서비스입니다");
        }

        // Proceed with the method invocation
        return joinPoint.proceed();
    }
}
