/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package fu.ex.DAOs;

import fu.ex.DBConnect.DBConnect;
import fu.ex.DTOs.ItemImg;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import javax.naming.NamingException;
import java.util.Date;
import java.sql.Time;
/**
 *
 * @author ADMIN
 */
public class ItemImgDAO {
    public ArrayList<ItemImg> getAllItemImg() throws Exception {
        String sql = "select img_id, item_id,description_url from item_img";
        Connection con = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        ArrayList<ItemImg> list = null;
        try {
            con = new DBConnect().getConnection();
            if (con != null) {
                list = new ArrayList<>();
                pstm = con.prepareStatement(sql);
                rs = pstm.executeQuery();
                while (rs.next()) {
                    int imgID = rs.getInt("img_id");
                    int itemID = rs.getInt("item_id");
                    String url = rs.getString("description_url");
                    ItemImg img = new ItemImg();
                    img.setImgID(imgID);
                    img.setItemID(itemID);
                    img.setUrl(url);
                    list.add(img);
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

    public boolean addItemImg(ItemImg img) throws SQLException, NamingException {
        Connection con = null;

        PreparedStatement pstm = null;

        String sql = "insert into item_img(item_id,description_url) values(?,?)";
        try {
            con = new DBConnect().getConnection();
            if (con != null) {
                pstm = con.prepareStatement(sql);
                pstm.setInt(1, img.getItemID());
                pstm.setString(2, img.getUrl());
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
    
}
