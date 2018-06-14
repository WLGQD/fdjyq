package cn.zk.fdjyq.controller;

import cn.zk.fdjyq.pojo.Privilege;
import cn.zk.fdjyq.pojo.Role;
import cn.zk.fdjyq.service.PrivilegeService;
import cn.zk.fdjyq.service.RolePrivilegeService;
import cn.zk.fdjyq.service.RoleService;
import cn.zk.fdjyq.util.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.HashSet;
import java.util.List;

/**
 * @author XKK
 * @create 2018-05-18 10:29
 * @desc
 **/
@Controller
public class RoleController {

    @Autowired
    RoleService roleService;
    @Autowired
    PrivilegeService privilegeService;

    @Autowired
    RolePrivilegeService rolePrivilegeService;

    @RequestMapping("role_list")
    public String list(Model model,Page page){
        //pageHelper分页插件
        PageHelper.offsetPage(page.getStart(),page.getCount());
        List<Role> roles = roleService.list();
        int total = (int)new PageInfo<>(roles).getTotal();
        page.setTotal(total);
        model.addAttribute("roles",roles);
        model.addAttribute("page",page);
        return "role/role_list";
    }
    @RequestMapping("role_addUI")
    public String addUI(Model model) {
        return "role/role_add";

    }

    @RequestMapping("role_add")
    public String add(Role u) {

        roleService.add(u);

        return "redirect:/role_list";
    }

    @RequestMapping("role_delete")
    public String delete(int id) {

        roleService.delete(id);

        return "redirect:/role_list";
    }

    @RequestMapping("role_edit")
    public String edit(Model model,int id) {
        Role role = roleService.get(id);
        if (role !=null){
            model.addAttribute("u",role);
        }

        return "role/role_edit";
    }

    @RequestMapping("role_update")
    public String update(Role role) {

        roleService.update(role);

        return "redirect:/role_list";
    }




    /** 设置权限页面 */
    @RequestMapping("role_PrivilegeUI")
    public String setPrivilegeUI(Model model,int id){
        // 准备回显的数据
        Role role = roleService.get(id);
        rolePrivilegeService.fillPrivilegeForRole(role);
        model.addAttribute("role",role);
        int[] privilegeIds= null;
        if (role.getPrivileges() != null) {
            privilegeIds = new int[role.getPrivileges().size()];
            int index = 0;
            for (Privilege priv : role.getPrivileges()) {
                privilegeIds[index++] = priv.getId();
            }
        }

        // 准备数据 privilegeList
        List<Privilege> topPrivilegeList = privilegeService.getTopList();
        List<Privilege> privilegeList = privilegeService.fillUp(topPrivilegeList);
        model.addAttribute("privilegeList", privilegeList);
        model.addAttribute("privilegeIds", privilegeIds);
        return "role/setPrivilegeUI";
    }

    /** 设置权限 */
    @RequestMapping("role_setPrivilege")
    public String setPrivilege(@RequestParam("privilegeIds") int[]privilegeIds,int id) throws Exception {
        // 1，从数据库中获取原对
        rolePrivilegeService.deleteAndUpdate(privilegeIds,id);
        // 3，更新到数据库
    //    roleService.update(role);
    //    System.out.println(2<<3);
        return "redirect:/role_list";
    }
}