package study.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/grid")
public class GridTestController {
	
	@RequestMapping("/test1")
	public String test1(HttpServletRequest request) {
		return "/grid/test1";
	}
}
