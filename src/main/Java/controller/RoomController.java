package controller;

import model.*;
import service.AuthService;
import service.BillService;
import service.ImageService;
import service.RoomService;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;


@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10,      // 10MB
        maxRequestSize = 1024 * 1024 * 50)  // 50MB
@WebServlet(name = "roomController", urlPatterns = "/admin")
public class RoomController extends HttpServlet {
    private RoomService roomService;
    private ImageService imageService;
    private BillService billService;
    private AuthService authService;
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if(action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showCreate(req, resp);
                break;
            case "edit":
                showEdit(req, resp);
                break;
            case "delete":
                delete(req, resp);
                break;
            case "bill":
                showBill(req, resp);
                break;
            case "user":
                showUser(req, resp);
                break;
            case "updateBill":
                updateBill(req, resp);
                break;
            case "updateRoom":
                updateRoom(req, resp);
                break;
            default:
                showRoom(req, resp);
        }
    }

    private void updateRoom(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        EStatus eStatus = EStatus.valueOf(req.getParameter("status"));
        roomService.updateStatus(id, eStatus);
        req.getRequestDispatcher("admin/").forward(req,resp);
    }

    private void updateBill(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        EStatusBill statusBill = EStatusBill.valueOf(req.getParameter("status"));
        billService.updateBill(id, statusBill);
        req.getRequestDispatcher("admin/bill.jsp").forward(req,resp);
    }

    private void showUser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String pageString = req.getParameter("page");
        if (pageString == null) {
            pageString = "1";
        }
        req.setAttribute("page",  authService.findAllPage(Integer.parseInt(pageString), req.getParameter("search")));
        req.setAttribute("search", req.getParameter("search"));
        req.setAttribute("auths", authService.findAll());
        req.getRequestDispatcher("admin/user.jsp").forward(req,resp);
    }

    private void showBill(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String pageString = req.getParameter("page");
        if (pageString == null) {
            pageString = "1";
        }
        req.setAttribute("page", billService.findAllBill(Integer.parseInt(pageString), req.getParameter("search")));
        req.setAttribute("search", req.getParameter("search"));
        req.setAttribute("bills", billService.getAllBill());
        req.getRequestDispatcher("admin/bill.jsp").forward(req,resp);
    }


    private void delete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        roomService.delete(req);
        resp.sendRedirect("/admin?message=Deleted");
    }

    private void showEdit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("room", roomService.findById(req));
        req.setAttribute("roomClass", ERoomClass.values());
        req.setAttribute("types", EType.values());
        req.setAttribute("amenities", EAmenities.values());
        req.setAttribute("status", EStatus.values());
        req.getRequestDispatcher("admin/edit.jsp").forward(req,resp);
    }

    private void showCreate(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("roomClass", ERoomClass.values());
        req.setAttribute("types", EType.values());
        req.setAttribute("amenities", EAmenities.values());
        req.setAttribute("status", EStatus.values());
        req.getRequestDispatcher("admin/create.jsp").forward(req,resp);
    }

    private void showRoom(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String pageString = req.getParameter("page");
        if (pageString == null) {
            pageString = "1";
        }
        req.setAttribute("role", "ADMIN");
//        req.setAttribute("auth",authService.findByID(Integer.parseInt(req.getParameter("id"))));
        req.setAttribute("page", roomService.getRooms(Integer.parseInt(pageString), req.getParameter("search"),0));
        req.setAttribute("search", req.getParameter("search"));
        req.setAttribute("rooms", roomService.findAllRoom());
        req.setAttribute("message", req.getParameter("message"));
        req.getRequestDispatcher("admin/index.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if(action == null) {
            action = "";
        }
        switch (action){
            case "create":
               create(req, resp);
                break;
            case "edit":
                edit(req, resp);
                break;
            case "bill":
                showBill(req, resp);
                break;
            case "user":
                showUser(req, resp);
                break;
            default:
                showRoom(req, resp);
        }
    }

    private void edit(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        int id = Integer.parseInt(req.getParameter("id"));
        imageService.delete(id);
        String name = req.getParameter("name");
        ERoomClass roomClass = ERoomClass.valueOf(req.getParameter("roomClass"));
        EType type = EType.valueOf(req.getParameter("type"));
        BigDecimal price = new BigDecimal(req.getParameter("price"));
        String description = req.getParameter("description");
        String pathServerImage = getServletContext().getRealPath("/") + "image";
        String pathProjectImage  = "D:\\Management-Hotel\\src\\main\\webapp\\image";
        List<Image> imageList = new ArrayList<>();
        for (Part part : req.getParts()) {
            String fileName = extractFileName(part);

            if(!fileName.isEmpty()){
                fileName = new File(fileName).getName();

                if (!fileName.isEmpty() && (part.getContentType().startsWith("image/")) || part.getContentType().contains("application/octet-stream")) {
                    fileName = new File(fileName).getName();
                    part.write(pathProjectImage + File.separator + fileName);
                    String dbImageUrl = File.separator + fileName;
                    dbImageUrl = dbImageUrl.replace("\\", "/");
                    part.write(pathServerImage + File.separator + fileName);
                    Image image = new Image();
                    image.setUrl(dbImageUrl);
                    imageList.add(image);
                }
            }
        }
        /** for (String url : urls) {
            Image image = new Image();
            image.setUrl(url);
            imageList.add(image);
        } **/
        List<EAmenities> amenitiesList = new ArrayList<>();
        for (String amenity : req.getParameterValues("selectedAmenities")) {
            EAmenities amenityEnum = EAmenities.valueOf(amenity);
            amenitiesList.add(amenityEnum);
        }
        EStatus status = EStatus.valueOf(req.getParameter("status"));
        Room room = new Room();
        room.setId(id);
        room.setName(name);
        room.setRoomClass(roomClass);
        room.setType(type);
        room.setPrice(price);
        room.setDescription(description);
        room.setAmenities(amenitiesList);
        room.setStatus(status);
        roomService.update(room);
        imageService.create(imageList, id);
        resp.sendRedirect("/admin?message=Updated");
    }

    private void create(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        String name = req.getParameter("name");
        ERoomClass roomClass = ERoomClass.valueOf(req.getParameter("roomClass"));
        EType type = EType.valueOf(req.getParameter("type"));
        BigDecimal price = new BigDecimal(req.getParameter("price"));
        String description = req.getParameter("description");
        String pathServerImage = getServletContext().getRealPath("/") + "image";
        String pathProjectImage  = "D:\\Management-Hotel\\src\\main\\webapp\\image";
        List<Image> imageList = new ArrayList<>();
        for (Part part : req.getParts()) {
            String fileName = extractFileName(part);

            if(!fileName.isEmpty()){
                fileName = new File(fileName).getName();

                if (!fileName.isEmpty() && part.getContentType().startsWith("image/")) {
                    fileName = new File(fileName).getName();
                    part.write(pathProjectImage + File.separator + fileName);
                    String dbImageUrl = File.separator + fileName;
                    dbImageUrl = dbImageUrl.replace("\\", "/");
                    part.write(pathServerImage + File.separator + fileName);
                    Image image = new Image();
                    image.setUrl(dbImageUrl);
                    imageList.add(image);
                }
            }
        }
        /** for (String url : urls) {
            Image image = new Image();
            image.setUrl(url);
            imageList.add(image);
        } **/
        List<EAmenities> amenitiesList = new ArrayList<>();
        for (String amenity : req.getParameterValues("selectedAmenities")) {
            EAmenities amenityEnum = EAmenities.valueOf(amenity);
            amenitiesList.add(amenityEnum);
        }
        EStatus status = EStatus.valueOf(req.getParameter("status"));
        Room room = new Room();
        room.setName(name);
        room.setRoomClass(roomClass);
        room.setType(type);
        room.setPrice(price);
        room.setDescription(description);
        room.setAmenities(amenitiesList);
        room.setStatus(status);
        int roomId = roomService.create(room);
        imageService.create(imageList, roomId);
        resp.sendRedirect("/admin?message=Created");
    }
    @Override
    public void init() throws ServletException {
        roomService = new RoomService();
        imageService = new ImageService();
        billService = new BillService();
        authService = new AuthService();
    }

    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return "";
    }
}


