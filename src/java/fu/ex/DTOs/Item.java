/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package fu.ex.DTOs;

import java.util.Date;
import java.sql.Time;

/**
 *
 * @author Tung
 */
public class Item {

    private int item_id;
    private String category_name;
    private String title;
    private String description;
    private Date date;
    private String image;
    private String location_lost_found;
    private int status;
    private int member_id;
    private String hashTag;
    private String item_type;
    private boolean isReport;

    public Item(int item_id, String category_name, String title, String description, Date date, String image, String location_lost_found, int status, int member_id, String hashTag, String item_type, boolean isReport) {
        this.item_id = item_id;
        this.category_name = category_name;
        this.title = title;
        this.description = description;
        this.date = date;
        this.image = image;
        this.location_lost_found = location_lost_found;
        this.status = status;
        this.member_id = member_id;
        this.hashTag = hashTag;
        this.item_type = item_type;
        this.isReport = isReport;
    }

    

    public Item() {

    }

    public int getItem_id() {
        return item_id;
    }

    public void setItem_id(int item_id) {
        this.item_id = item_id;
    }

    public String getCategory_name() {
        return category_name;
    }

    public void setCategory_name(String category_name) {
        this.category_name = category_name;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getLocation_lost_found() {
        return location_lost_found;
    }

    public void setLocation_lost_found(String location_lost_found) {
        this.location_lost_found = location_lost_found;
    }

    public int getStatus() {
        return status;
    }

    public String getStatus1() {
        if (status == 1) {
            return "Lost";
        } else if (status == 2) {
            return "Found";
        } else {
            return "Solve";
        }
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getMember_id() {
        return member_id;
    }

    public void setMember_id(int member_id) {
        this.member_id = member_id;
    }

    public String getHashTag() {
        return hashTag;
    }

    public void setHashTag(String hashTag) {
        this.hashTag = hashTag;
    }

    public String getItem_type() {
        return item_type;
    }

    public void setItem_type(String item_type) {
        this.item_type = item_type;
    }

    public boolean isIsReport() {
        return isReport;
    }

    public void setIsReport(boolean isReport) {
        this.isReport = isReport;
    }

    @Override
    public String toString() {
        return "Item{" + "item_id=" + item_id + ", category_name=" + category_name + ", title=" + title + ", description=" + description + ", date=" + date + ", image=" + image + ", location_lost_found=" + location_lost_found + ", status=" + status + ", member_id=" + member_id + ", hashTag=" + hashTag + ", item_type=" + item_type + ", isReport=" + isReport + '}';
    }
    
    

}
