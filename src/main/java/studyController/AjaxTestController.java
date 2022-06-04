package studyController;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AjaxTestController {

	@RequestMapping("/ajax")
	public String ajaxTest(HttpServletRequest request) {

		return "/ajax/ajaxTest";
		
	}
	
}
