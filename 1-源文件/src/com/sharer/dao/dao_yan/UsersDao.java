package com.sharer.dao.dao_yan;
import com.sharer.entity.entity_yan.User;
import com.sharer.util.DatabaseUtil;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;



public class UsersDao {
     
    
    public List<User> SelectUsers() {

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<User> list = new ArrayList();

        try {
            con = DatabaseUtil.getConnection();
            ps = con.prepareStatement("select * from users ");
            rs = ps.executeQuery();
            while (rs.next()) { //next()判断有没有下一行，并移动到下一行
                int uid = rs.getInt(1);
                String uname = rs.getString(2);
                String ugender = rs.getString(3);
                String uemail = rs.getString(4);
                String uphone = rs.getString(5);
                String ubirth = rs.getString(6);
                String img = rs.getString(7);
                String upwd = rs.getString(8);
                int ustatus=rs.getInt(9);
                User user = new User(uid, uname, ugender, uemail, uphone, ubirth, upwd,ustatus);
                user.setUimg(img);
                list.add(user);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            DatabaseUtil.close(rs, ps, con);
        }
        return list;
    }
    //通过用户id查询用户状态
      public int SelectUserstatusByid(int id) {

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        int  status = 0;
        try {
            con = DatabaseUtil.getConnection();
            String sql = " select Ustatus from users where Uid=?";
            ps = con.prepareStatement(sql);
            ps.setInt(1,id);
            rs=ps.executeQuery();
            while (rs.next()) {
           status=rs.getInt(1);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            DatabaseUtil.close(rs, ps, con);
        }
         return status;
    }
            
}
