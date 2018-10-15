package customer.dao;

import java.util.List;

import customer.vo.CustomerVO;

public interface CustomerDAO {
	//CRUD(Create, Read, Update, Delete)
	boolean insert(CustomerVO vo);
	List<CustomerVO> list();
	CustomerVO select(int id);
	boolean update(CustomerVO vo);
	boolean delete(int id);
}
