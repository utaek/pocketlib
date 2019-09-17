package pocketLib.spring.pocketLibSpring;


import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.charset.Charset;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import pocketLib.spring.pocketLibSpring.mybatis.model.Book;
import pocketLib.spring.pocketLibSpring.mybatis.model.BookRead;
import pocketLib.spring.pocketLibSpring.mybatis.model.Customer;
import pocketLib.spring.pocketLibSpring.mybatis.model.Searching;
import pocketLib.spring.pocketLibSpring.mybatis.service.RecommendService;
import pocketLib.spring.pocketLibSpring.mybatis.service.SearchingService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	@Autowired
	RecommendService recommendService;
	
	@Autowired
	SearchingService searchingservice;


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
		DateFormat df = new SimpleDateFormat("yyyy-MM");
		Calendar cal = Calendar.getInstance();
		cal.add(cal.MONTH, +1);
		String[] months = new String[5];
		for (int i = 0; i < months.length; i++) {
			cal.add(cal.MONTH, -1);
			String yearMonth = df.format(cal.getTime());
			months[i] = yearMonth;
		}

		List<Book> list1 = null;
		List<List<Book>> list2 = new ArrayList<List<Book>>();

		for (int i = 0; i < months.length; i++) {
			BookRead bookRead = new BookRead();
			bookRead.setReg_date(months[i]);

			try {
				list1 = recommendService.getAllCountby_reg_date(bookRead);
				if (list1 != null) {
					list2.add(list1);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}

		}
		model.addAttribute("bigList", list2);
		model.addAttribute("months", months);
		model.addAttribute("userInfo", userInfo);

		return "index";
	}
	
	@RequestMapping(value = "/aboutUs/aboutUs.do", method = RequestMethod.GET)
	public String aboutUs() {
		
		return "aboutUs/aboutUs";
	}
	
	@ResponseBody
	@RequestMapping(value = "/searching.csv", method = RequestMethod.GET)
	public void searching(HttpServletResponse response) {
		response.setContentType("text/csv");
		response.setCharacterEncoding("utf-8");
		
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		List<Searching> searchingList = null;
		try {
			searchingList = searchingservice.CSVList(null);
		} catch (Exception e) {
			e.getStackTrace();
		}

		ArrayList<Searching> list = (ArrayList<Searching>) searchingList;

		out.println("text,frequency");
		for (int i = 0; i < list.size(); i++) {
			out.print(list.get(i).getQueryValue());
			out.print(",");
			out.println(Integer.toString(list.get(i).getQuerycnt()*100));
		}
	}

}
