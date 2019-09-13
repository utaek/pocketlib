package pocketLib.spring.pocketLibSpring.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import pocketLib.spring.pocketLibSpring.helper.WebHelper;
import pocketLib.spring.pocketLibSpring.mybatis.model.Board;
import pocketLib.spring.pocketLibSpring.mybatis.model.Book;
import pocketLib.spring.pocketLibSpring.mybatis.model.Customer;
import pocketLib.spring.pocketLibSpring.mybatis.service.RecommendService;

@Controller
public class RecommendController {
	@Autowired
	WebHelper webHelper;
	
	@Autowired
	SqlSession sqlSession;
	
	@Autowired
	RecommendService recommendService;
	
	@RequestMapping(value = "/recommend/pocketlibrecommend.do", method = RequestMethod.GET)
	public ModelAndView pocketlibHotBook(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		Customer userInfo = (Customer) session.getAttribute("userInfo");

		if (userInfo == null) {
			userInfo = null;
		}

		List<Book> output = null;
	
		try {
			output = recommendService.getPklibRecommendList();
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		model.addAttribute("output", output);
		model.addAttribute("userInfo", userInfo);
		
		return new ModelAndView("recommend/pocketlibrecommend");
	}
}
