package cn.zk.fdjyq.test;
import org.junit.jupiter.api.Test;

import java.sql.*;

/**
 * @author XKK
 * @create 2018-05-18 10:11
 * @desc
 **/

public class InsertData {

    @Test
    public void insertTest() throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/zk_fdjyq","root","123");
        Statement ps =  conn.createStatement();
        for (int i=0;i<10;i++){
            String sqlFormat = "insert into user(id,name,password) values(null,'测试用户%d','mima%d')";
            String sql = String.format(sqlFormat,i,i);
            ps.execute(sql);
        }
        System.out.println("插入10条数据");
    }
}