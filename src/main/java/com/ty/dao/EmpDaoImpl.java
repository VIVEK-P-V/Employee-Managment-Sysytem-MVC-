package com.ty.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.ty.entity.Emp;

@Repository
public class EmpDaoImpl implements EmpDao {

	@Autowired
	private HibernateTemplate hibernateTemplate;

	@Transactional
	@Override
	public int saveEmp(Emp emp) {
		return (Integer) hibernateTemplate.save(emp);
	}

	@Override
	public Emp getEmpById(int id) {
		return hibernateTemplate.get(Emp.class, id);
	}

	@Override
	public List<Emp> getAllEmp() {
		List<Emp> list = hibernateTemplate.loadAll(Emp.class);
		return list;
	}

	@Transactional
	@Override
	public void update(Emp emp) {
		hibernateTemplate.update(emp);
	}

	@Transactional
	@Override
	public void deleteEmp(int id) {
		Emp emp = hibernateTemplate.get(Emp.class, id);
		if (emp != null) {
			hibernateTemplate.delete(emp);
		}
	}
}
