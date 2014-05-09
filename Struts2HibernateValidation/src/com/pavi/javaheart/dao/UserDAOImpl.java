package com.pavi.javaheart.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.googlecode.s2hibernate.struts2.plugin.annotations.SessionTarget;
import com.googlecode.s2hibernate.struts2.plugin.annotations.TransactionTarget;
import com.pavi.javaheart.bean.User;

public class UserDAOImpl implements UserDAO {

	@SessionTarget
	Session session;
	
	@TransactionTarget
	Transaction transaction;
	
	@SuppressWarnings("unchecked")
	@Override
	public List<User> listUser() {
		List<User> courses = null;
		try {
			courses = session.createQuery("from User").list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return courses;
	}
	/**
	 * Used to save or update a user.
	 */
	public void saveOrUpdateUser(User user) {
		try {
			session.saveOrUpdate(user);
		} catch (Exception e) {
			transaction.rollback();
			e.printStackTrace();
		}
	}
	
	
	/**
	 * Used to delete a user.
	 */
	public void deleteUser(Long userId) {
		try {
			User user = (User) session.get(User.class, userId);
			session.delete(user);
		} catch (Exception e) {
			transaction.rollback();
			e.printStackTrace();
		} 
	}
	
	/**
	 * Used to list a single user by Id.
	 */
	public User listUserById(Long userId) {
		User user = null;
		try {
			user = (User) session.get(User.class, userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return user;
	}

	

}
