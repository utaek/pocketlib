package pocketLib.spring.pocketLibSpring.controller;

import java.util.ArrayList;
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
import pocketLib.spring.pocketLibSpring.mybatis.model.BookRead;
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

		BookRead input = new BookRead();
		if (userInfo != null) {
			input.setUserno(userInfo.getUserno());
		}
		Book top = new Book();

		try {
			top = recommendService.getTopOne(input);
		} catch (Exception e) {
			e.printStackTrace();
		}

		// 현종이가 만들어준 sql query 에서 나온 top one의 categoryId
		int categoryId = top.getCategoryId();
		String isbn = top.getIsbn();

		Book input2 = new Book();
		input2.setIsbn(isbn);
		input2.setCategoryId(categoryId);
		if (userInfo != null) {
			List<Book> randomBook = new ArrayList<Book>();
			try {
				randomBook = recommendService.getselectRandombyCate(input2);
			} catch (Exception e) {
				e.printStackTrace();
			}
			model.addAttribute("randomBook", randomBook);
		}

		model.addAttribute("output", output);

		model.addAttribute("userInfo", userInfo);

		String viewPath = "recommend/pocketlibrecommend";

		return new ModelAndView(viewPath);

	}

}
