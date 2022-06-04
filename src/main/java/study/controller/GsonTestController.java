package study.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;

@Controller
@RequestMapping("/gson")
public class GsonTestController {
	
	@RequestMapping("/test1")
	public String test1(HttpServletRequest request) {
		Gson gson = new Gson();
		
		return "/gson/test1";
	}
}
