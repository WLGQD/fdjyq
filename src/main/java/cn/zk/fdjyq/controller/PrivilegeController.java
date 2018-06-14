package cn.zk.fdjyq.controller;

import cn.zk.fdjyq.pojo.Privilege;
import cn.zk.fdjyq.pojo.Role;
import cn.zk.fdjyq.service.PrivilegeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * @author XKK
 * @create 2018-06-14 9:23
 * @desc
 **/
@Controller
public class PrivilegeController {

    @Autowired
    PrivilegeService privilegeService;


    /** 文件夹结构权限页面 */
    @RequestMapping("privilegetree_list")
    public String privilegeUI(Model model){

        // 准备数据 privilegeList
        List<Privilege> topPrivilegeList = privilegeService.getTopList();
        List<Privilege> privilegeList = privilegeService.fillUp(topPrivilegeList);
        model.addAttribute("privilegeList", privilegeList);
        return "privilege/privilegeUI";
    }
    /** add权限页面 */
    @RequestMapping("privilege_add")
    public String addPrivilege(Model model){

        // 准备数据 privilegeList
        List<Privilege> topPrivilegeList = privilegeService.getTopList();
        List<Privilege> privilegeList = privilegeService.fillUp(topPrivilegeList);
        model.addAttribute("privilegeList", privilegeList);
        return "privilege/privilegeUI";
    }



    /** 权限页面 ajax*/
    @RequestMapping("privilege_update")
    @ResponseBody
    public String privilege_update(@RequestParam("id")int id,@RequestParam("value")String value, @RequestParam("valueType")String valueType,Model model, HttpServletRequest request){
        String requestType = request.getHeader("X-Requested-With");
        if("XMLHttpRequest".equals(requestType)){
            System.out.println("AJAX请求..");
            System.out.println(id);
            System.out.println(value);System.out.println(valueType);
            return "success";
        }else{
            model.addAttribute("msg", "访问错误");
            return "msg/errMsg";
        }
        //return "success";
    }


    /** 权限页面 ajax*/
    @RequestMapping("privilege_delete")
    @ResponseBody
    public String privilege_delete(@RequestParam("privilegeIds") int[]privilegeIds,Model model){

            return "success";

    }
}