/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package fu.ex.DTOs;
import java.util.Date;
import java.sql.Time;
/**
 *
 * @author ADMIN
 */
public class ItemImg extends Item {
    int imgID;
    int itemID;
    String url;

    public ItemImg() {
        super();
    }

    public ItemImg(int imgID, int itemID, String url, int item_id, String category_name, String title, String description, Date date, String image, String location_lost_found, int status, int member_id, String hashTag, String item_type, boolean isReport) {
        super(item_id, category_name, title, description, date, image, location_lost_found, status, member_id, hashTag, item_type, isReport);
        this.imgID = imgID;
        this.itemID = itemID;
        this.url = url;
    }

    

    public int getImgID() {
        return imgID;
    }

    public void setImgID(int imgID) {
        this.imgID = imgID;
    }

    public int getItemID() {
        return itemID;
    }

    public void setItemID(int itemID) {
        this.itemID = itemID;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }
    
}
