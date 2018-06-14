package cn.zk.fdjyq.controller;

import cn.zk.fdjyq.annotation.Token;
import cn.zk.fdjyq.pojo.Role;
import cn.zk.fdjyq.pojo.Unit;
import cn.zk.fdjyq.pojo.User;
import cn.zk.fdjyq.service.RoleService;
import cn.zk.fdjyq.service.UserService;
import cn.zk.fdjyq.util.*;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.util.HtmlUtils;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.util.List;

/**
 * @author XKK
 * @create 2018-05-18 10:29
 * @desc
 **/
@Controller
public class UserController {

    @Autowired
    UserService userService;
    @Autowired
    RoleService roleService;

    @RequestMapping("user_list")
    public String list(Model model,Page page){
        //pageHelper分页插件
        PageHelper.offsetPage(page.getStart(),page.getCount());
        List<User> users = userService.list();
        int total = (int)new PageInfo<>(users).getTotal();
        page.setTotal(total);
        model.addAttribute("users",users);
        model.addAttribute("page",page);
        return "user/user_list";
    }

    @RequestMapping("login")
    public String login(@RequestParam("userName") String userName, @RequestParam("password") String password, Model model, HttpSession session) {
        userName = HtmlUtils.htmlEscape(userName);
        User user = userService.get(userName,password);
        if(null==user){
            model.addAttribute("msg", "账号密码错误");
            return "user/loginUI";
        }
        session.setAttribute("user", user);
        return "redirect:index";
    }
    @RequestMapping("captcha")
    @ResponseBody
    public void captcha(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        CaptchaUtil.outputCaptcha(request, response);
    }

    @RequestMapping("logout")
    public String logout(HttpSession session){
        session.removeAttribute("user");
        return "redirect:loginUI";
    }

    @RequestMapping("user_addUI")
    @Token(save = true)
    public String addUI(Model model) {
        List<Role> roleList = roleService.list();
        model.addAttribute("roleList",roleList);
        return "user/user_add";

    }

    @RequestMapping("user_add")
    @Token(remove = true)
    public String add(User u) {

        userService.add(u);

        return "redirect:/user_list";
    }

    @RequestMapping("user_delete")
    public String delete(int id) {

        userService.delete(id);

        return "redirect:/user_list";
    }

    @RequestMapping("user_edit")
    public String edit(Model model,int id) {
        List<Role> roleList = roleService.list();
        model.addAttribute("roleList",roleList);
        User user = userService.get(id);
        if (user !=null){
            model.addAttribute("u",user);
        }

        return "user/user_edit";
    }

    @RequestMapping("user_update")
    public String update(Model model,User user) {

        userService.update(user);

        return "redirect:/user_list";
    }
}