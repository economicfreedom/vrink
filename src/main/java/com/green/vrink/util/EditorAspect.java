package com.green.vrink.util;

import com.green.vrink.user.repository.model.User;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpSession;

@Aspect
@Component
public class EditorAspect {
    @Around("@annotation(EditorCheck)")
    public Object userSessionCheck(ProceedingJoinPoint joinPoint) throws Throwable {
        ServletRequestAttributes attr = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        HttpSession session = attr.getRequest().getSession(false);

        User user = (User) session.getAttribute("USER");



      if (user != null) {
            if (user.getEditor().equals("standard")) {
                return ResponseEntity.badRequest().body("작가만 접근 가능합니다.");
            }
        } else {
            return ResponseEntity.badRequest().body("작가만 접근 가능합니다..");
        }

        return joinPoint.proceed();
    }
}
