package customer.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import customer.dao.CustomerDAO;
import customer.vo.CustomerVO;

@Service
public class CustomerServiceImpl implements CustomerService{
	@Autowired private CustomerDAO dao;	
	
	@Override
	public boolean insert(CustomerVO vo) {
		return dao.insert(vo);
	}

	@Override
	public List<CustomerVO> list() {
		return dao.list();
	}

	@Override
	public CustomerVO select(int id) {
		return dao.select(id);
	}

	@Override
	public boolean update(CustomerVO vo) {
		return dao.update(vo);
	}

	@Override
	public boolean delete(int id) {
		return dao.delete(id);
	}

}
