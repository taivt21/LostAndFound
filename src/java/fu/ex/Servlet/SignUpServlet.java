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
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "SignUpServlet", urlPatterns = {"/SignUpServlet"})
public class SignUpServlet extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SignUpServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SignUpServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
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
        try {
            String fullName = request.getParameter("username");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            Member m = new Member(0, 2, fullName, password, fullName, "", "", email, true, false);
            MemberDAO dao = new MemberDAO();
            List<Member> listM = dao.getAllMembers();
            for (Member member : listM) {
                if (member.getEmail().equalsIgnoreCase(email)) {
                    request.setAttribute("err", "your email is exist");
                    ItemDAO Idao = new ItemDAO();
                    List<Item> list = Idao.getAllItem();
                    request.setAttribute("list", list);
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                    return;
                }
            }
            if (email.endsWith("@fpt.edu.vn")) {
                dao.createMember(m);
                HttpSession session = request.getSession();
                session.setAttribute("member", m);
                request.getRequestDispatcher("index.jsp").forward(request, response);
            } else {
                request.setAttribute("err", "Your account is not permitted. Please use FPT Account!");
                ItemDAO Idao = new ItemDAO();
                List<Item> list = Idao.getAllItem();
                request.setAttribute("list", list);
                request.getRequestDispatcher("index.jsp").forward(request, response);
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

}
