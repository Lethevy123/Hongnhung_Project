package com.Login.dao;

import java.util.List;

import com.Login.entity.Customer;

public interface CustomerDAO {

	Customer findById(String email);
	List<Customer> findAll();
	Customer create(Customer entity);
	void update(Customer entity);
	Customer delete(String id);
}
