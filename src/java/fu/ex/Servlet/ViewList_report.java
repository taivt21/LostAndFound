/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package fu.ex.Servlet;

import fu.ex.DAOs.ItemDAO;
import fu.ex.DAOs.MemberDAO;
import fu.ex.DTOs.Item;
import javax.servlet.annotation.WebServlet;
import fu.ex.DTOs.Member;

import java.io.IOException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ADMIN
 */

public class ViewList_report extends HttpServlet {

    private final static String ERROR = "404.html";
    private final static String SUCCESS = "postReportMgt.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, Exception {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        HttpSession session = request.getSession(false);
        Member m = (Member) session.getAttribute("member");
        if (m == null || m.getRole_id() != 1) {
            response.sendRedirect("ViewList_index");
        }
        String url = ERROR;
        try {
            ItemDAO dao = new ItemDAO();
            List<Item> postList = dao.getAllItemByIsReport();
            request.setAttribute("postList", postList);
            url = SUCCESS;
        } catch (Exception e) {
            log("ERROR while load Servlet:" + e.getMessage());
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
        try {
            HttpSession session = request.getSession(false);
            Member m = (Member) session.getAttribute("member");
            if (m == null || m.getRole_id() != 1) {
                response.sendRedirect("ViewList_index");
            }
            String action = request.getParameter("action");
            String post_id = request.getParameter("post_id");
            ItemDAO dao = new ItemDAO();
//            request.setAttribute("postReport", dao.getAllItem());
            // removeReport
            if (action.equals("removeReport")) {
                Boolean result = dao.removeReport(Integer.parseInt(post_id));
                if (result) {
                    request.setAttribute("success", "Xoá report thành công");
                } else {
                    request.setAttribute("error", "Xoá report thất bại");
                }
            }
            // removePost
            else if (action.equals("removePost")) {
                Boolean result = dao.deleteItem(Integer.parseInt(post_id));
                if (result) {
                    request.setAttribute("success", "Xoá bài thành công");
                } else {
                    request.setAttribute("error", "Xoá bài thất bại");
                } 

            }
            

        } catch (Exception ex) {
            ex.printStackTrace();
            request.setAttribute("error", "Lỗi xảy ra khi xử lý");

        } finally {
            response.sendRedirect("ViewList_report");
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