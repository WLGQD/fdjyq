package cn.zk.fdjyq.service.Impl;

import cn.zk.fdjyq.mapper.PrivilegeMapper;
import cn.zk.fdjyq.mapper.RoleMapper;
import cn.zk.fdjyq.mapper.RolePrivilegeMapper;
import cn.zk.fdjyq.pojo.*;
import cn.zk.fdjyq.service.PrivilegeService;
import cn.zk.fdjyq.service.RolePrivilegeService;
import cn.zk.fdjyq.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * @author XKK
 * @create 2018-05-23 10:38
 * @desc
 **/
@Service
public class RolePrivilegeServiceImpl implements RolePrivilegeService {
    @Autowired
    RolePrivilegeMapper rolePrivilegeMapper;
    @Autowired
    PrivilegeService privilegeService;
    @Override
    public void add(RolePrivilege c) {
        rolePrivilegeMapper.insert(c);
    }

    @Override
    public void delete(int id) {
        rolePrivilegeMapper.deleteByPrimaryKey(id);
    }

    @Override
    public void update(RolePrivilege u) {
        rolePrivilegeMapper.updateByPrimaryKeySelective(u);
    }

    @Override
    public RolePrivilege get(int id) {
        return rolePrivilegeMapper.selectByPrimaryKey(id);
    }

    @Override
    public List list() {
        RolePrivilegeExample example =new RolePrivilegeExample();
        example.setOrderByClause("id desc");
        return rolePrivilegeMapper.selectByExample(example);
    }


    @Override
    public  List<Privilege>  fillPrivilegeForRole(Role role) {
        List<Privilege> privileges = new ArrayList<>();
        if (role ==null) return privileges;
        RolePrivilegeExample example =new RolePrivilegeExample();
        example.createCriteria().andRoleIdEqualTo(role.getId());
        List<RolePrivilege>  s  =  rolePrivilegeMapper.selectByExample(example);
        for (RolePrivilege rp: s) {
            Privilege p = privilegeService.get(rp.getPrivilegeId());
            privileges.add(p);
        }
        role.setPrivileges(privileges);
        return privileges;
    }

    @Override
    public void deleteAndUpdate(int[] privilegeIds, int id) {
        RolePrivilegeExample example =new RolePrivilegeExample();
        example.createCriteria().andRoleIdEqualTo(id);

        List<RolePrivilege> rolePrivilegeList= rolePrivilegeMapper.selectByExample(example);
        for (RolePrivilege rp:rolePrivilegeList) {
            rolePrivilegeMapper.deleteByPrimaryKey(rp.getId());
        }
        for (int privilegeId:privilegeIds) {
            rolePrivilegeMapper.insert(new RolePrivilege(id,privilegeId));
        }
    }
}