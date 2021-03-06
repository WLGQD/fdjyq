package cn.zk.fdjyq.interceptor;

import cn.zk.fdjyq.annotation.Token;
import cn.zk.fdjyq.pojo.User;
import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.lang.reflect.Method;
import java.util.Arrays;
import java.util.UUID;

public class AvoidDuplicateSubmissionInterceptor extends HandlerInterceptorAdapter {
      
    public static Logger logger = Logger.getLogger(AvoidDuplicateSubmissionInterceptor.class);
  
    @Override  
    public boolean preHandle(HttpServletRequest request,
                             HttpServletResponse response, Object handler) throws Exception {

        HttpSession session = request.getSession();
        String contextPath = session.getServletContext().getContextPath();
        String[] noNeedAuthPage = new String[]{
                "/loginUI",
                "/captcha",
                "/noPrivilegeError",
                "/login",
               // "/index",
        };
        String uri = request.getRequestURI();
        uri = StringUtils.remove(uri, contextPath);
        User user = (User) request.getSession().getAttribute("user");

        if (user != null) {
            if (uri.contains("_list")) {
                return true;
            }
            if (Arrays.asList(noNeedAuthPage).contains(uri)) {
                return true;
            }
            if (handler instanceof HandlerMethod){
                HandlerMethod handlerMethod = (HandlerMethod) handler;
                Method method = handlerMethod.getMethod();
                Token annotation = method.getAnnotation(Token.class);
                if (annotation != null) {
                    boolean needSaveSession = annotation.save();
                    if (needSaveSession) {
                        request.getSession(true).setAttribute("token", UUID.randomUUID().toString());
                    }
                    boolean needRemoveSession = annotation.remove();
                    if (needRemoveSession) {
                        if (isRepeatSubmit(request)) {
                            logger.warn("please don't repeat submit,[user:" + user.getUserName() + ",url:"
                                    + request.getServletPath() + "]");
                            response.sendRedirect("repeatSubmit");
                            return false;
                        }
                        request.getSession(false).removeAttribute("token");
                    }
                }
            }
        }  
        return true;  
    }  
      
    public boolean isRepeatSubmit (HttpServletRequest request) {  
        String serverToken = (String) request.getSession(true).getAttribute("token");  
          
        if (serverToken == null) {  
            return true;  
        }  
        //String clientToken = SpringMvcUtils.getParameter("token");
        String clientToken = request.getParameter("token");
        if (clientToken == null) {  
            return true;  
        }  
        if (!serverToken.equals(clientToken)) {  
            return true;  
        }  
        return false;  
    }  
  
      
}  