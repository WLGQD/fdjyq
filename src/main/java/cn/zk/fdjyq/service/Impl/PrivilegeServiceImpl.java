package cn.zk.fdjyq.service.Impl;

import cn.zk.fdjyq.mapper.PrivilegeMapper;
import cn.zk.fdjyq.pojo.Privilege;
import cn.zk.fdjyq.pojo.PrivilegeExample;
import cn.zk.fdjyq.pojo.Role;
import cn.zk.fdjyq.service.PrivilegeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

/**
 * @author XKK
 * @create 2018-05-21 16:43
 * @desc
 **/
@Service
public class PrivilegeServiceImpl implements PrivilegeService {
@Autowired
    PrivilegeMapper privilegeMapper;
    @Override
    public void add(Privilege c) {
        privilegeMapper.insert(c);
    }

    @Override
    public void delete(int id) {
        privilegeMapper.deleteByPrimaryKey(id);
    }

    @Override
    public void update(Privilege c) {
        privilegeMapper.updateByPrimaryKeySelective(c);
    }

    @Override
    public Privilege get(int id) {
        Privilege u = privilegeMapper.selectByPrimaryKey(id);
        fillParent(u);
        return u;
    }

    @Override
    public List list() {
        PrivilegeExample example =new PrivilegeExample();
        example.setOrderByClause("id desc");
        List<Privilege> result = privilegeMapper.selectByExample(example);
        for (Privilege u: result ) {
            fillParent(u);
        }
        return result;
    }
    @Override
    public void fillParent(Privilege u){
        if (null != u.getParentId()){
            Privilege parent = getPrivilege(u.getParentId());
            if (null != parent)
                u.setParent(parent);
        }
    }

    @Override
    public void fillChildren(Privilege u) {
        List<Privilege> ch = getChildrenList(u);
        u.setChildren(ch);
    }

    public List<Privilege> getChildrenList(Privilege u) {
        PrivilegeExample example =new PrivilegeExample();
        example.createCriteria().andParentIdEqualTo(u.getId());
        return  privilegeMapper.selectByExample(example);

    }
    @Override
    public List<Privilege> getTopList() {
        PrivilegeExample example =new PrivilegeExample();
        example.createCriteria().andParentIdIsNull();
        List<Privilege> result =  privilegeMapper.selectByExample(example);
        for (Privilege u: result ) {
            fillChildren(u);
        }
         return result;
    }

    public List<Privilege> getAllList() {
        PrivilegeExample example =new PrivilegeExample();
        example.createCriteria().andParentIdIsNull();
        List<Privilege> result =  privilegeMapper.selectByExample(example);
        for (Privilege u: result ) {
            List<Privilege> getChildrenList = getChildrenList(u);
        }
        return result;
    }
    private  void fillUpLoop(Collection<Privilege> topList) {
        for (Privilege top : topList) {
            // 顶点
            List<Privilege> ChildrenList = getChildrenList(top);
            top.setChildren(ChildrenList);

            fillUpLoop(ChildrenList);
        }
    }
    public List<Privilege> fillUp(List<Privilege> topList){
        fillUpLoop(topList);
        return topList;
    }



    private Privilege getPrivilege(int id) {
        return privilegeMapper.selectByPrimaryKey(id);
    }
    /**
     * 遍历部门树，把所有的部门遍历出来放到同一个集合中返回，并且其中所有部门的名称都修改了，以表示层次。
     *
     * @param topList
     * @return
     */
    public  List<Privilege> getTreePrivileges(List<Privilege> topList) {
        List<Privilege> list = new ArrayList<Privilege>();
        walkDepartmentTreeList(topList, "┣ ", list);
        return list;
    }

    @Override
    public Collection<Privilege> getAllPrivilegeUrls() {
        //SELECT DISTINCT p.url FROM Privilege p WHERE p.url IS NOT NULL
        PrivilegeExample example =new PrivilegeExample();
        example.setDistinct(true);
        example.createCriteria().andUrlIsNotNull();
        return privilegeMapper.selectByExample(example);
    }


    /**
     * 遍历部门树，把遍历出的部门信息放到指定的集合中
     *
     * @param topList
     */
    private  void walkDepartmentTreeList(Collection<Privilege> topList,
                                               String prefix, List<Privilege> list) {
        for (Privilege top : topList) {
            // 顶点
            Privilege copy = new Privilege(); // 使用副本，因为原对象在Session中
            copy.setId(top.getId());
            copy.setName(prefix + top.getName());
            list.add(copy); // 把副本添加到同一个集合中
            List<Privilege> result = getChildrenList(top);
            // 子树
            walkDepartmentTreeList(result, "　" + prefix, list); // 使用全角的空格
        }
    }
}