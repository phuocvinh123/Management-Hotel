package service;

import dao.BillDAO;
import model.Bill;
import model.EStatusBill;
import service.dto.Page;

import java.util.List;

public class BillService {
    private BillDAO billDAO;

    public BillService() {
        billDAO = new BillDAO();
    }

    public void create(Bill bill) {
        billDAO.create(bill);
    }

    public List<Bill> getAllBill(){
        return billDAO.getAllBill();
    }

    public Bill findById(int id){
        return billDAO.findById(id);
    }
    public List<Bill> findByIdUser(int id){
        return billDAO.findByIdUser(id);
    }

    public boolean checkBillRating(int idUser, int idRoom){
        return billDAO.checkRatingBill(idUser, idRoom) > 0;
    }

    public Page<Bill> findAllBill(int page, String search){
        return billDAO.findAllBill(page, search);
    }
    public void updateBill(int id, EStatusBill statusBill){
        billDAO.updateBill(id, statusBill);
    }
}
