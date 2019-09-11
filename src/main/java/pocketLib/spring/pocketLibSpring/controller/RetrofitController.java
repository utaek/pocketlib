package pocketLib.spring.pocketLibSpring.controller;

import java.io.IOException;
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

import pocketLib.spring.pocketLibSpring.helper.RetrofitHelper;
import pocketLib.spring.pocketLibSpring.helper.WebHelper;
import pocketLib.spring.pocketLibSpring.mybatis.model.Book;
import pocketLib.spring.pocketLibSpring.mybatis.model.BookSearching;
import pocketLib.spring.pocketLibSpring.mybatis.model.Customer;
import pocketLib.spring.pocketLibSpring.mybatis.model.Searching;
import pocketLib.spring.pocketLibSpring.mybatis.service.BookSearchingService;
import pocketLib.spring.pocketLibSpring.mybatis.service.BookService;
import pocketLib.spring.pocketLibSpring.mybatis.service.SearchingService;
import pocketLib.spring.pocketLibSpring.retrofit.Service.AladinService;
import pocketLib.spring.pocketLibSpring.retrofit.model.AladinBook;
import pocketLib.spring.pocketLibSpring.retrofit.model.AladinBookList;
import retrofit2.Call;
import retrofit2.Retrofit;

@Controller
public class RetrofitController {
	@Autowired
	WebHelper webHelper;
	@Autowired
	RetrofitHelper retrofitHelper;
	@Autowired
	SqlSession sqlSession;

	@Autowired
	BookService bookService;

	@Autowired
	SearchingService searchingService;
	
	@Autowired
	BookSearchingService bookSearchingService;

	@RequestMapping(value = "/book/bestseller.do", method = RequestMethod.GET)
	public String bestseller(Model model, HttpServletRequest request) {
		Retrofit retrofit = retrofitHelper.getRetrofit(AladinService.BASE_URL);
		HttpSession session = request.getSession();

		Customer userInfo = (Customer) session.getAttribute("userInfo");
		if (userInfo == null) {
			userInfo = null;
		}
		// Service 객체를 생성한다. 구현체는 Retrofit이 자동으로 생성해 준다.
		AladinService aladinService = retrofit.create(AladinService.class);

		String category = webHelper.getString("category");
		AladinBookList aladinBookList = null;

		int categoryId = 0;
		if (category != null) {
			categoryId = Integer.parseInt(category);
		} else {
			categoryId = 336; // 기본은 일단 자기계발 서적으로 선택해놓음
		}

		// 검색 결과 저장할 beans 객체 선언
		String ttbkey = "ttbfreda70890100001";
		String queryType = "Bestseller";
		int maxResults = 20;
		String cover = "Big";
		int start = 1;
		String searchTarget = "Book";
		String output = "js";
		int version = 20131101;

		Call<AladinBookList> call = aladinService.getBestseller(ttbkey, queryType, maxResults, cover, start,
				searchTarget, categoryId, output, version);
		try {
			aladinBookList = call.execute().body();
		} catch (IOException e) {
			e.printStackTrace();
		}

		Book book = new Book();
		for (AladinBookList.Item item : aladinBookList.item) {
			book.setIsbn(item.isbn);
			book.setTitle(item.title);
			book.setAuthor(item.author);
			book.setDescription(item.description);
			book.setPriceSales(item.priceSales);
			book.setPriceStandard(item.priceStandard);
			book.setPublisher(item.publisher);
			book.setCategoryId(item.categoryId);
			book.setCategoryName(item.categoryName);
			book.setPubDate(item.pubDate);
			book.setCover(item.cover);
			book.setCustomerReviewRank(item.customerReviewRank);
			try {
				bookService.addBook(book);
			} catch (Exception e) {
				e.getLocalizedMessage();
			}
		}

		model.addAttribute("userInfo", userInfo);
		model.addAttribute(categoryId);
		model.addAttribute(aladinBookList);

		return "book/bestseller";

	}

	@RequestMapping(value = "/book/item_new_special.do", method = RequestMethod.GET)
	public String itemNewSpecial(Model model, HttpServletRequest request) {
		Retrofit retrofit = retrofitHelper.getRetrofit(AladinService.BASE_URL);
		HttpSession session = request.getSession();

		Customer userInfo = (Customer) session.getAttribute("userInfo");
		if (userInfo == null) {
			userInfo = null;
		}
		// Service 객체를 생성한다. 구현체는 Retrofit이 자동으로 생성해 준다.
		AladinService aladinService = retrofit.create(AladinService.class);

		String category = webHelper.getString("category");
		AladinBookList aladinBookList = null;

		int categoryId = 0;
		if (category != null) {
			categoryId = Integer.parseInt(category);
		} else {
			categoryId = 336; // 기본은 일단 자기계발 서적으로 선택해놓음
		}

		// 검색 결과 저장할 beans 객체 선언
		String ttbkey = "ttbfreda70890100001";
		String queryType = "ItemNewSpecial";
		String cover = "Big";
		int maxResults = 20;
		int start = 1;
		String searchTarget = "Book";
		String output = "js";
		int version = 20131101;

		Call<AladinBookList> call = aladinService.getItemNewAll(ttbkey, queryType, maxResults, cover, start,
				searchTarget, categoryId, output, version);
		try {
			aladinBookList = call.execute().body();
		} catch (IOException e) {
			e.printStackTrace();
		}

		Book book = new Book();
		for (AladinBookList.Item item : aladinBookList.item) {
			book.setIsbn(item.isbn);
			book.setTitle(item.title);
			book.setAuthor(item.author);
			book.setDescription(item.description);
			book.setPriceSales(item.priceSales);
			book.setPriceStandard(item.priceStandard);
			book.setPublisher(item.publisher);
			book.setCategoryId(item.categoryId);
			book.setCategoryName(item.categoryName);
			book.setPubDate(item.pubDate);
			book.setCover(item.cover);
			book.setCustomerReviewRank(item.customerReviewRank);
			try {
				bookService.addBook(book);
			} catch (Exception e) {
				e.getLocalizedMessage();
			}
		}
		model.addAttribute("userInfo", userInfo);
		model.addAttribute(categoryId);
		model.addAttribute(aladinBookList);

		return "book/item_new_special";

	}

	@RequestMapping(value = "/book/booksearch.do", method = RequestMethod.GET)
	public ModelAndView booksearch(Model model, HttpServletRequest request) {
		Retrofit retrofit = retrofitHelper.getRetrofit(AladinService.BASE_URL);
		HttpSession session = request.getSession();

		Customer userInfo = (Customer) session.getAttribute("userInfo");

		if (userInfo == null) {
			userInfo = null;
		}

		// Service 객체를 생성한다. 구현체는 Retrofit이 자동으로 생성해 준다.
		AladinService aladinService = retrofit.create(AladinService.class);

		int totalCount = 0;

		// 검색키워드 받기
		String query = webHelper.getString("query", "");

		Searching input = new Searching();
		input.setQueryValue(query);
		
		try {
			totalCount = searchingService.queryCount(input);
		} catch (Exception e) {
			e.printStackTrace();
		}
		List<Book> bookSearchingList =null;
		
		if (totalCount > 0) {
			try {
				searchingService.addQueryValue(input);
				bookSearchingList=bookService.getBookSearchingList(input);

			} catch (Exception e) {
				e.getLocalizedMessage();
			}
			model.addAttribute("search",bookSearchingList);
		} else {
			try {
				searchingService.addQueryValue(input);

			} catch (Exception e) {
				e.getLocalizedMessage();
			}
			// 검색 결과 저장할 beans 객체 선언
			AladinBook search = null;
			String ttbkey = "ttbfreda70890100001";
			String queryType = "Title";
			int maxResults = 50;
			String cover = "Big";
			int start = 1;
			String searchTarget = "Book";
			String output = "js";
			int version = 20131101;

			// 검색어 존재할 경우 검색결과받기
			if (!query.equals("")) {

				Call<AladinBook> call = aladinService.getAladinBookSearch(ttbkey, query, queryType, maxResults, cover,
						start, searchTarget, output, version);
				try {
					search = call.execute().body();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			Book book = new Book();
			BookSearching bookSearching = new BookSearching();

			if (search != null) {
				for (AladinBook.Item item : search.item) {
					book.setIsbn(item.isbn);
					book.setTitle(item.title);
					book.setAuthor(item.author);
					book.setDescription(item.description);
					book.setPriceSales(item.priceSales);
					book.setPriceStandard(item.priceStandard);
					book.setPublisher(item.publisher);
					book.setCategoryId(item.categoryId);
					book.setCategoryName(item.categoryName);
					book.setPubDate(item.pubDate);
					book.setCover(item.cover);
					book.setCustomerReviewRank(item.customerReviewRank);
					bookSearching.setIsbn(item.isbn);
					bookSearching.setQueryid(input.getQueryid());

					try {
						bookService.addBook(book);
						bookSearchingService.addIntoBookSearching(bookSearching);
						
					} catch (Exception e) {
						e.getLocalizedMessage();
					}
					
				}
			}

			model.addAttribute("userInfo", userInfo);
			model.addAttribute("search", search.item);
		}
		
		String viewPath = "book/booksearch";
		return new ModelAndView(viewPath);

	}
}
