package cn.zk.fdjyq.interceptor;

import cn.zk.fdjyq.pojo.Privilege;
import cn.zk.fdjyq.pojo.Role;
import cn.zk.fdjyq.pojo.User;
import cn.zk.fdjyq.service.PrivilegeService;
import cn.zk.fdjyq.service.RolePrivilegeService;
import cn.zk.fdjyq.service.RoleService;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * @author XKK
 * @create 2018-05-24 9:43
 * @desc
 **/

public class LoginInterceptor extends HandlerInterceptorAdapter {
    @Autowired
    RoleService roleService;
    @Autowired
    RolePrivilegeService rolePrivilegeService;
    @Autowired
    PrivilegeService privilegeService;
    /**
     * 在业务处理器处理请求之前被调用
     * 如果返回false.
     *      从当前的拦截器往回执行所有的拦截器的afterCompletion(),再退出拦截器链
     * 如果返回true
     *      执行下一个拦截器，直到所有的拦截器都执行完毕
     *      再执行被拦截的Controller
     *      然后进入拦截器链
     *      从最后一个拦截器往回执行所有的postHandle()
     *      再从最后一个拦截器往回执行所有的afterCompletion()
     */
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HttpSession session = request.getSession();
        String contextPath = session.getServletContext().getContextPath();
        String[] noNeedAuthPage = new String[]{
                "/loginUI",
                "/captcha",
                "/noPrivilegeError",
                "/login",
                //"/index",
                };
        String uri = request.getRequestURI();
        uri = StringUtils.remove(uri, contextPath);
        System.out.println(uri);
      //  String method = StringUtils.substringAfterLast(uri,"/");
        if (!Arrays.asList(noNeedAuthPage).contains(uri)){
            User user = (User) session.getAttribute("user");
            if (null == user) {
                response.sendRedirect("loginUI");
                return false;
            }else {
                List<Privilege> allPrivilegeList =privilegeService.list();
                List<String> allprivilegeUrlList = new ArrayList<>();
                for (Privilege p:allPrivilegeList) {
                    allprivilegeUrlList.add(p.getUrl());
                }
                if (!allprivilegeUrlList.contains(uri))
                    return true;
                Role role = null;
                if (user.getRoleId() !=null ){
                    role = roleService.get(user.getRoleId());
                }
                List<Privilege> privilegeList =rolePrivilegeService.fillPrivilegeForRole(role);
                List<String> privilegeUrlList = new ArrayList<>();
                for (Privilege p:privilegeList) {
                    privilegeUrlList.add(p.getUrl());
                }
                if (privilegeUrlList.contains(uri)){
                   // response.sendRedirect("noPrivilegeError");
                   // return false;
                    return  true;
                }

                else{
                    response.sendRedirect("noPrivilegeError");
                    return false;

                 //   return  true;
                }
            }
        }
        return true;
    }


}
