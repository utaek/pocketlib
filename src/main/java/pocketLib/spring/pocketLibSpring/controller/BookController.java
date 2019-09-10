package pocketLib.spring.pocketLibSpring.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import pocketLib.spring.pocketLibSpring.helper.WebHelper;
import pocketLib.spring.pocketLibSpring.mybatis.model.Book;
import pocketLib.spring.pocketLibSpring.mybatis.model.BookInterested;
import pocketLib.spring.pocketLibSpring.mybatis.model.BookRank;
import pocketLib.spring.pocketLibSpring.mybatis.model.BookRead;
import pocketLib.spring.pocketLibSpring.mybatis.model.Customer;
import pocketLib.spring.pocketLibSpring.mybatis.service.BookInterestedService;
import pocketLib.spring.pocketLibSpring.mybatis.service.BookRankService;
import pocketLib.spring.pocketLibSpring.mybatis.service.BookReadService;
import pocketLib.spring.pocketLibSpring.mybatis.service.BookService;
import pocketLib.spring.pocketLibSpring.mybatis.service.CustomerService;
import pocketLib.spring.pocketLibSpring.mybatis.service.impl.BookRankServiceImpl;

@Controller
public class BookController {
	@Autowired
	WebHelper webHelper;

	@Autowired
	CustomerService customerService;

	@Autowired
	private BookService bookService;

	@Autowired
	private BookReadService bookReadService;

	@Autowired
	private BookInterestedService bookInterestedService;

	@Autowired
	private BookRankService bookRankService;

	@Value("#{servletContext.contextPath}")
	String contextPath;

	/*
	 * 책 상세 조회
	 */
	@RequestMapping(value = "/book/book_detail.do", method = RequestMethod.GET)
	public ModelAndView bookDetail(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();

		Customer userInfo = (Customer) session.getAttribute("userInfo");

		
		if(userInfo==null) {
			userInfo= null;
		}

		String isbn = webHelper.getString("isbn");

		if (isbn.equals("")) {
			return webHelper.redirect(null, "등록된 책이 없습니다.");
		}
		Book input = new Book();
		input.setIsbn(isbn);

		Book output = null;

		try {
			output = bookService.getBookItem(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		int totalCountbI = 0;
		int totalCountbR = 0;
		int cnt = 0;

		if (userInfo != null) {
			// 해당 책을 고객이 평점 등록했는지 안했는지
			BookRank bookrank = new BookRank();
			bookrank.setIsbn(isbn);
			bookrank.setUserno(userInfo.getUserno());
			try {
				cnt=bookRankService.getBookRankCount(bookrank);
			} catch (Exception e) {
				return webHelper.redirect(null, e.getLocalizedMessage());
			}

			// 해당 책이 고객의 읽은책, 관심책 목록에 있는지 없는지 count
			BookRead bookread = new BookRead();
			BookInterested bookinterested = new BookInterested();

			bookinterested.setUserno(userInfo.getUserno());
			bookinterested.setIsbn(isbn);

			bookread.setUserno(userInfo.getUserno());
			bookread.setIsbn(isbn);

			try {
				totalCountbI = bookInterestedService.getBookInterestedCount(bookinterested);
				totalCountbR = bookReadService.getBookReadCount(bookread);

			} catch (Exception e) {
				return webHelper.redirect(null, e.getLocalizedMessage());
			}

		}
		model.addAttribute("isbn", isbn);
		model.addAttribute("userInfo", userInfo);
		model.addAttribute("cnt", cnt);
		model.addAttribute("totalCountbI", totalCountbI);
		model.addAttribute("totalCountbR", totalCountbR);
		model.addAttribute("output", output);
	
		String viewPath = "book/book_detail";
		return new ModelAndView(viewPath);

	}

	/*
	 * 관심 책 등록
	 */
	@RequestMapping(value = "/book/bi_insert.do", method = RequestMethod.POST)
	public ModelAndView biInsert(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();

		Customer userInfo = (Customer) session.getAttribute("userInfo");

		int userno = 0;
		if (userInfo == null) {
			userInfo= null;
		
		}
		if(userInfo!=null) {
			userno=userInfo.getUserno();
		}
		
		if(userno==0) {
			return webHelper.redirect("../login/show.do", "로그인 후 이용하세요.");
			
		}
		String isbn = webHelper.getString("isbn");

		BookInterested input = new BookInterested();
		input.setIsbn(isbn);
		input.setUserno(userno);

		try {
			bookInterestedService.addBookInterested(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		return webHelper.redirect(contextPath + "/book/book_detail.do?isbn=" + input.getIsbn(), "관심책 목록에 등록되었습니다");

	}

	/*
	 * 관심 책 취소
	 */
	@RequestMapping(value = "/book/bi_delete.do", method = RequestMethod.POST)
	public ModelAndView biDelete(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();

		Customer userInfo = (Customer) session.getAttribute("userInfo");

		int userno = 0;
		if (userInfo == null) {
			userInfo= null;
		
		}
		if(userInfo!=null) {
			userno=userInfo.getUserno();
		}
		
		if(userno==0) {
			return webHelper.redirect("../login/show.do", "로그인 후 이용하세요.");
			
		}
		String isbn = webHelper.getString("isbn");

		BookInterested input = new BookInterested();
		input.setIsbn(isbn);
		input.setUserno(userInfo.getUserno());

		try {
			bookInterestedService.deleteBookInterested(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		return webHelper.redirect(contextPath + "/book/book_detail.do?isbn=" + input.getIsbn(), "관심책 목록에서 삭제었습니다");

	}

	/*
	 * 읽은 책 등록
	 */
	@RequestMapping(value = "/book/br_insert.do", method = RequestMethod.POST)
	public ModelAndView brInsert(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();

		Customer userInfo = (Customer) session.getAttribute("userInfo");
		int userno = 0;
		if (userInfo == null) {
			userInfo= null;
		
		}
		if(userInfo!=null) {
			userno=userInfo.getUserno();
		}
		
		if(userno==0) {
			return webHelper.redirect("../login/show.do", "로그인 후 이용하세요.");
			
		}
		String isbn = webHelper.getString("isbn");

		BookRead input = new BookRead();
		input.setIsbn(isbn);
		input.setUserno(userInfo.getUserno());

		try {
			bookReadService.addBookRead(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		return webHelper.redirect(contextPath + "/book/book_detail.do?isbn=" + input.getIsbn(), "읽은 책 목록에 등록되었습니다");

	}

	/*
	 * 읽은 책 삭제
	 */
	@RequestMapping(value = "/book/br_delete.do", method = RequestMethod.POST)
	public ModelAndView brDelete(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();

		Customer userInfo = (Customer) session.getAttribute("userInfo");
		int userno = 0;
		if (userInfo == null) {
			userInfo= null;
		
		}
		if(userInfo!=null) {
			userno=userInfo.getUserno();
		}
		
		if(userno==0) {
			return webHelper.redirect("../login/show.do", "로그인 후 이용하세요.");
			
		}
		String isbn = webHelper.getString("isbn");

		BookRead input = new BookRead();
		input.setIsbn(isbn);
		input.setUserno(userInfo.getUserno());

		try {
			bookReadService.deleteBookRead(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		return webHelper.redirect(contextPath + "/book/book_detail.do?isbn=" + input.getIsbn(), "읽은 책 목록에서 삭제되었습니다");

	}

	/*
	 * 나의 서재
	 */
	@RequestMapping(value = "/book/mybookshelf.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView mybookshelf(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();

		Customer userInfo = (Customer) session.getAttribute("userInfo");
		int userno = 0;
		if (userInfo == null) {
			userInfo= null;
		
		}
		if(userInfo!=null) {
			userno=userInfo.getUserno();
		}
		
		if(userno==0) {
			return webHelper.redirect("../login/show.do", "로그인 후 이용하세요.");
			
		}


		BookRead br = new BookRead();
		BookInterested bi = new BookInterested();

		bi.setUserno(userno);
		br.setUserno(userno);

		List<Book> BR = null;
		List<Book> BI = null;

		try {
			BR = bookService.getReadList(br);
			BI = bookService.getInterestedList(bi);

		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		model.addAttribute("userInfo", userInfo);

		model.addAttribute("BR", BR);
		model.addAttribute("BI", BI);

		String viewPath = "book/mybookshelf";

		return new ModelAndView(viewPath);

	}

	
	/*
	 * 평점 등록
	 * 
	 */
	@RequestMapping(value = "/book/myreview.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView review(Model model, HttpServletRequest request) {

		HttpSession session = request.getSession();

		Customer userInfo = (Customer) session.getAttribute("userInfo");
		int userno = 0;
		if (userInfo == null) {
			userInfo= null;
		
		}
		if(userInfo!=null) {
			userno=userInfo.getUserno();
		}
		
		// 여기서 팝업을 닫고 로그인 페이지로 보내줘야 하는데...
		if(userno==0) {
			return webHelper.redirect(null, "로그인 후 이용하세요.");
			
		}

		String isbn = webHelper.getString("isbn");

		


		model.addAttribute("userInfo", userInfo);
		model.addAttribute("isbn", isbn);
		
		String viewPath = "book/myreview";
		return new ModelAndView(viewPath);

	}

	/**
	 * 평점등록 ok
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/book/rank_ok.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView rankOK(Model model, HttpServletRequest request) {

		HttpSession session = request.getSession();

		Customer userInfo = (Customer) session.getAttribute("userInfo");
	
		int userno = webHelper.getInt("userno");
		String isbn = webHelper.getString("isbn");
		int value = webHelper.getInt("value");

		BookRank input = new BookRank();
		input.setIsbn(isbn);
		input.setUserno(userno);
		input.setValue(value);

		int cnt = 0;
		try {
			cnt = bookRankService.getBookRankCount(input);
			if (cnt == 0) {
				bookRankService.addBookRank(input);

			} else {
				bookRankService.editBookRank(input);
			}
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		String viewPath = "book/book_detail";
		return new ModelAndView(viewPath);
	}
}
