package pocketLib.spring.pocketLibSpring;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import pocketLib.spring.pocketLibSpring.mybatis.model.Customer;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {


	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		Customer userInfo = (Customer) session.getAttribute("userInfo");
		if (userInfo == null) {
			userInfo = null;
		}
		


		return "index";
	}

}
