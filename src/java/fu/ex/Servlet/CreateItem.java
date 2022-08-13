/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package fu.ex.Servlet;

import fu.ex.DAOs.ItemDAO;
import fu.ex.DAOs.ItemImgDAO;
import fu.ex.DAOs.MemberDAO;
import fu.ex.DTOs.Member;
import fu.ex.DTOs.Item;
import fu.ex.DTOs.ItemImg;
import java.io.File;
import java.io.IOException;

import java.util.Date;
import java.sql.Time;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
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
public class CreateItem extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the
    // + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        HttpSession session = request.getSession(false);
        Member m = (Member) session.getAttribute("member");
        Boolean checkMuted = m.isMuted();
        // if member is muted, alert him/her return
        if (checkMuted) {
            // redirect to index page with error message
            response.sendRedirect("ViewList_index");
            return;
        }

        try {
            if (m == null) {
                response.sendRedirect("ViewList_index");
            } else {
                String title = request.getParameter("title");
                String category_name = request.getParameter("category_name");
                String location_lost_found = request.getParameter("location_lost_found");
                String sdate = request.getParameter("date");
                SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
                Date date = df.parse(sdate);
                if (date.after(new Date())) {
                    MemberDAO mdao = new MemberDAO();
                    ItemDAO dao = new ItemDAO();
                    List<Member> mlist = mdao.getAllMembers();
                    List<Item> list = dao.getAllItem();
                    request.setAttribute("list", list);
                    request.setAttribute("listM", mlist);
                    request.setAttribute("err", "wrong input!");
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                } else {
                    Part imgPart = request.getPart("image");
                    String rootPath = request.getServletContext().getRealPath("/");
                    String imgPath = rootPath + "images/";
                    // random image name time stamp
                    String imgName = "";
                    if (imgPart.getSize() > 0) {
                        imgName = new Date().getTime() + "-" + imgPart.getSubmittedFileName();
                        imgPart.write(imgPath + imgName);
                    }
                    String description = request.getParameter("description");
                    String hashTag = request.getParameter("hashTag");
                    String item_type = request.getParameter("item_type");
                    ItemDAO dAO = new ItemDAO();
                    Item item = new Item(0, category_name, title, description, date, imgName, location_lost_found, 1, m.getMember_id(), hashTag, item_type, false);
                    boolean result = dAO.createItem(item);
                    if (result) {
                        response.sendRedirect("ViewList_index");
                    }
                    response.sendRedirect("404.html");

                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("404.html");
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

    private String getFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        System.out.println("content-disposition header= " + contentDisp);
        String[] tokens = contentDisp.split(";");
        for (String token : tokens) {
            if (token.trim().startsWith("filename")) {
                return token.substring(token.indexOf("=") + 2, token.length() - 1);
            }
        }
        return "";
    }

}
