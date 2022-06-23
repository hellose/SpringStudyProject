package study.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/study")
public class StudyController {

	@RequestMapping("/basic.do")
	public String basicTest(HttpServletRequest request, Model model) {

		// ${속성} 테스트
		request.setAttribute("requestAttribute", "request속성");
		HttpSession session = request.getSession();
		session.setAttribute("sessionAttribute", "session속성");
		ServletContext servletContext = request.getServletContext();
		servletContext.setAttribute("applicationAttribute", "application(servletContext)속성");

		// 속성에 해당하는 객체가 Array또는List인 경우 -> ${속성[인덱스]} 사용가능

		// 속성이 Array객체
		String[] stringArray = { "배열0번", "배열1번", "배열2번" };
		request.setAttribute("stringArray", stringArray);

		// 속성이 List객체
		List<String> stringList = new ArrayList<>();
		stringList.add("리스트0번");
		stringList.add("리스트1번");
		stringList.add("리스트2번");
		request.setAttribute("stringList", stringList);

		// 속성이 Map객체
		Map<String, Object> map = new HashMap<>();
		map.put("key1", "value1");
		map.put("key2", "value2");
		map.put("key3", "value3");
		request.setAttribute("map", map);

		return "/basic";
	}

	// 그리드 테스트
	@RequestMapping("/grid.do")
	public String gridTest(HttpServletRequest request, Model model) {
		return "/grid";
	}

	// gson 테스트
	@RequestMapping("/gson.do")
	public String gsonTest(HttpServletRequest request, Model model) {
		return "/gson";
	}

}
