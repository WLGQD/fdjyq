package cn.zk.fdjyq.controller;

import cn.zk.fdjyq.annotation.Token;
import cn.zk.fdjyq.pojo.Unit;

import cn.zk.fdjyq.service.UnitService;

import cn.zk.fdjyq.util.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.List;

/**
 * @author XKK
 * @create 2018-05-18 10:29
 * @desc
 **/
@Controller
public class UnitController {

    @Autowired
    UnitService unitService;


    @RequestMapping("unit_list")
    public String list(Model model,Page page){
        //pageHelper分页插件
        PageHelper.offsetPage(page.getStart(),page.getCount());
        List<Unit> units= unitService.list();
        int total = (int)new PageInfo<>(units).getTotal();
        page.setTotal(total);
        model.addAttribute("units",units);
        model.addAttribute("page",page);
        return "unit/unit_list";
    }

    @RequestMapping("unit_add")
    @Token(remove = true)
    public String add(Unit u) {
        UpDateBmCode(u);
        unitService.add(u);

        return "redirect:/unit_list";
    }
    @RequestMapping("unit_addUI")
    @Token(save = true)
    public String addUI(Model model) {
        List<Unit> topList = unitService.getTopList();
        List<Unit> unitList= unitService.getTreeUnits(topList);
        model.addAttribute("unitList",unitList);
        return "unit/unit_add";

    }
    @RequestMapping("unit_delete")
    public String delete(int id) {

        unitService.delete(id);

        return "redirect:/unit_list";
    }

    @RequestMapping("unit_edit")
    @Token(save = true)
    public String edit(Model model,int id) {
        Unit unit = unitService.get(id);
        List<Unit> topList = unitService.getTopList();
        List<Unit> unitTree= unitService.getTreeUnits(topList);
        List<Unit> unitList= new ArrayList<>();
        for (Unit u:unitTree) {
            if (u.getId() != id)
                unitList.add(u);
        }
        model.addAttribute("unitList",unitList);
        if (unit !=null){
            model.addAttribute("u",unit);
        }

        return "unit/unit_edit";
    }

    @RequestMapping("unit_update")
    @Token(remove = true)
    public String update(Model model,Unit unit) {
        UpDateBmCode(unit);
        unitService.update(unit);

        return "redirect:/unit_list";
    }


    private void UpDateBmCode(Unit u){
        if (u.getParentId()!=null){
            Unit parent = unitService.get(u.getParentId());
            u.setBmCode(parent.getCode()+u.getCode());
        }else {
            u.setBmCode(u.getCode());
        }
    }
}