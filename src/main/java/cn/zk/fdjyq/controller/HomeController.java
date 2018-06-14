package cn.zk.fdjyq.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author XKK
 * @create 2018-05-19 13:47
 * @desc
 **/
@Controller
public class HomeController {

    @RequestMapping("index")
    public String index() throws Exception {
        return "home/index";
    }

    @RequestMapping("loginUI")
    public String loginUI(Model model) {

        return "user/loginUI";
    }

    @RequestMapping("noPrivilegeError")
    public String noPrivilegeError() {

        return "msg/noPrivilegeError";
    }

    @RequestMapping("repeatSubmit")
    public String repeatSubmit() {

        return "msg/repeatSubmit";
    }
}