package com.ty.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ty.dao.EmpDao;
import com.ty.entity.Emp;

@Controller
public class HomeController {

	@Autowired
	private EmpDao empDao;
	
	
	@RequestMapping(path = "/welcome")
	public String welcome() {
		return "welcome";

	}

	@RequestMapping(path = "/home")
	public String home(Model model) {
		List<Emp> list = empDao.getAllEmp();
		model.addAttribute("empList", list);

		return "home";

	}

	@RequestMapping(path = "/addEmp")
	public String addEmp() {
		return "add_emp";

	}

	@RequestMapping(path = "/createEmp", method = RequestMethod.POST)
	public String createEmp(@ModelAttribute Emp emp, HttpSession session) {

		int i = empDao.saveEmp(emp);
		session.setAttribute("msg", "Registered Sucessfully");
		return "redirect:/addEmp";
	}

	@RequestMapping(path = "/editEmp/{id}")
	public String editEmp(@PathVariable int id, Model model) {

		Emp emp = empDao.getEmpById(id);
		model.addAttribute("emp", emp);
		return "edit_emp";
	}

	@RequestMapping(path = "/updateEmp", method = RequestMethod.POST)
	public String updateEmp(@ModelAttribute Emp emp, HttpSession session) {
		empDao.update(emp);
		session.setAttribute("msg", "Upadted Sucessfully");

		return "redirect:/home";

	}

	@RequestMapping(path = "/deleteEmp/{id}")
	public String deleteEmp(@PathVariable int id, HttpSession session) {
		empDao.deleteEmp(id);
		
		session.setAttribute("msg", "Employee Deleted Sucessfully");

		return "redirect:/home";

	}
}
