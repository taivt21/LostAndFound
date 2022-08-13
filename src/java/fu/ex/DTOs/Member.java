 /*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package fu.ex.DTOs;

/**
 *
 * @author Tung
 */
public class Member {
    private int member_id;
    private int role_id;
    private String username;
    private String password;
    private String fullName;
    private String avatar;
    private String contact;
    private String email;
    private boolean status;
    private boolean muted;

    public Member(int member_id, int role_id, String username, String password, String fullName, String avatar, String contact, String email, boolean status, boolean muted) {
        this.member_id = member_id;
        this.role_id = role_id;
        this.username = username;
        this.password = password;
        this.fullName = fullName;
        this.avatar = avatar;
        this.contact = contact;
        this.email = email;
        this.status = status;
        this.muted = muted;
    }



    public int getMember_id() {
        return member_id;
    }

    public void setMember_id(int member_id) {
        this.member_id = member_id;
    }

    public int getRole_id() {
        return role_id;
    }

    public void setRole_id(int role_id) {
        this.role_id = role_id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public boolean isMuted() {
        return muted;
    }

    public void setMuted(boolean muted) {
        this.muted = muted;
    }

    @Override
    public String toString() {
        return "Member{" + "member_id=" + member_id + ", role_id=" + role_id + ", username=" + username + ", password=" + password + ", fullName=" + fullName + ", avatar=" + avatar + ", contact=" + contact + ", email=" + email + ", status=" + status + ", muted=" + muted + '}';
    }
    
    
    
}
