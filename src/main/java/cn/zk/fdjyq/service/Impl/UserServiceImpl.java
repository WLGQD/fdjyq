package cn.zk.fdjyq.service.Impl;

import cn.zk.fdjyq.mapper.RoleMapper;
import cn.zk.fdjyq.mapper.UserMapper;
import cn.zk.fdjyq.pojo.Role;
import cn.zk.fdjyq.pojo.User;
import cn.zk.fdjyq.pojo.UserExample;
import cn.zk.fdjyq.service.RoleService;
import cn.zk.fdjyq.service.UserService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author XKK
 * @create 2018-05-10 10:38
 * @desc
 **/
@Service
public class UserServiceImpl implements UserService {
    @Autowired
    UserMapper userMapper;
    @Autowired
    RoleService roleService;
    @Override
    public void add(User c) {
        userMapper.insert(c);
    }

    @Override
    public void delete(int id) {
        userMapper.deleteByPrimaryKey(id);
    }

    @Override
    public void update(User u) {
        userMapper.updateByPrimaryKeySelective(u);
    }

    @Override
    public User get(int id) {
        return userMapper.selectByPrimaryKey(id);
    }

    @Override
    public List list() {
        UserExample example =new UserExample();
        example.setOrderByClause("id desc");
        List<User> us  =  userMapper.selectByExample(example);
        fill(us);
        return us;
    }

    @Override
    public boolean isExist(String name) {
        UserExample example =new UserExample();
        example.createCriteria().andUserNameEqualTo(name);
        List<User> result= userMapper.selectByExample(example);
        if(!result.isEmpty())
            return true;
        return false;
    }

    @Override
    public User get(String name, String password) {
        UserExample example =new UserExample();
        example.createCriteria().andUserNameEqualTo(name).andPasswordEqualTo(password);
        List<User> result= userMapper.selectByExample(example);
        if(result.isEmpty())
            return null;
        return result.get(0);
    }


    private void fill(User u){
        if (u.getRoleId()!=null){
            Role r = roleService.get(u.getRoleId());
            if (r!=null){
                u.setRole(r);
            }
        }
    }
    private void fill(List<User> us){
        for (User u:us) {
            fill(u);
        }
    }
}