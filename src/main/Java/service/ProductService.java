package service;

import dao.ProductDAO;
import model.Product;

import java.util.List;

public class ProductService {
    private ProductDAO productDAO;

    public ProductService() {
        productDAO = new ProductDAO();
    }
    public List<Product> findAll(){
        return productDAO.selectAll();
    }
}
