/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package fu.ex.DAOs;

import fu.ex.DBConnect.DBConnect;
import fu.ex.DTOs.Member;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ADMIN
 */
/* member_id	int	Unchecked
        role_id	int	Checked
        username	varchar(50)	Unchecked
        password	varchar(50)	Unchecked
        fullName	nvarchar(50)	Unchecked
        avatar	varchar(1000)	Checked
        contact	varchar(10)	Unchecked
        email	varchar(50)	Unchecked
        status	bit	Unchecked
        muted	bit	Checked*/
public class MemberDAO {

    private Connection conn;
    private PreparedStatement preStm;
    private ResultSet rs;

    private static final String LOGIN = "SELECT role_id ,username, fullName, avatar, contact, status, muted FROM Member "
            + "WHERE email = ? AND password = ?";

    public MemberDAO() {
    }

    private void closeConnection() throws Exception {
        if (rs != null) {
            rs.close();
        }
        if (preStm != null) {
            preStm.close();
        }
        if (conn != null) {
            conn.close();
        }
    }

//    public Member getMemberByEmail(String email, String password) throws Exception {
//        Member m = null;
//        try {
//            DBConnect db = new DBConnect();
//            preStm = conn.prepareStatement(LOGIN);
//            preStm.setString(1, email);
//            preStm.setString(2, password);
//            rs = preStm.executeQuery();
//            boolean check = rs.next();
//            if (check) {
//                m = new Member(rs.getInt("member_id"), rs.getInt("role_id"), rs.getString("username"), password, rs.getString("fullName"), rs.getString("avatar"), rs.getString("contact"), email, rs.getBoolean("status"), rs.getBoolean("muted"));
//            }
//        } catch (Exception e) {
//        } finally {
//            closeConnection();
//        }
//
//        return m;
//    }

    public List<Member> getAllMembers() throws Exception {
        ArrayList<Member> result = null;
        try {
            String sql = "select member_id, role_id, username, password, fullName, avatar, contact, email, status, muted from member";
            DBConnect db = new DBConnect();
            conn = db.getConnection();
            preStm = conn.prepareStatement(sql);
            rs = preStm.executeQuery();
            result = new ArrayList<>();
            Member m = null;
            while (rs.next()) {
                m = new Member(rs.getInt("member_id"), rs.getInt("role_id"), rs.getString("username"), rs.getString("password"), rs.getString("fullName"), rs.getString("avatar"), rs.getString("contact"), rs.getString("email"), rs.getBoolean("status"), rs.getBoolean("muted"));
                result.add(m);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeConnection();
        }
        return result;
    }

    public boolean createMember(Member m) throws Exception {
        String sql = "Insert Into member Values(?,?,?,?,?,?,?,?,?)";
        try {
            conn = new DBConnect().getConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setInt(1, m.getRole_id());
            preStm.setString(2, m.getUsername());
            preStm.setString(3, m.getPassword());
            preStm.setString(4, m.getFullName());
            preStm.setString(5, m.getAvatar());
            preStm.setString(6, m.getContact());
            preStm.setString(7, m.getEmail());
            preStm.setBoolean(8, m.isStatus());
            preStm.setBoolean(9, false);
            preStm.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        } finally {
            closeConnection();
        }
    }

//    public List<Member> getNormalMembers() throws Exception {
//        ArrayList<Member> result = null;
//        try {
//            String sql = "select member_id, role_id, username, password, fullName, avatar, contact, email, status,muted from member where role_id=2";
//            DBConnect db = new DBConnect();
//            conn = db.getConnection();
//            preStm = conn.prepareStatement(sql);
//            rs = preStm.executeQuery();
//            result = new ArrayList<>();
//            Member m = null;
//            while (rs.next()) {
//                m = new Member(rs.getInt("member_id"), rs.getInt("role_id"), rs.getString("username"), rs.getString("password"), rs.getString("fullName"), rs.getString("avatar"), rs.getString("contact"), rs.getString("email"), rs.getBoolean("status"), rs.getBoolean("muted") );
//                result.add(m);
//            }
//        }catch (Exception e) {
//            e.printStackTrace();}
//        finally {
//            closeConnection();
//        }
//        return result;
//    }
    public boolean delete(int id) throws Exception {
        String sql = "delete from member where member_id=?";
        try {
            conn = new DBConnect().getConnection();
            if (conn != null) {
                preStm = conn.prepareStatement(sql);
                preStm.setInt(1, id);
                preStm.executeUpdate();
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        } finally {
            closeConnection();
        }
        return false;
    }

    public boolean updateMember(Member m) {
        String sql = "Update member SET role_id=?, username=?, password=?, fullName=?, avatar=?, contact=?, email=?, status=?, muted=? WHERE member_id=?";
        try {
            conn = new DBConnect().getConnection();
            if (conn != null) {
                preStm = conn.prepareStatement(sql);
                preStm.setInt(1, m.getRole_id());
                preStm.setString(2, m.getUsername());
                preStm.setString(3, m.getPassword());
                preStm.setString(4, m.getFullName());
                preStm.setString(5, m.getAvatar());
                preStm.setString(6, m.getContact());
                preStm.setString(7, m.getEmail());
                preStm.setBoolean(8, m.isStatus());
                preStm.setBoolean(9, m.isMuted());
                preStm.setInt(10, m.getMember_id());

                preStm.executeUpdate();
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    // get member by id
    public Member getMemberById(int id) throws Exception {
        Member m = null;
        String sql = "select member_id, role_id, username, password, fullName, avatar, contact, email, status,muted from member where member_id=?";
        try {
            conn = new DBConnect().getConnection();
            if (conn != null) {
                preStm = conn.prepareStatement(sql);
                preStm.setInt(1, id);
                rs = preStm.executeQuery();
                if (rs.next()) {
                    m = new Member(rs.getInt("member_id"), rs.getInt("role_id"), rs.getString("username"), rs.getString("password"), rs.getString("fullName"), rs.getString("avatar"), rs.getString("contact"), rs.getString("email"), rs.getBoolean("status"), rs.getBoolean("muted"));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeConnection();
        }
        return m;
    }
//    public boolean getMemberByEmail(String mail){
//        boolean check = true;
//        String query ="select"
//        
//        return check;
//    }

    public static void main(String[] args) throws Exception {
        MemberDAO dao = new MemberDAO();
        System.out.println(dao.getAllMembers());

    }
    // count user
    public int countUser() throws Exception {
        int count = 0;
        String sql = "select count(*) from member";
        try {
            conn = new DBConnect().getConnection();
            if (conn != null) {
                preStm = conn.prepareStatement(sql);
                rs = preStm.executeQuery();
                if (rs.next()) {
                    count = rs.getInt(1);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeConnection();
        }
        return count;
    }
    // count user by status 0
    public int countUserByStatus0() throws Exception {
        int count = 0;
        String sql = "select count(*) from member where status=0";
        try {
            conn = new DBConnect().getConnection();
            if (conn != null) {
                preStm = conn.prepareStatement(sql);
                rs = preStm.executeQuery();
                if (rs.next()) {
                    count = rs.getInt(1);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
       
        } finally {
            closeConnection();
        }
        return count;
    }
    // count user by mute
    public int countUserByMute() throws Exception {
        int count = 0;
        String sql = "select count(*) from member where muted=1";
        try {
            conn = new DBConnect().getConnection();
            if (conn != null) {
                preStm = conn.prepareStatement(sql);
                rs = preStm.executeQuery();
                if (rs.next()) {
                    count = rs.getInt(1);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeConnection();
        }
        return count;
    }


}
