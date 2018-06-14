package cn.zk.fdjyq.service.Impl;

import cn.zk.fdjyq.mapper.RoleMapper;
import cn.zk.fdjyq.pojo.RoleExample;
import cn.zk.fdjyq.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.zk.fdjyq.pojo.Role;
import java.util.List;

/**
 * @author XKK
 * @create 2018-05-23 10:38
 * @desc
 **/
@Service
public class RoleServiceImpl implements RoleService {
    @Autowired
    RoleMapper roleMapper;

    @Override
    public void add(Role c) {
        roleMapper.insert(c);
    }

    @Override
    public void delete(int id) {
        roleMapper.deleteByPrimaryKey(id);
    }

    @Override
    public void update(Role u) {
        roleMapper.updateByPrimaryKeySelective(u);
    }

    @Override
    public Role get(int id) {
        return roleMapper.selectByPrimaryKey(id);
    }

    @Override
    public List list() {
        RoleExample example =new RoleExample();
        example.setOrderByClause("id desc");
        return roleMapper.selectByExample(example);
    }
}