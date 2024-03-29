package service;

import dao.ImageDAO;
import model.Image;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

public class ImageService {
    private ImageDAO imageDAO;

    public ImageService(){
        imageDAO = new ImageDAO();
    }


    public void create(List<Image> images, int roomId){
        imageDAO.create(images, roomId);
    }

    public void delete(int id){
        imageDAO.delete(id);
    }
}
