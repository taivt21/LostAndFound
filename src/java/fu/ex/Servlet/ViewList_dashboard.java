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
public class ViewList_dashboard extends HttpServlet {

    private final static String ERROR = "404.html";
    private final static String SUCCESS = "dashboard.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, Exception {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        HttpSession session = request.getSession(false);
        Member m = (Member) session.getAttribute("member");
        Member acc = (Member) request.getSession().getAttribute("member");
        int CheckStaff = acc.getRole_id();
        String url = ERROR;
        try {
            if (CheckStaff == 1 || acc == null) {
                if (m == null) {
                    response.sendRedirect("ViewList_index");
                } else {
                    ItemDAO dao = new ItemDAO();
                    MemberDAO dao2 = new MemberDAO();
                    List<Item> items = dao.getAllItem();
                    Integer countUser = dao2.countUser();
                    Integer countUserBanned = dao2.countUserByStatus0();
                    Integer countItem = dao.countItem();
                    Integer countUserMute = dao2.countUserByMute();
                    request.setAttribute("items", items);
                    request.setAttribute("countUser", countUser);
                    request.setAttribute("countUserBanned", countUserBanned);
                    request.setAttribute("countItem", countItem);
                    request.setAttribute("countUserMute", countUserMute);
                    url = SUCCESS;
                }
            } else {
                response.sendRedirect("ViewList_index");
            }
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
            Logger.getLogger(ViewList_dashboard.class.getName()).log(Level.SEVERE, null, ex);
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