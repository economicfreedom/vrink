package com.green.vrink.interceptor;

import com.green.vrink.user.repository.model.User;
import com.green.vrink.util.Define;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Component
public class AuthAdminInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HttpSession session = request.getSession(false);
        User user = (User) session.getAttribute(Define.USER);

        if (user == null){
            response.sendRedirect("/");
            return false;
        }

        Integer level = user.getLevel();
        int _level = 0;
        if ((level == null || (_level = level) != 1)
        ) {
            response.sendRedirect("/");
            return false;
        }
        return true;
    }
}
