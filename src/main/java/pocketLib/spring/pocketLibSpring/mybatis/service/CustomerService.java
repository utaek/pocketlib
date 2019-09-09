package pocketLib.spring.pocketLibSpring.mybatis.service;

import java.util.List;

import pocketLib.spring.pocketLibSpring.mybatis.model.Customer;


public interface CustomerService {
	public int addCustomer(Customer input) throws Exception;
	
	public List<Customer> selectCustomerIdList(Customer input) throws Exception;
	
	public int getCustomerCount(Customer input) throws Exception;
	
	public Customer getLoginCheckId(Customer input) throws Exception;
	
	public int editCustomer(Customer input) throws Exception;	
	
	public int emailCheck(Customer input) throws Exception;
	
	public Customer getEmailCheck(Customer input) throws Exception;
	
	public Customer newPasswordCheck(Customer input) throws Exception;
	
	public int newPassword(Customer input) throws Exception;

}
