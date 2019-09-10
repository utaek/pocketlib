package pocketLib.spring.pocketLibSpring.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSessionFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import pocketLib.spring.pocketLibSpring.helper.MailHelper;
import pocketLib.spring.pocketLibSpring.helper.PasswordHelper;
import pocketLib.spring.pocketLibSpring.helper.RegexHelper;
import pocketLib.spring.pocketLibSpring.helper.RetrofitHelper;
import pocketLib.spring.pocketLibSpring.helper.WebHelper;
import pocketLib.spring.pocketLibSpring.mybatis.model.Book;
import pocketLib.spring.pocketLibSpring.mybatis.model.BookInterested;
import pocketLib.spring.pocketLibSpring.mybatis.model.Customer;
import pocketLib.spring.pocketLibSpring.mybatis.service.BookInterestedService;
import pocketLib.spring.pocketLibSpring.mybatis.service.BookService;
import pocketLib.spring.pocketLibSpring.mybatis.service.CustomerService;
import pocketLib.spring.pocketLibSpring.retrofit.Service.AladinService;
import pocketLib.spring.pocketLibSpring.retrofit.model.AladinBookList;
import retrofit2.Call;
import retrofit2.Retrofit;

@Controller
public class LoginController {
	@Autowired
	WebHelper webHelper;

	@Autowired
	RegexHelper regexHelper;

	@Autowired
	PasswordHelper passwordHelper;

	@Autowired
	RetrofitHelper retrofitHelper;
	
	@Autowired
	MailHelper mailHelper;

	@Autowired
	SqlSessionFactory sqlFactory;

	@Autowired
	CustomerService customerService;

	@Autowired
	BookService bookService;
	
	@Autowired
	BookInterestedService bookInterestedService;

	// private static final Logger logger =
	// LoggerFactory.getLogger(HomeController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	
	// 로그인 페이지 이동
	@RequestMapping(value = "/login/show.do")
	public String loginPageShow() {

		return "login/login_register";
	}

	// 회원가입 페이지 이동
	@RequestMapping(value = "/login/registerShow.do")
	public String registerPageShow() {

		return "login/sign_up";
	}
	
	// 회원가입 페이지 이동
	@RequestMapping(value = "/login/register.do", method = RequestMethod.GET)
	public String register() {

		return "login/sign_up";
	}
	
	@RequestMapping(value = "/login/findPassword.do")
	public String findPassword() {

		return "login/findPassword";
	}

	// 회원가입 중복체크
	@RequestMapping(value = "/login/register/duplicate.do", method = RequestMethod.GET)
	public ModelAndView registerDuplicate() {

		String userId = webHelper.getString("userID");

		Customer input = new Customer();

		input.setUserId(userId);

		int totalCount = 0;

		try {
			totalCount = customerService.getCustomerCount(input);

		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage(), false);

		}

		if (totalCount > 0) {
			return webHelper.redirect(null, "중복된 아이디입니다.", true);

		} else if (userId == "" || userId == null) {
			return webHelper.redirect(null, "아이디를 입력하세요.", true);

		} else if (!regexHelper.isEngNum(userId)) {
			return webHelper.redirect(null, "아이디는 영어, 숫자만 가능합니다.", true);

		} else {
			return webHelper.redirect(null, "사용 가능한 아이디입니다.", false);
		}

	}

	// 회원가입
	@RequestMapping(value = "/login/registerOk.do", method = RequestMethod.POST)
	public ModelAndView registerOk(Model model, HttpServletRequest request) {
		String userId = webHelper.getString("userID");

		String tmppassword = webHelper.getString("password");

		if (tmppassword == null || tmppassword.equals("")) {
			return webHelper.redirect(null, "비밀번호 입력하세요.");
		}

		if (tmppassword.length() < 8) {
			return webHelper.redirect(null, "비밀번호를 8자 이상 입력하세요.");
		}
		String password = passwordHelper.SHA256(tmppassword);
		String password1 = webHelper.getString("password1");
		String userName = webHelper.getString("userName");
		String year = webHelper.getString("user_birth_year");
		String month = webHelper.getString("user_birth_month");
		String day = webHelper.getString("user_birth_day");
		String birthday = String.join("-", year, month, day);
		String email = webHelper.getString("email");
		String gender = webHelper.getString("userGender");
		String userkey = "N";

		if (!regexHelper.isEngNum(tmppassword)) {
			return webHelper.redirect(null, "비밀번호는 영어, 숫자 조합만 가능합니다.");
		}

		if (!tmppassword.equals(password1)) {
			return webHelper.redirect(null, "비밀번호가 다릅니다.");
		}

		if (userName == null) {
			return webHelper.redirect(null, "이름 입력하세요.");
		}

		if (birthday == null) {
			return webHelper.redirect(null, "생년월일 입력하세요.");
		}
		
		if (email == null) {
			return webHelper.redirect(null, "이메일 주소를 입력하세요.");
		}

		try {
			mailHelper.sendMail(email, "PocketLib 회원가입 인증 메일입니다.", "<h2>안녕하세요. PocketLib 회원가입 인증 메일입니다.</h2>" 
					+ "<h3>" + userName + "님</h3>" + "<p>인증하기 버튼을 누르시면 로그인을 하실 수 있습니다 : " 
					+ "<a href='http://localhost:8080" + request.getContextPath() + "/login/Email.do?userID="+ userId +"&userName=" + userName + "&userkey=" + userkey + "'>인증하기</a></p>");
		}catch(Exception e) {
			e.printStackTrace();
			return webHelper.redirect(null, "메일 발송에 실패했습니다.");
		}

		Customer input = new Customer();
		input.setUserId(userId);
		input.setPassword(password);
		input.setUserName(userName);
		input.setBirthday(birthday);
		input.setEmail(email);
		input.setGender(gender);
		input.setUserkey(userkey);
		List<Book> bookList=null;
		try {
			customerService.addCustomer(input);
			bookList= bookService.getBookList(null);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());

		}

		
	
		model.addAttribute("userName", userName);
		model.addAttribute("input",input);
		model.addAttribute("bookList",bookList);
		
		return new ModelAndView("login/book_sign_up");
	
	}

	// 로그인
	@RequestMapping(value = "/login/login.do", method = RequestMethod.POST)
	public ModelAndView Login(HttpServletRequest request) {

		HttpSession session = request.getSession();
		String userId = webHelper.getString("userId");
		String tmppassword = webHelper.getString("password");

		Customer member = new Customer();

		member.setUserId(userId);

		Customer customer = null;
		try {
			customer = customerService.getLoginCheckId(member);
		} catch (Exception e) {
			e.printStackTrace();
		}

		int totalCount = 0;

		try {
			totalCount = customerService.getCustomerCount(member);

		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());

		}
		if (userId == null || userId.equals("")) {

			return webHelper.redirect(null, "아이디를 입력하세요.");
		}
		if (tmppassword == null || tmppassword.equals("")) {

			return webHelper.redirect(null, "비밀번호를 입력하세요.");

		}

		String password = passwordHelper.SHA256(tmppassword);
		member.setPassword(password);

		if (totalCount <= 0) {
			return webHelper.redirect(null, "아이디가 잘못되었습니다.");
		}
		if (!password.equals(customer.getPassword())) {
			return webHelper.redirect(null, "비밀번호가 잘못되었습니다.");
		}
		
		Customer userkey = null;
		
		try {
			userkey = customerService.getEmailCheck(member);

		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		if(userkey == null) {
			return webHelper.redirect(null, "이메일 인증 완료 후 로그인이 가능합니다.");
		}
		
		

		session.setAttribute("userInfo", customer);
		return webHelper.redirect(request.getContextPath(), null);
	}

	// 마이페이지
	@RequestMapping(value = "/login/mypage.do", method = RequestMethod.GET)
	public String myPage(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		Customer userInfo = (Customer) session.getAttribute("userInfo");
		if (userInfo == null) {
			userInfo = null;
		}

		model.addAttribute("userInfo", userInfo);
		return "mypage/myPage";
	}

	// 마이페이지 회원정보 수정
	@RequestMapping(value = "/login/myPageEdit.do", method = RequestMethod.POST)
	public String myPageEdit(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		Customer userInfo = (Customer) session.getAttribute("userInfo");
		if (userInfo == null) {
			userInfo = null;
		}

		model.addAttribute("userInfo", userInfo);
		return "mypage/myPageEdit";
	}

	// 마이페이지 회원정보 수정 완료
	@RequestMapping(value = "/login/myPageEditOk.do", method = RequestMethod.POST)
	public ModelAndView myPageEditOk(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		Customer userInfo = (Customer) session.getAttribute("userInfo");
		if (userInfo == null) {
			userInfo = null;
		}
		String tmppassword = webHelper.getString("password");

		if (tmppassword == null) {
			return webHelper.redirect(null, "비밀번호 입력하세요.");

		}

		if (tmppassword.length() < 8) {
			return webHelper.redirect(null, "비밀번호를 8자 이상 입력하세요.");

		}

		String password = passwordHelper.SHA256(tmppassword);
		String password1 = webHelper.getString("password1");
		String userName = webHelper.getString("userName");
		String year = webHelper.getString("user_birth_year");
		String month = webHelper.getString("user_birth_month");
		String day = webHelper.getString("user_birth_day");
		String birthday = String.join("-", year, month, day);
		String email = webHelper.getString("email");
		String gender = webHelper.getString("userGender");

		if (!regexHelper.isEngNum(tmppassword)) {
			return webHelper.redirect(null, "비밀번호는 영어, 숫자 조합만 가능합니다.");

		}

		if (!tmppassword.equals(password1)) {
			return webHelper.redirect(null, "비밀번호가 다릅니다.");

		}

		if (userName == null) {
			return webHelper.redirect(null, "이름 입력하세요.");

		}

		if (birthday == null) {
			return webHelper.redirect(null, "생년월일 입력하세요.");

		}

		Customer input = new Customer();
		input.setUserId(userInfo.getUserId());
		input.setPassword(password);
		input.setUserName(userName);
		input.setBirthday(birthday);
		input.setEmail(email);
		input.setGender(gender);

		Customer customer = null;

		try {
			customerService.editCustomer(input);
			customer = customerService.getLoginCheckId(input);
		} catch (Exception e) {

			return webHelper.redirect(null, e.getLocalizedMessage());

		}

		session.setAttribute("userInfo", customer);

		model.addAttribute("userInfo", userInfo);

		return webHelper.redirect("mypage.do", "수정되었습니다.");
	}

	// 로그아웃
	@RequestMapping(value = "/login/logout.do", method = RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest request) {

		request.getSession().removeAttribute("userInfo");

		return webHelper.redirect(request.getContextPath(), "안녕히가세요.");
	}

	
	// 회원가입시 관심책 등록
	
	
	// 이메일 인증 userkey 값을 N에서 Y로
	@RequestMapping(value = "/login/Email.do", method = RequestMethod.GET)
	public String Email(Model model, HttpServletRequest request) {
		String userName = webHelper.getString("userName");
		String userId = webHelper.getString("userID");
		String userkey = "Y";
		
		Customer input = new Customer();
		input.setUserId(userId);
		input.setUserkey(userkey);
		
		try {
			customerService.emailCheck(input);
		} catch (Exception e) {
			e.getLocalizedMessage();

		}
		
		model.addAttribute("userName", userName);
		return "login/Email";
	}
	
	@RequestMapping(value = "/login/newPassword.do",  method = RequestMethod.POST)
	public ModelAndView newPassword(HttpServletRequest request) {
		Random r = new Random();

		int num = r.nextInt(89999) + 10000;

		String npassword = "pocketlib" + Integer.toString(num);
		String userId = webHelper.getString("userID");
		String userName = webHelper.getString("userName");
		String email = webHelper.getString("email");
		
		if (userId == null) {
			return webHelper.redirect(null, "아이디를 입력하세요.");
		}

		if (userName == null) {
			return webHelper.redirect(null, "이름을 입력하세요.");
		}
		
		if (email == null) {
			return webHelper.redirect(null, "이메일 주소를 입력하세요.");
		}
		
		Customer input = new Customer();
		input.setUserId(userId);
		input.setUserName(userName);
		input.setEmail(email);
		
		Customer user = null;
		
		try {
			user = customerService.newPasswordCheck(input);
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		
		if(user == null) {
			return webHelper.redirect(null, "정보가 일치하는 회원이 없습니다. 확인 후 다시 시도해주세요.");
		}
		
		try {
			mailHelper.sendMail(email, "PocketLib 비밀번호 변경 메일입니다.", "<h2>안녕하세요. PocketLib 비밀번호 변경 메일입니다.</h2>" 
					+ "<h3>" + userName + "님</h3>" + "<p>변경된 비밀번호는 " + npassword + "입니다.<br> 확인 후 마이페이지에서 비밀번호를 변경해 주세요.<br>"
							+ "<a href='http://localhost:8080" + request.getContextPath() + "/login/show.do'>로그인하러 가기</a></p>");
		}catch(Exception e) {
			e.printStackTrace();
			return webHelper.redirect(null, "메일 발송에 실패했습니다.");
		}
		
		String password = passwordHelper.SHA256(npassword);
		
		input.setPassword(password);
		
		try {
			customerService.newPassword(input);
		} catch (Exception e) {
			e.printStackTrace();
		}		
		
		return webHelper.redirect("show.do", "이메일로 변경된 비밀번호를 발송하였습니다. 확인 후 로그인 해주세요.");
	}
	
	@RequestMapping(value = "/login/book_register.do", method = RequestMethod.GET)
	public ModelAndView bookInterestedRegister(Model model) {
		int userno = webHelper.getInt("userno");
		String[] isbnList= null;
		if(webHelper.getStringArray("isbn")!=null) {
		isbnList =webHelper.getStringArray("isbn",null);
		}
		
		String isbn = null;
		if(isbnList!=null) {
		for(int i=0; i<isbnList.length;i++) {
			isbn= isbnList[i];
			BookInterested bIInput=new BookInterested();
			bIInput.setIsbn(isbn);
			bIInput.setUserno(userno);
			try {
				if(isbn != null) {
					bookInterestedService.addBookInterested(bIInput);
				}								
			}catch(Exception e) {
				return webHelper.redirect(null, "등록실패");
			}			
		}	
		}
		
		model.addAttribute("userno", userno);		

		if(isbnList != null) {
			return webHelper.redirect("show.do", "책등록이 다 되었습니다 이제 이메일 인증을 해주세요~.");
		} else {
			return webHelper.redirect(null, "책을 한권이상 선택해주세요.");
		}
	}
	
	
}
