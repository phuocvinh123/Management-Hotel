package service;
import dao.RoleDao;
import model.Role;

import java.util.List;

public class RoleService {
    private final RoleDao roleDAO;

    public RoleService() {
        roleDAO = new RoleDao();
    }

    public List<Role> getRoles(){
        return roleDAO.findAll();
    }

    public Role getRole(int id){
        return roleDAO.findById(id);
    }
}
