/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package fu.ex.Servlet;

import fu.ed.accessGoogle.common.GooglePojo;
import fu.ed.accessGoogle.common.googleUtils;
import fu.ex.DAOs.ItemDAO;
import fu.ex.DAOs.ItemImgDAO;
import fu.ex.DAOs.MemberDAO;
import fu.ex.DTOs.Item;
import fu.ex.DTOs.ItemImg;
import fu.ex.DTOs.Member;
import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Messages for who create this servlet down this lib:
 * https://drive.google.com/file/d/1uA1niPP-uZ8f1l7X3bC-nQvVcJgnlbNW/view?usp=sharing
 */
@WebServlet("/login-google")
public class LoginGoogleServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    public LoginGoogleServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        try {
            String code = request.getParameter("code");
            if (code == null || code.isEmpty()) {
                RequestDispatcher dis = request.getRequestDispatcher("login.jsp");
                dis.forward(request, response);
            } else {
                String accessToken = googleUtils.getToken(code);
                GooglePojo googlePojo = googleUtils.getUserInfo(accessToken);
                MemberDAO dAO = new MemberDAO();
                List<Member> list = dAO.getAllMembers();
                for (Member member : list) {
                    if (member.getEmail().equalsIgnoreCase(googlePojo.getEmail())) {
                        session.setAttribute("member", member);
                        if (member.getRole_id()==1) {
                          request.getRequestDispatcher("ViewList_dashboard").forward(request, response);
                            return;  
                        }
                        request.getRequestDispatcher("ViewList_index").forward(request, response);
                        return;
                    }
                }
                if (true && googlePojo.getEmail().endsWith("@fpt.edu.vn")) {
                    request.setAttribute("id", googlePojo.getId());
                    request.setAttribute("email", googlePojo.getEmail());
                    request.setAttribute("img", googlePojo.getPicture());
                    request.getRequestDispatcher("registerForGGSigin.jsp").forward(request, response);
                } else {
                    request.setAttribute("err", "can not register with your email!please user fpt mail to register!");
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.getRequestDispatcher("404.html").forward(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        HttpSession session = request.getSession();
        try {
            String userName = request.getParameter("uname");
            String password = request.getParameter("password");
            String contact = request.getParameter("phone");
            String email = request.getParameter("email");
            String fname = request.getParameter("fname");
            String avatarUrl = request.getParameter("avatar");
            Member m = new Member(0, 2, userName, password, fname, avatarUrl, contact, email, true, false);
            MemberDAO dao = new MemberDAO();
            if (email.endsWith("@fpt.edu.vn")) {
                dao.createMember(m);
                MemberDAO dAO = new MemberDAO();
                List<Member> listM = dAO.getAllMembers();
                for (Member member : listM) {
                    if (member.getEmail().equals(m.getEmail())) {
                        session.setAttribute("member", member);
                    }
                }
                ItemDAO idao = new ItemDAO();
                List<Member> mlist = dao.getAllMembers();
                List<Item> list = idao.getAllItem();
                List<ItemImg> listImg = null;
                ItemImgDAO imgDAO = new ItemImgDAO();
                listImg = imgDAO.getAllItemImg();
                request.setAttribute("listImg", listImg);
                request.setAttribute("list", list);
                request.setAttribute("listM", mlist);
                request.getRequestDispatcher("index.jsp").forward(request, response);
            } else {
                ItemDAO idao = new ItemDAO();
                List<Item> list = idao.getAllItem();
                request.setAttribute("list", list);
                request.setAttribute("err", "can not register with your email!please user fpt mail to register!");
                request.getRequestDispatcher("index.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.getRequestDispatcher("404.html").forward(request, response);
        }
    }

}
