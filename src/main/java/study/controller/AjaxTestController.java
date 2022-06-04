package study.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/ajax")
public class AjaxTestController {

	@RequestMapping("/test1")
	public String ajaxTest(HttpServletRequest request) {

		return "/ajax/test1";
		
	}
	
}
