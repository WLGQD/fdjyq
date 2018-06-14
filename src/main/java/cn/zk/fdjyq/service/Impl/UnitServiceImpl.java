package cn.zk.fdjyq.service.Impl;

import cn.zk.fdjyq.mapper.UnitMapper;
import cn.zk.fdjyq.pojo.Unit;
import cn.zk.fdjyq.pojo.UnitExample;
import cn.zk.fdjyq.pojo.UserExample;
import cn.zk.fdjyq.service.UnitService;
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
public class UnitServiceImpl implements UnitService {
@Autowired
    UnitMapper unitMapper;
    @Override
    public void add(Unit c) {
        unitMapper.insert(c);
    }

    @Override
    public void delete(int id) {
        unitMapper.deleteByPrimaryKey(id);
    }

    @Override
    public void update(Unit c) {
        unitMapper.updateByPrimaryKeySelective(c);
    }

    @Override
    public Unit get(int id) {
        Unit u = unitMapper.selectByPrimaryKey(id);
        fillParent(u);
        return u;
    }

    @Override
    public List list() {
        UnitExample example =new UnitExample();
        example.setOrderByClause("id desc");
        List<Unit> result = unitMapper.selectByExample(example);
        for (Unit u: result ) {
            fillParent(u);
            u.setChildren(fillChildren(u));
        }
        return result;
    }
    @Override
    public Unit fillParent(Unit u){
        if (null != u.getParentId()){
            Unit parent = getUnit(u.getParentId());
            if (null != parent)
                u.setParent(parent);
            return parent;
        }
        return null;
    }

    @Override
    public List fillChildren(Unit u) {
        UnitExample example =new UnitExample();
        example.createCriteria().andParentIdEqualTo(u.getId());
        return unitMapper.selectByExample(example);
    }

    @Override
    public List<Unit> getTopList() {
        UnitExample example =new UnitExample();
        example.createCriteria().andParentIdIsNull();
        return unitMapper.selectByExample(example);
    }



    private Unit getUnit(int id) {
        return unitMapper.selectByPrimaryKey(id);
    }
    /**
     * 遍历部门树，把所有的部门遍历出来放到同一个集合中返回，并且其中所有部门的名称都修改了，以表示层次。
     *
     * @param topList
     * @return
     */
    public  List<Unit> getTreeUnits(List<Unit> topList) {
        List<Unit> list = new ArrayList<Unit>();
        walkDepartmentTreeList(topList, "┣ ", list);
        return list;
    }

    /**
     * 遍历部门树，把遍历出的部门信息放到指定的集合中
     *
     * @param topList
     */
    private  void walkDepartmentTreeList(Collection<Unit> topList,
                                               String prefix, List<Unit> list) {
        for (Unit top : topList) {
            // 顶点
            Unit copy = new Unit(); // 使用副本，因为原对象在Session中
            copy.setId(top.getId());
            copy.setName(prefix + top.getName());
            list.add(copy); // 把副本添加到同一个集合中
            List<Unit> result = fillChildren(top);
            // 子树
            walkDepartmentTreeList(result, "　" + prefix, list); // 使用全角的空格
        }
    }
}