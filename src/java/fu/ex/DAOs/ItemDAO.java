/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package fu.ex.DAOs;

import fu.ex.DTOs.Item;
import fu.ex.DBConnect.DBConnect;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;

/* item_id	int
category_name	varchar
title	nvarchar
description	nvarchar
date	date
time	time
location_lost_found	nvarchar
status	int
member_id	int
hashTag	varchar
item_type	nvarchar
isReport    bit
 */
/**
 *
 * @author ADMIN
 */
public class ItemDAO {

    public ArrayList<Item> getAllItem() throws Exception {
        String sql = "SELECT * FROM lost_found_item ORDER BY item_id DESC";
        Connection con = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        ArrayList<Item> list = null;
        try {
            con = new DBConnect().getConnection();
            if (con != null) {
                list = new ArrayList<>();
                pstm = con.prepareStatement(sql);
                rs = pstm.executeQuery();
                while (rs.next()) {
                    int item_id = rs.getInt("item_id");
                    String category_name = rs.getString("category_name");
                    String title = rs.getString("title");
                    String description = rs.getString("description");
                    Date date = rs.getDate("date");
                    String image = rs.getString("image");
                    String location_lost_found = rs.getString("location_lost_found");
                    int status = rs.getInt("status");          
                    int member_id = rs.getInt("member_id");    
                    String hashTag = rs.getString("hashTag");
                    String item_type = rs.getString("item_type");
                    Item item = new Item(item_id, category_name, title, description, date, image, location_lost_found, status, member_id, hashTag, item_type,rs.getBoolean("isReport"));
                    list.add(item);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (pstm != null) {
                pstm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return list;
    }
    // getAllItemByIsReport
    public ArrayList<Item> getAllItemByIsReport() throws Exception {
        String sql = "SELECT * FROM lost_found_item WHERE isReport = 1 ORDER BY item_id DESC";
        Connection con = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        ArrayList<Item> list = null;
        try {
            con = new DBConnect().getConnection();
            if (con != null) {
                list = new ArrayList<>();
                pstm = con.prepareStatement(sql);
                rs = pstm.executeQuery();
                while (rs.next()) {
                    int item_id = rs.getInt("item_id");
                    String category_name = rs.getString("category_name");
                    String title = rs.getString("title");
                    String description = rs.getString("description");
                    Date date = rs.getDate("date");
                    String image = rs.getString("image");
                    String location_lost_found = rs.getString("location_lost_found");
                    int status = rs.getInt("status");          
                    int member_id = rs.getInt("member_id");    
                    String hashTag = rs.getString("hashTag");
                    String item_type = rs.getString("item_type");
                    Item item = new Item(item_id, category_name, title, description, date, image, location_lost_found, status, member_id, hashTag, item_type,rs.getBoolean("isReport"));
                    list.add(item);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (pstm != null) {
                pstm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return list;
    }

    public Item getItemByID(int id) throws Exception {
        String sql = "SELECT * FROM lost_found_item WHERE item_id = ?";
        Connection con = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        Item result = null;
        try {
            con = new DBConnect().getConnection();
            if (con != null) {
                pstm = con.prepareStatement(sql);
                pstm.setInt(1, id);
                rs = pstm.executeQuery();
                if (rs.next()) {
                    int item_id = rs.getInt("item_id");
                    String category_name = rs.getString("category_name");
                    String title = rs.getString("title");
                    String description = rs.getString("description");
                    Date date = rs.getDate("date");
                    String image = rs.getString("image");
                    String location_lost_found = rs.getString("location_lost_found");
                    int status = rs.getInt("status");          
                    int member_id = rs.getInt("member_id");    
                    String hashTag = rs.getString("hashTag");
                    String item_type = rs.getString("item_type");
                    result = new Item(item_id, category_name, title, description, date, image, location_lost_found, status, member_id, hashTag, item_type,rs.getBoolean("isReport"));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (pstm != null) {
                pstm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return result;
    }


    public boolean deleteItem(int id) throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement pstm = null;
        String sql = "Delete From lost_found_item WHERE item_id=?";
        try {
            con = new DBConnect().getConnection();
            if (con != null) {
                pstm = con.prepareStatement(sql);
                pstm.setInt(1, id);
                pstm.executeUpdate();
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        } finally {
            if (pstm != null) {
                pstm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return false;
    }

    public boolean createItem(Item pd) throws SQLException, NamingException {
        Connection con = null;
        SimpleDateFormat da = new SimpleDateFormat("yyyy-MM-dd");

        PreparedStatement pstm = null;

        String sql = "INSERT INTO lost_found_item(category_name, title, description, date, image, location_lost_found, status, member_id, hashTag, item_type, isReport) VALUES(?,?,?,?,?,?,?,?,?,?,?)";
        try {
            con = new DBConnect().getConnection();
            if (con != null) {
                pstm = con.prepareStatement(sql);
                pstm.setString(1, pd.getCategory_name());
                pstm.setString(2, pd.getTitle());
                pstm.setString(3, pd.getDescription());
                pstm.setString(4, da.format(pd.getDate()));
              pstm.setString(5, pd.getImage());
                pstm.setString(6, pd.getLocation_lost_found());
                pstm.setInt(7, pd.getStatus());
                pstm.setInt(8, pd.getMember_id());
                pstm.setString(9, pd.getHashTag());
                pstm.setString(10, pd.getItem_type());
                pstm.setBoolean(11, pd.isIsReport());
                pstm.executeUpdate();
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        } finally {
            if (pstm != null) {
                pstm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return false;
    }

    public boolean updateItem(Item pd) throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement pstm = null;
        SimpleDateFormat da = new SimpleDateFormat("yyyy-MM-dd");
        String sql = "UPDATE lost_found_item SET category_name=?, title=?, description=?, date=?, image=?, location_lost_found=?, status=?, member_id=?, hashTag=?, item_type=? WHERE item_id=?";
        try {
            con = new DBConnect().getConnection();
            if (con != null) {
                pstm = con.prepareStatement(sql);
                pstm.setString(1, pd.getCategory_name());
                pstm.setString(2, pd.getTitle());
                pstm.setString(3, pd.getDescription());
                pstm.setString(4, da.format(pd.getDate()));
                pstm.setString(5, pd.getImage());
                pstm.setString(6, pd.getLocation_lost_found());
                pstm.setInt(7, pd.getStatus());
                pstm.setInt(8, pd.getMember_id());
                pstm.setString(9, pd.getHashTag());
                pstm.setString(10, pd.getItem_type());
                pstm.setInt(11, pd.getItem_id());
                pstm.executeUpdate();
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        } finally {
            if (pstm != null) {
                pstm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return false;
    }

    public List<Item> getAllItemByCategory(String category_name) throws SQLException {
        String sql = "SELECT * FROM lost_found_item WHERE category_name=?";
        Connection con = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        ArrayList<Item> list = null;
        try {
            con = new DBConnect().getConnection();
            if (con != null) {
                list = new ArrayList<>();
                pstm = con.prepareStatement(sql);
                pstm.setString(1, category_name);
                rs = pstm.executeQuery();
                while (rs.next()) {
                   int item_id = rs.getInt("item_id");
                     category_name = rs.getString("category_name");
                    String title = rs.getString("title");
                    String description = rs.getString("description");
                    Date date = rs.getDate("date");
                    String image = rs.getString("image");
                    String location_lost_found = rs.getString("location_lost_found");
                    int status = rs.getInt("status");          
                    int member_id = rs.getInt("member_id");    
                    String hashTag = rs.getString("hashTag");
                    String item_type = rs.getString("item_type");
                    Item item = new Item(item_id, category_name, title, description, date, image, location_lost_found, status, member_id, hashTag, item_type, rs.getBoolean("isReport") );
                    list.add(item);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (pstm != null) {
                pstm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return list;
    }
    // get all item by member id
    public List<Item> getAllItemByMember(int member_id) throws Exception {
        String sql = "SELECT * FROM lost_found_item WHERE member_id= ?";
        Connection con = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        ArrayList<Item> list = null;
        try {
            con = new DBConnect().getConnection();
            if (con != null) {
                list = new ArrayList<>();
                pstm = con.prepareStatement(sql);
                pstm.setInt(1, member_id);
                rs = pstm.executeQuery();
                while (rs.next()) {
                    int item_id = rs.getInt("item_id");
                    String category_name = rs.getString("category_name");
                    String title = rs.getString("title");
                    String description = rs.getString("description");
                    Date date = rs.getDate("date");
                    String image = rs.getString("image");
                    String location_lost_found = rs.getString("location_lost_found");
                    int status = rs.getInt("status");
                    int member_id1 = rs.getInt("member_id");
                    String hashTag = rs.getString("hashTag");
                    String item_type = rs.getString("item_type");
                    Item item = new Item(item_id, category_name, title, description, date, image, location_lost_found, status, member_id1, hashTag, item_type, rs.getBoolean("isReport"));
                    list.add(item);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (pstm != null) {
                pstm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return list;
    }
    // report item
    public boolean reportItem(int item_id) throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement pstm = null;
        String sql = "UPDATE lost_found_item SET isReport=? WHERE item_id=?";
        try {
            con = new DBConnect().getConnection();
            if (con != null) {
                pstm = con.prepareStatement(sql);
                pstm.setBoolean(1, true);
                pstm.setInt(2, item_id);
                pstm.executeUpdate();
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        } finally {
            if (pstm != null) {
                pstm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return false;
    }
    // remove Report
    public boolean removeReport(int item_id) throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement pstm = null;
        String sql = "UPDATE lost_found_item SET isReport=? WHERE item_id=?";
        try {
            con = new DBConnect().getConnection();
            if (con != null) {
                pstm = con.prepareStatement(sql);
                pstm.setBoolean(1, false);
                pstm.setInt(2, item_id);
                pstm.executeUpdate();
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        } finally {
            if (pstm != null) {
                pstm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return false;
    }
    // count item
    public int countItem() throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement pstm = null;
        String sql = "SELECT COUNT(*) FROM lost_found_item";
        int count = 0;
        try {
            con = new DBConnect().getConnection();
            if (con != null) {
                pstm = con.prepareStatement(sql);
                ResultSet rs = pstm.executeQuery();
                if (rs.next()) {
                    count = rs.getInt(1);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (pstm != null) {
                pstm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return count;
    }
    
    
}
