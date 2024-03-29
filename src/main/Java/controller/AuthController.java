package controller;


import dao.AuthDao;
import model.Auth;
import model.Role;
import model.Room;
import service.AuthService;
import service.RoleService;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.*;

@WebServlet(name = "authController", urlPatterns = "/auth")
@MultipartConfig(
        location = "D:\\Management-Hotel\\src\\main\\webapp\\hotel\\img\\room\\avatar",
        fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 50, // 50MB
        maxRequestSize = 1024 * 1024 * 50) // 50MB
public class AuthController extends HttpServlet {
    private AuthService authService;
    private RoleService roleService;



    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "register" -> showRegister(req, resp);
            case "register_admin" -> showRegisterAdmin(req, resp);
            case "check-login" -> checkLogin(req, resp);

            default -> logout(req, resp);


        }
    }



    private void checkLogin(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        HttpSession session = req.getSession();
        Auth auth = (Auth) session.getAttribute("auths");
        if (auth != null) {
            String username = auth.getEmail();
            resp.setStatus(HttpServletResponse.SC_OK);
            resp.getWriter().println("User is logged in");
        } else {
            resp.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            resp.getWriter().println("User is not logged in");
        }
    }


    private void showRegisterAdmin(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("roles", roleService.getRoles());
        req.setAttribute("message", req.getParameter("message"));
        req.getRequestDispatcher("auth/admin.jsp").forward(req, resp);
    }

    private void logout(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        HttpSession session = req.getSession();
        session.invalidate();
        req.setAttribute("message", req.getParameter("message"));
        req.getRequestDispatcher("/auth/login.jsp").forward(req, resp);
    }




    private void showRegister(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("message", req.getParameter("message"));
        req.getRequestDispatcher("/auth/ForgotPassword.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "register" -> register(req, resp);
            case "reset-password" -> ForgotPassword(req, resp);
            case "change-password" -> changepassword(req, resp);
            case "register_admin" -> registerAdmin(req, resp);
            case "edit" -> edit(req, resp);
            default -> login(req, resp);
        }
    }

    private void edit(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        String role = getRoleFromSomewhere(req);
        Part part = req.getPart("img");
        int id = Integer.parseInt(req.getParameter("id"));
        Auth auth =getAuthRequest(req, part,id);
        authService.update(auth,id);
        HttpSession session = req.getSession();
        Auth user = (Auth) session.getAttribute("auth");
        user.setName(req.getParameter("name"));
        user.setEmail(req.getParameter("email"));
        user.setPhone(req.getParameter("phone"));
        user.setAddress(req.getParameter("address"));
        session.setAttribute("auth",user);
        if (role.equals("ADMIN")) {
            resp.sendRedirect(req.getContextPath() + "/admin" );
        } else if (role.equals("USER")) {
            resp.sendRedirect(req.getContextPath() + "/hotel-page?id="+id);
        } else {
            resp.sendRedirect("/auth");
        }
    }

    private void saveImageToPath(InputStream inputStream, String filePath) throws IOException {
        try (OutputStream outputStream = new FileOutputStream(filePath)) {
            byte[] buffer = new byte[1024];
            int bytesRead;
            while ((bytesRead = inputStream.read(buffer)) != -1) {
                outputStream.write(buffer, 0, bytesRead);
            }
        }
    }


    private String getRoleFromSomewhere(HttpServletRequest req) {
        HttpSession session = req.getSession();
        return (String) session.getAttribute("role");
    }

    private void handleImageUpload(Part part, String filePath) throws IOException {
        if (part != null && part.getSize() > 0) {
            try (InputStream inputStream = part.getInputStream()) {
                saveImageToPath(inputStream, filePath);
            }
        }
    }
    private Auth getAuthRequest(HttpServletRequest req, Part part, int id) throws IOException {
        String img = extractFileName(part);
        String imagePath = "D:\\Management-Hotel\\src\\main\\webapp\\hotel\\img\\room\\avatar";
        String filePath = imagePath + File.separator + img;
        if (img != null && !img.isEmpty()) {
            handleImageUpload(part, filePath);
        } else {
            Auth existingAuth = authService.findByID(id);
            img = existingAuth.getImg(); // Sử dụng ảnh hiện tại từ cơ sở dữ liệu
        }
        String serverPath = this.getServletContext().getRealPath("/") + "hotel\\img\\room\\avatar" + File.separator + img;
        System.out.println("serverPath..." + serverPath);

        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String phone = req.getParameter("phone");
        String address = req.getParameter("address");
        return new Auth(img, name, email, phone, address);
    }



    private void registerAdmin(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        authService.registerAdmin(getUserByRequestAdmin(req));
        req.getRequestDispatcher("/admin/index.jsp").forward(req,resp);
    }

    private void changepassword(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        authService.updatePassword(req, resp);
        req.setAttribute("message", req.getParameter("message"));
        resp.sendRedirect("/auth?message=change-password Success");
    }

    private void ForgotPassword(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (!authService.checkEmail(req, resp)) {
            req.setAttribute("message", req.getParameter("message"));
            resp.sendRedirect("/auth?action=reset-password&message=Invalid email ");
        } else {
            req.setAttribute("message", req.getParameter("message"));
            req.getRequestDispatcher("/auth/change-password.jsp").forward(req, resp);
        }
    }

    private void login(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        req.setAttribute("message", req.getParameter("message"));
        authService.login(req, resp);
    }

    private void register(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        authService.register(getUserByRequest(req));
        resp.sendRedirect("/auth?message=Register Success");
    }

    private Auth getUserByRequest(HttpServletRequest req) {
        String img = req.getParameter("img");
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String phone = req.getParameter("phone");
        String address = req.getParameter("address");
        String password = req.getParameter("password");
        return new Auth(img, name, email, phone, address, password);
    }

    private Auth getUserByRequestAdmin(HttpServletRequest req) {
        String img = req.getParameter("img");
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String phone = req.getParameter("phone");
        String address = req.getParameter("address");
        String password = req.getParameter("password");
        String idRole = req.getParameter("role");
        Role role = new Role(Integer.parseInt(idRole));
        return new Auth(img, name, email, phone, address, password, role);
    }

    private String extractFileName(Part part) {
        String contentDisposition = part.getHeader("content-disposition");
        String[] items = contentDisposition.split(";");
        for (String item : items) {
            if (item.trim().startsWith("filename")) {
                return item.substring(item.indexOf("=") + 2, item.length() - 1);
            }
        }
        return null;
    }

    @Override
    public void init() throws ServletException {
        authService = new AuthService();
        roleService = new RoleService();
    }
}
