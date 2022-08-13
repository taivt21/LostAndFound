/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package fu.ex.Servlet;

import fu.ex.DAOs.ItemDAO;
import fu.ex.DAOs.MemberDAO;
import fu.ex.DTOs.Item;
import fu.ex.DTOs.Member;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
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
public class updateProfileServlet extends HttpServlet {

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
            throws ServletException, IOException, Exception {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        HttpSession session = request.getSession(false);
        Member m = (Member) session.getAttribute("member");
        MemberDAO mdao = new MemberDAO();
        ItemDAO dao = new ItemDAO();
        List<Member> mlist = mdao.getAllMembers();
        List<Item> list = dao.getAllItem();
        if (m == null) {
            request.setAttribute("err", "please login before!");
            request.setAttribute("list", list);
            request.setAttribute("listM", mlist);
        }
        request.getRequestDispatcher("proFile.jsp").forward(request, response);
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
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(updateProfileServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
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
            String phone = request.getParameter("phone");
            String UName = request.getParameter("UName");
            String fullName = request.getParameter("fullName");
            String action = request.getParameter("action");
            Member m = (Member) request.getSession().getAttribute("member");
            MemberDAO mdao = new MemberDAO();
            if (action.equals("updateProfile")) {
                m.setContact(phone);
                m.setFullName(fullName);
                m.setUsername(UName);
                if (mdao.updateMember(m)) {
                    request.setAttribute("msg", "update success!");
                } else {
                    request.setAttribute("err", "update fail!");
                }
            } else if (action.equals("updatePass")) {

            } else if (action.equals("updateAvatar")) {
                Part filePart = request.getPart("avatar");
                // random name by timestamp
                String fileName = System.currentTimeMillis() + "-" + filePart.getSubmittedFileName();
                String path = request.getServletContext().getRealPath("/") + "images\\" + fileName;
                filePart.write(path);
                m.setAvatar(fileName);
                if (mdao.updateMember(m)) {
                    request.setAttribute("msg", "update success!");
                } else {
                    request.setAttribute("err", "update fail!");
                }
            }
            request.getRequestDispatcher("proFile.jsp").forward(request, response);

        } catch (Exception ex) {
            Logger.getLogger(updateProfileServlet.class.getName()).log(Level.SEVERE, null, ex);
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

    protected String upLoadFile(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession(false);
        Member member = (Member) session.getAttribute("member");
        String UPLOAD_DIR = Integer.toString(member.getMember_id());
        // gets absolute path of the web application
        String applicationPath = request.getServletContext().getRealPath("");
        // constructs path of the directory to save uploaded file
        String uploadFilePath = applicationPath + File.separator + UPLOAD_DIR;

        // creates the save directory if it does not exists
        File fileSaveDir = new File(uploadFilePath);
        if (!fileSaveDir.exists()) {
            fileSaveDir.mkdirs();
        }
        System.out.println("Upload File Directory=" + fileSaveDir.getAbsolutePath());

        String fileName = null;
        String fileN = null;
        // Get all the parts from request and write it to the file on server
        for (Part part : request.getParts()) {
            try {
                fileName = getFileName(part);
                part.write(uploadFilePath + File.separator + fileName);
                if (!fileName.isEmpty()) {
                    fileN = fileName;
                }
            } catch (Exception e) {
            }
        }
        return fileN;
    }

}
