/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package fu.ex.Servlet;

import fu.ex.DAOs.ItemDAO;
import fu.ex.DAOs.ItemImgDAO;
import fu.ex.DAOs.MemberDAO;
import fu.ex.DTOs.Item;
import fu.ex.DTOs.ItemImg;
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
import javax.swing.plaf.multi.MultiDesktopIconUI;

/**
 *
 * @author ADMIN
 */
public class ViewList_index extends HttpServlet {

    private final static String ERROR = "404.html";
    private final static String SUCCESS = "index.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, Exception {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");

        String url = ERROR;
        try {
            // get current member
            HttpSession session = request.getSession();
            Member m = (Member) session.getAttribute("member");

            MemberDAO mdao = new MemberDAO();
            ItemDAO dao = new ItemDAO();

            if (m == null) {
                request.setAttribute("muted", true);
            } else {
                Member nm = mdao.getMemberById(m.getMember_id());
                if (nm.isMuted()) {
                    request.setAttribute("muted", true);
                } else {
                    request.setAttribute("muted", false);
                }
            }
            List<Member> mlist = mdao.getAllMembers();
            List<Item> list = dao.getAllItem();
            request.setAttribute("list", list);
            request.setAttribute("listM", mlist);
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
            Logger.getLogger(ViewList_index.class.getName()).log(Level.SEVERE, null, ex);
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
            String postId = request.getParameter("postId");
            String action = request.getParameter("action");
            // check member
            HttpSession session = request.getSession();
            Member m = (Member) session.getAttribute("member");
            // if action = report
            if (action.equals("report")) {
                if (m == null) {
                    response.setContentType("application/json");
                    response.setCharacterEncoding("UTF-8");
                    response.getWriter().write("{\"error\" : false, \"message\" : \"Chưa đăng nhập\"}");
                    return;
                } else {
                    // check mute
                    MemberDAO mdao = new MemberDAO();
                    if (mdao.getMemberById(m.getMember_id()).isMuted()) {
                        response.sendRedirect("index.jsp");
                        return;
                    } else {
                        // report
                        ItemDAO dao = new ItemDAO();
                        Boolean result = dao.reportItem(Integer.parseInt(postId));
                        if (result) {
                            // return json
                            response.setContentType("application/json");
                            response.setCharacterEncoding("UTF-8");
                            response.getWriter().write("{\"success\" : true , \"message\" : \"Report thành công\"}");

                        } else {
                            response.setContentType("application/json");
                            response.setCharacterEncoding("UTF-8");
                            response.getWriter().write("{\"error\" : false, \"message\" : \"Report thất bại\"}");

                        }
                    }
                }
            }
            // if null return to login page

        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            
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