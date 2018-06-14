package cn.zk.fdjyq.util;

import cn.zk.fdjyq.pojo.Privilege;
import cn.zk.fdjyq.service.Impl.PrivilegeServiceImpl;
import cn.zk.fdjyq.service.PrivilegeService;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.ContextLoader;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import javax.servlet.ServletContext;
import java.util.ArrayList;
import java.util.List;

/**
 * @author XKK
 * @create 2018-06-13 14:25
 * @desc
 **/

public class PrivilegeUtils {

    public static List<String>  getAllprivilegeUrlList(){
        WebApplicationContext webApplicationContext = ContextLoader.getCurrentWebApplicationContext();
        ServletContext servletContext = webApplicationContext.getServletContext();

        // 准备数据：topPrivilegeList
        PrivilegeService privilegeService = new PrivilegeServiceImpl();
        List<Privilege> allPrivilegeList =privilegeService.list();
        List<String> allprivilegeUrlList = new ArrayList<>();
        for (Privilege p:allPrivilegeList) {
            allprivilegeUrlList.add(p.getUrl());
        }
        servletContext.setAttribute("allprivilegeUrlList",allprivilegeUrlList);
        return allprivilegeUrlList;
    }
}