/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package fu.ex.Servlet;

import fu.ex.DAOs.MemberDAO;
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
public class ViewList_user extends HttpServlet {

    private final static String ERROR = "404.html";
    private final static String SUCCESS = "userMgt.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, Exception {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        HttpSession session = request.getSession(false);
        Member m = (Member) session.getAttribute("member");
        if (m == null || m.getRole_id()!=1) {
            response.sendRedirect("ViewList_index");
        }
        String url = ERROR;
        try {
            MemberDAO dao = new MemberDAO();
            List<Member> mem = dao.getAllMembers();
            request.setAttribute("mem", mem);
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
            Logger.getLogger(ViewList_user.class.getName()).log(Level.SEVERE, null, ex);
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
            String action = request.getParameter("action");
            String checked = request.getParameter("checked");
            Integer id = Integer.parseInt(request.getParameter("id"));
            if (action.equals("mute")){
                if (id != null) {
                    MemberDAO dao = new MemberDAO();
                    Member m = dao.getMemberById(id);
                    if ("1".equals(checked)) {
                        m.setMuted(true);
                        dao.updateMember(m);
                    } else {
                        m.setMuted(false);
                        dao.updateMember(m);
                    }
                }
            }
            else if (action.equals("status")){
                if (id != null) {
                    MemberDAO dao = new MemberDAO();
                    Member m = dao.getMemberById(id);
                    if ("1".equals(checked)) {
                        m.setStatus(true);
                        dao.updateMember(m);
                    } else {
                        m.setStatus(false);
                        dao.updateMember(m);
                    }
                }
            }
            
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(ViewList_found.class.getName()).log(Level.SEVERE, null, ex);
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