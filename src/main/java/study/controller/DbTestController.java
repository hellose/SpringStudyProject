package study.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import common.SqlDAO;
import test.service.TestVO;

@RequestMapping("/db")
@Controller
public class DbTestController {

	@Autowired
	SqlDAO dao;

	@RequestMapping("/test")
	public String test(HttpServletRequest request, @ModelAttribute TestVO testVO) {
		testVO.setId("1");
		System.out.println(dao.selectOne("test.getTest", testVO) instanceof TestVO);
		TestVO vo = dao.selectOne("test.getTest", testVO);
		if (vo == null) {
			System.out.println("null");
		} else {
			System.out.println(vo.toString());
		}
		return "/grid/test1";

	}
}
