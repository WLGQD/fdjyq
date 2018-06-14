package cn.zk.fdjyq.service;

import cn.zk.fdjyq.pojo.Unit;

import java.util.List;

/**
 * @author XKK
 * @create 2018-05-21 16:42
 * @desc
 **/

public interface UnitService {

    void add(Unit c);
    void delete(int id);
    void update(Unit c);
    Unit get(int id);
    List list();
    Unit fillParent(Unit u);
    List fillChildren(Unit u);

    List<Unit> getTopList();

    List<Unit> getTreeUnits(List<Unit> topList);
}