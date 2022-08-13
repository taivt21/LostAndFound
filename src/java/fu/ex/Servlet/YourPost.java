/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package fu.ex.Servlet;

import fu.ex.DAOs.ItemDAO;
import fu.ex.DAOs.MemberDAO;
import fu.ex.DTOs.Item;
import fu.ex.DTOs.Member;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author ADMIN
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 10, // 10 MB 
        maxFileSize = 1024 * 1024 * 50, // 50 MB
        maxRequestSize = 1024 * 1024 * 100)
public class YourPost extends HttpServlet {

    private final static String ERROR = "404.html";
    private final static String SUCCESS = "yourPost.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, Exception {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");

        String url = ERROR;
        try {

            HttpSession session = request.getSession(true);

            ItemDAO idao = new ItemDAO();
            MemberDAO mdao = new MemberDAO();
            Member member = (Member) session.getAttribute("member") != null ? (Member) session.getAttribute("member")
                    : null;
            

            if (member != null) {

                List<Item> posts = idao.getAllItemByMember(member.getMember_id());
                request.setAttribute("posts", posts);
                url = SUCCESS;
            } 

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the
    // + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(ViewList_report.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");

        try {
            String action = request.getParameter("action");
            // if string action = update
            if (action != null) {
                if (action.equals("update")) {
                    String title = request.getParameter("title");
                    String type = request.getParameter("type");
                    Part file_image = request.getPart("file_image");
                    String item_type = request.getParameter("item_type");
                    HttpSession session = request.getSession();
                    String sdate = request.getParameter("date_z");
                    String description = request.getParameter("description");
                    log("request : " + title);
                    Member member = (Member) session.getAttribute("member");
                    SimpleDateFormat da = new SimpleDateFormat("yyyy-MM-dd");
                    // get parameter type date name date
                    Date date = da.parse(sdate);

                    String location = request.getParameter("location");
                    Integer status = request.getParameter("status") == null ? 0
                            : Integer.parseInt(request.getParameter("status"));
                    String hashtag = request.getParameter("hashtag");
                    Integer item_id = request.getParameter("id") == null ? 0
                            : Integer.parseInt(request.getParameter("id"));
                    ItemDAO idao = new ItemDAO();

                    Item item = idao.getItemByID(item_id);
                    // check member_id
                    if (item.getMember_id() == member.getMember_id()) {
                        log("file_image not null");
                        item.setTitle(title);
                        item.setCategory_name(type);
                        item.setItem_type(item_type);
                        item.setDate(date);
                        item.setLocation_lost_found(location);
                        item.setStatus(status);
                        item.setHashTag(hashtag);
                        item.setDescription(description);
                        // check file_image have file

                        if (file_image.getSubmittedFileName() != null
                                && !file_image.getSubmittedFileName().equals("")) {
                            log("file_image not null");
                            String fileName = System.currentTimeMillis() + "-" + file_image.getSubmittedFileName();
                            String path = request.getServletContext().getRealPath("/") + "images/" + fileName;
                            file_image.write(path);
                            item.setImage(fileName);
                        }
                        if (idao.updateItem(item)) {
                            request.setAttribute("message", "Update item success");
                        } else {
                            request.setAttribute("message", "Update item failed");
                            log("ERROR while update item");
                        }
                    } else {
                        request.setAttribute("message", "Update failed");
                        log("ERROR while update itemz");
                    }
                    processRequest(request, response);

                }
                // else delete
                else if (action.equals("delete")) {
                    int id = Integer.parseInt(request.getParameter("id"));
                    ItemDAO idao = new ItemDAO();
                    if (idao.deleteItem(id)) {
                        // return json
                        response.setContentType("application/json");
                        response.setCharacterEncoding("utf-8");
                        PrintWriter out = response.getWriter();
                        out.print("{\"success\":\"true\" , \"message\":\"Delete item thành công\"}");
                        out.flush();

                    } else {
                        response.setContentType("application/json");
                        response.setCharacterEncoding("utf-8");
                        PrintWriter out = response.getWriter();
                        out.print("{\"success\":\"false\" , \"message\":\"Delete item thất bại\"}");
                        out.flush();
                    }
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}