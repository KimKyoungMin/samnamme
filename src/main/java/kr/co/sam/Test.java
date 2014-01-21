package kr.co.sam;

import java.sql.SQLException;

import kr.co.sam.dao.UserDao;
import kr.co.sam.dto.User;

public class Test {
    /**
     * @param args
     * @throws SQLException 
     * @throws ClassNotFoundException
     */
    public static void main(String[] args) throws ClassNotFoundException, SQLException {
           // TODO Auto-generated method stub
           UserDao dao = new UserDao();
           User user = new User();
           user.setId("WhiteShip");
           user.setName("TestName");
           user.setPassword("married");
           dao.add(user);
     
          System.out.println("등록 성공 : " + user.getId());
           User user2 = dao.get(user.getId());
           System.out.println(user2.getName());
           System.out.println(user2.getPassword());
           System.out.println(user2.getId() + " 조회 성공");
    }
}
