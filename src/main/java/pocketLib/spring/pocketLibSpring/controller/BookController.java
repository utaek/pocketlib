package pocketLib.spring.pocketLibSpring.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
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

import pocketLib.spring.pocketLibSpring.helper.RegexHelper;
import pocketLib.spring.pocketLibSpring.helper.WebHelper;
import pocketLib.spring.pocketLibSpring.mybatis.model.Book;
import pocketLib.spring.pocketLibSpring.mybatis.model.BookInterested;

import pocketLib.spring.pocketLibSpring.mybatis.model.BookRead;
import pocketLib.spring.pocketLibSpring.mybatis.model.Customer;
import pocketLib.spring.pocketLibSpring.mybatis.service.BookInterestedService;

import pocketLib.spring.pocketLibSpring.mybatis.service.BookReadService;
import pocketLib.spring.pocketLibSpring.mybatis.service.BookService;
import pocketLib.spring.pocketLibSpring.mybatis.service.CustomerService;

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
	RegexHelper regexHelper;

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
		

		if (userInfo != null) {
			

			// 해당 책이 고객의 읽은책, 관심책 목록에 있는지 없는지 count
			BookRead bookread = new BookRead();
			BookInterested bookinterested = new BookInterested();

			bookinterested.setUserno(userInfo.getUserno());
			bookinterested.setIsbn(isbn);

			bookread.setUserno(userInfo.getUserno());
			bookread.setIsbn(isbn);

			try {
				totalCountbI = bookInterestedService.getBookInterestedCount(bookinterested);
		
			} catch (Exception e) {
				return webHelper.redirect(null, e.getLocalizedMessage());
			}
			try {
				totalCountbR = bookReadService.getBookReadCount(bookread);
			} catch (Exception e) {
				return webHelper.redirect(null, e.getLocalizedMessage());
			}

		}
		
		
		model.addAttribute("isbn", isbn);
		model.addAttribute("userInfo", userInfo);
	
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
		
		String date = null;
		if (date == null) {
			Calendar calendar = Calendar.getInstance();
			calendar.add(Calendar.DAY_OF_MONTH, 0);
			date = String.format("%04d%02d%02d%02d%02d%02d", calendar.get(Calendar.YEAR),
					calendar.get(Calendar.MONTH) + 1, calendar.get(Calendar.DAY_OF_MONTH),
					calendar.get(Calendar.HOUR_OF_DAY), calendar.get(Calendar.MINUTE), calendar.get(Calendar.SECOND));
		}
		String regdate = date.replace("-", "");
		
		BookInterested input = new BookInterested();
		input.setIsbn(isbn);
		input.setUserno(userno);
		input.setReg_date(regdate);

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
		
		// 여기서 팝업을 닫고 로그인 페이지로 보내줘야 하는데...
		if(userno==0) {
			return webHelper.redirect(null, "로그인 후 이용하세요.");
			
		}


        
		String isbn = webHelper.getString("isbn");

		
		model.addAttribute("userInfo", userInfo);
		model.addAttribute("isbn", isbn);
		
		String viewPath = "book/br_insert";
		return new ModelAndView(viewPath);

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
		String date =webHelper.getString("date");
		int value = webHelper.getInt("value");
		
		
		if(date==null) {
        Calendar calendar = Calendar.getInstance();
        calendar.add(Calendar.DAY_OF_MONTH, 0);
        date = String.format("%04d%02d%02d%02d%02d%02d", calendar.get(Calendar.YEAR),
              calendar.get(Calendar.MONTH) + 1, calendar.get(Calendar.DAY_OF_MONTH),
              calendar.get(Calendar.HOUR_OF_DAY), calendar.get(Calendar.MINUTE), calendar.get(Calendar.SECOND));
		}

		BookRead input = new BookRead();
		input.setIsbn(isbn);
		input.setUserno(userno);
		input.setValue(value);
		input.setReg_date(date);
		
		int cnt = 0;
		try {
			cnt = bookReadService.getBookReadCount(input);
			if (cnt == 0) {
				bookReadService.addBookRead(input);

			} else {
				bookReadService.editBookRead(input);
			}
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		String viewPath = "book/book_detail";
		return new ModelAndView(viewPath);
	}
	
	
	@RequestMapping(value = "/book/bookstat.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView bookstat(Model model, HttpServletRequest request) {

		HttpSession session = request.getSession();

		Customer userInfo = (Customer) session.getAttribute("userInfo");

		if(userInfo==null) {
			webHelper.redirect("/login/show.do", "로그인 후 이용하세요");
		}
		
		
		BookRead input = new BookRead();
		input.setUserno(userInfo.getUserno());
		BookInterested input2 = new BookInterested();
		input2.setUserno(userInfo.getUserno());
		
		
		
		// 읽은 책 총 권 수 불러오기
		int br_cnt = 0;
		try {
			br_cnt = bookReadService.getBookReadAllCount(input);
		} catch (Exception e) {
			e.printStackTrace();
		}
		// 관심 책 총 권 수 불러오기
		int bi_cnt = 0;
		try {
			bi_cnt = bookInterestedService.getBookInterestedAllCount(input2);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		// 읽은 책 , 관심 책 총 정가 불러오기
				Book priceofbookread = null;
				Book priceofbookinterested = null;

				try {
					priceofbookread = bookService.totalPriceofBookRead(input);
				} catch (Exception e) {
					e.printStackTrace();
				}

				try {
					priceofbookinterested = bookService.totalPriceofBookInterested(input2);
				} catch (Exception e) {
					e.printStackTrace();
				}
		
		// 월별 독서량 불러오기

		List<BookRead> BR = null;
		
		try {
			BR = bookReadService.getCountby_reg_date(input);
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		List<String> reglist= new ArrayList<String>(BR.size());
		List<String> cntlist =new ArrayList<String>(BR.size());
		List<String> totalcntlist =new ArrayList<String>(BR.size());
		int total=0;
		for(int i=0; i<BR.size();i++) {
		
			reglist.add('"'+BR.get(i).getTerm()+'"');
			cntlist.add(String.valueOf(BR.get(i).getCount()));
			
			total= total+BR.get(i).getCount();
			totalcntlist.add(String.valueOf(total));
		}
		
		int avg = 0;
		if (reglist.size() > 0) {
			avg = total / (reglist.size());
		}
		int howlong = 0;
		if (avg > 0) {
			howlong = bi_cnt / avg;
		}
		String termStr = String.join(",", reglist);
		String cntStr =String.join(",", cntlist);
		String totalStr = String.join(",", totalcntlist);
		
		model.addAttribute("avg", avg); // 유저의 월 평균 읽은 책
		model.addAttribute("br_cnt", br_cnt); // 유저의 읽은 책 총 개수
		model.addAttribute("bi_cnt", bi_cnt); // 유저의 관심 책 총 개수
		model.addAttribute("howlong", howlong);

		if (priceofbookread != null) {  // 유저의 읽은 책 총 정가

			model.addAttribute("priceofbookread", priceofbookread.getPriceStandard()); // 읽은 책 총 정가
		}

		if (priceofbookinterested != null) { // 유저의 관심 책 총 정가

			model.addAttribute("priceofbookinterested", priceofbookinterested.getPriceStandard()); // 관심 책 총 정가

		}
		
		model.addAttribute("totalStr", totalStr);// 누적 읽은 책 권수
		model.addAttribute("cntlist", cntStr); // 기간 별 읽은 책 권수
		model.addAttribute("termStr", termStr); // 기간 ex ) 2019-09
		
		
		//------- radar chart---------------
		
		List<Book> BookCate= null;
		
		try {
			BookCate = bookService.getBookReadCate(input);
		} catch (Exception e) {
			e.printStackTrace();
		}
		String[] catelist = new String[8];
		catelist[0] = '"' + "경제경영" + '"';
		catelist[1] = '"' + "과학" + '"';
		catelist[2] = '"' + "사회과학" + '"';
		catelist[3] = '"' + "소설/시/희곡" + '"';
		catelist[4] = '"' + "에세이" + '"';
		catelist[5] = '"' + "역사" + '"';
		catelist[6] = '"' + "인문학" + '"';
		catelist[7] = '"' + "자기계발" + '"';

		String[] catecntlist = new String[8];
		
		// 8개 카테고리 중 count가 가장 높은 것 sort로 찾을 배열
		int[] foundMax = new int[8]; 
		for (int i = 0; i < catelist.length; i++) {

			for (int j = 0; j < BookCate.size(); j++) {
				if (('"' + BookCate.get(j).getCate() + '"').equals(catelist[i]) && BookCate.get(j).getCount() > 0) {
					catecntlist[i] = String.valueOf(BookCate.get(j).getCount());
					foundMax[i] = BookCate.get(j).getCount();
				}
			}
			if (catecntlist[i] == null) {
				catecntlist[i] = String.valueOf(0);
				foundMax[i] = 0;
			}
		}
		Arrays.sort(foundMax);
		int max = foundMax[7]; //마지막이 max

		String catelistStr = String.join(",", catelist);
		String catecntlistStr =String.join(",", catecntlist);

		model.addAttribute("max", Math.floor(max * 1.5)); // 1.5 곱해서 소수점 버림
		model.addAttribute("catelistStr", catelistStr);
		model.addAttribute("catecntlistStr", catecntlistStr);
		
		String viewPath = "book/bookstat";
		return new ModelAndView(viewPath);

	}
	
	
}
