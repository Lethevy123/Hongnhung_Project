package com.Login.dao;

import java.util.List;

import javax.persistence.TypedQuery;
import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.Login.entity.Customer;

@Transactional
@Repository
public class CustomerDAOImpl implements CustomerDAO{

	@Autowired
	SessionFactory sessionFactory;
	
	@Override
	public Customer findById(String email) {
		Session session = sessionFactory.getCurrentSession();
		Customer entity = session.find(Customer.class, email);
		return entity;
	}

	@Override
	public List<Customer> findAll() {
		String hql = "FROM Customer";
		Session session = sessionFactory.getCurrentSession();
		TypedQuery<Customer> query = session.createQuery(hql, Customer.class);
		List<Customer> resultList = query.getResultList();
		return resultList;
	}

	@Override
	public Customer create(Customer entity) {
		Session session = sessionFactory.getCurrentSession();
		session.save(entity);
		return entity;
	}

	@Override
	public void update(Customer entity) {
		Session session = sessionFactory.getCurrentSession();
		session.update(entity);
		
	}

	@Override
	public Customer delete(String email) {
		Session session = sessionFactory.getCurrentSession();
		Customer entity = session.find(Customer.class, email);
		session.delete(entity);
		return entity;
	}

}
