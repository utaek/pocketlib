package pocketLib.spring.pocketLibSpring.controller;


import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import pocketLib.spring.pocketLibSpring.helper.PageData;
import pocketLib.spring.pocketLibSpring.helper.WebHelper;
import pocketLib.spring.pocketLibSpring.mybatis.model.Board;
import pocketLib.spring.pocketLibSpring.mybatis.model.Book;
import pocketLib.spring.pocketLibSpring.mybatis.model.BookRead;
import pocketLib.spring.pocketLibSpring.mybatis.model.Comment;
import pocketLib.spring.pocketLibSpring.mybatis.model.Customer;
import pocketLib.spring.pocketLibSpring.mybatis.model.LoveHate;
import pocketLib.spring.pocketLibSpring.mybatis.service.BoardService;
import pocketLib.spring.pocketLibSpring.mybatis.service.BookService;
import pocketLib.spring.pocketLibSpring.mybatis.service.CommentService;
import pocketLib.spring.pocketLibSpring.mybatis.service.CustomerService;
import pocketLib.spring.pocketLibSpring.mybatis.service.LoveHateService;

@Controller
public class BoardController {
	@Autowired
	WebHelper webHelper;

	@Autowired
	BoardService boardService;

	@Autowired
	CustomerService customerService;

	@Autowired
	CommentService commentService;

	@Autowired
	LoveHateService lovehateService;
	
	@Autowired
	BookService bookService;

	@RequestMapping(value = "/board/board_list.do", method = RequestMethod.GET)
	public ModelAndView list(Model model, HttpServletRequest request) { // 메서드 이름은 아무런 영향이 없음. 자유롭게정의
		HttpSession session = request.getSession();
		Customer userInfo = (Customer) session.getAttribute("userInfo");
		
		int userno=0;
		if (userInfo == null) {
			userInfo = null;
		}else {
		userno = userInfo.getUserno(); 
		}
		List<Book> list =null;
		BookRead bR =new BookRead();
		bR.setUserno(userno);
		
		try {
			list= bookService.getItemByUserNo(bR);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		int listLength = list.size();
		String keyword = webHelper.getString("keyword", "");
		int nowPage = webHelper.getInt("page", 1);
		int boardCate = webHelper.getInt("boardCate", 1);
		String keywordOption = "title_content";

		if (webHelper.getString("searchList") != null) {
			keywordOption = webHelper.getString("searchList");
		}
		String sortCate = "order";

		if (webHelper.getString("sortCate") != null) {
			sortCate = webHelper.getString("sortCate");
		}

		// 전체 게시글 수
		int totalCount = 0;
		// 한 페이지당 표시할 목록수
		int listCount = 12;
		// 한 그룹당 표시할 페이지 번호 수
		int pageCount = 5;

		/** 3) 데이터 조회하기 */
		// 조회에 필요한 조건값(검색어)를 Beans에 담는다
		Board input = new Board();
		input.setTitle(keyword);
		input.setContent(keyword);
		input.setUserId(keyword);
		input.setBoardCate(boardCate);
		input.setSortCate(sortCate);

		// 조회결과가 저장될 객체
		List<Board> output = null;
		List<Board> output2 = null;
		List<Board> output3 = null;
		PageData pageData = null;

		try {
			// 전체 게시글 수 조회
			totalCount = boardService.getBoardOptionCount(input, keywordOption);

			// 페이지 번호 계산 --> 계산결과를 로그로 출력
			pageData = new PageData(nowPage, totalCount, listCount, pageCount);

			// SQL의 LIMIT절에서 사용될 값을 Beans의 static 변수에 저장
			Board.setOffset(pageData.getOffset());
			Board.setListCount(pageData.getListCount());

			// 데이터 저장
			// --> 데이터 저장에 성공하면 파라미터로 전달하는 input객체에 pk값이 저장
			
			output = boardService.getBoardOptionList(input, keywordOption);
			output2 = boardService.getNoticeList();
			

			input.getBoardCate();
		} catch (Exception e) {
			// 에러발생시 DB접속을 끊고 에러 메시지를 표시한후 이전페이지로 이동
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		int boardOrder = totalCount - (pageData.getListCount() * (pageData.getNowPage() - 1));

		model.addAttribute("userInfo", userInfo);
		model.addAttribute("keyword", keyword);
		model.addAttribute("output", output);
		model.addAttribute("output2", output2);
		model.addAttribute("pageData", pageData);
		model.addAttribute("boardCate", boardCate);
		model.addAttribute("boardOrder", boardOrder);
		model.addAttribute("length",listLength);

		String viewPath = "board/board_list";
		return new ModelAndView(viewPath);
	}

	@RequestMapping(value = "/board/board_add.do", method = RequestMethod.GET)
	public String add(Model model, HttpServletRequest request) { // 메서드 이름은 아무런 영향이 없음. 자유롭게정의
		HttpSession session = request.getSession();
		Customer userInfo = (Customer) session.getAttribute("userInfo");
		int userno = userInfo.getUserno(); 
		List<Book> list =null;
		BookRead input =new BookRead();
		input.setUserno(userno);
		try {
			list= bookService.getItemByUserNo(input);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		if (userInfo == null) {
			userInfo = null;
		}

		int boardCate = webHelper.getInt("boardCate");

		model.addAttribute("boardCate", boardCate);
		model.addAttribute("list",list);
		return "board/board_add";
	}

	@RequestMapping(value = "/board/board_add_ok.do", method = RequestMethod.POST)
	public ModelAndView add_ok(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		Customer userInfo = (Customer) session.getAttribute("userInfo");

		if (userInfo == null) {
			userInfo = null;
		}

		String Id = userInfo.getUserId();
		int No = userInfo.getUserno();
		String date = webHelper.getString("reg_date");
		int boardCate = webHelper.getInt("boardCate");
		String isbn = webHelper.getString("isbn");
	

		if (date == null) {
			Calendar calendar = Calendar.getInstance();
			calendar.add(Calendar.DAY_OF_MONTH, 0);
			date = String.format("%04d%02d%02d%02d%02d%02d", calendar.get(Calendar.YEAR),
					calendar.get(Calendar.MONTH) + 1, calendar.get(Calendar.DAY_OF_MONTH),
					calendar.get(Calendar.HOUR_OF_DAY), calendar.get(Calendar.MINUTE), calendar.get(Calendar.SECOND));
		}
		String regdate = date.replace("-", "");

		/** 2) 사용자가 입력한 파라미터 수신 및 유효성 검사 */
		String title = webHelper.getString("title");
		String content = webHelper.getString("content");
		
		title = title.replaceAll(">", "&gt;");
		title = title.replaceAll("<", "&lt;");

		// 학과 이름은 필수항목이므로 입력여부를 검사
		// 위치는 미필수(null 허용)이므로 입력여부를 검사하지 않는다
		if (title == null) {
			return webHelper.redirect(null, "제목을 입력하세요");

		}
		if (content == null) {
			return webHelper.redirect(null, "내용을 입력하세요");

		}

		/** 3) 데이터 저장하기 */
		// 저장할 값들을 Beans에 담는다
		Board input = new Board();
		input.setUserNo(No);
		input.setUserId(Id);
		input.setTitle(title);
		input.setContent(content);
		input.setReg_date(regdate);
		input.setBoardCate(boardCate);
		input.setIsbn(isbn);

		try {
			// 데이터 저장
			// --> 데이터 저장에 성공하면 파라미터로 전달하는 input객체에 pk값이 저장
			if(boardCate==2) {
				boardService.addBoard2(input);
			}else {
				boardService.addBoard(input);
			}
		} catch (Exception e) {
			// 에러발생시 DB접속을 끊고 에러 메시지를 표시한후 이전페이지로 이동
			return webHelper.redirect(null, e.getLocalizedMessage());

		}
		model.addAttribute("userInfo", userInfo);

		/** 5) 결과를 확인하기 위한 페이지 이동 */
		// 저장 결과를 확인하기 위해서 데이터 저장시 생성된 pk값을 상세 페이지로 전달
		return webHelper.redirect("board_view.do?boardCate=" + input.getBoardCate() + "&boardNo=" + input.getBoardNo() + "&isbn=" + input.getIsbn(),
				"저장되었습니다.");

	}

	@RequestMapping(value = "/board/board_view.do", method = RequestMethod.GET)
	public ModelAndView view(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		Customer userInfo = (Customer) session.getAttribute("userInfo");

		if (userInfo == null) {
			userInfo = null;
		}
		List<Comment> commentList = null;

		// <input> 태그의 name 속성값을 사용하여 사용자의 입력값을 받는다.
		String mycookie = webHelper.getString("boardNo");
		String myCookie = null;

		// 입력값의 존재 여부에 따른 분기
		if (mycookie != null) {
			/** 입력값이 존재할 경우 쿠키 저장(혹은 덮어쓰기) */
			webHelper.setCookie("mycookie" + mycookie, mycookie, 60 * 60 * 24);
		} else {
			webHelper.setCookie("mycookie" + mycookie, mycookie, -1);
		}

		/** 2) 필요한 변수값 생성 */
		// 조회할 대상에 대한 pk값
		int boardno = webHelper.getInt("boardNo");
		int hits = webHelper.getInt("hits");
		int boardCate = webHelper.getInt("boardCate");
		int love = webHelper.getInt("love");
		int hate = webHelper.getInt("hate");
		String keyword = webHelper.getString("keyword", "");
		String keywordOption = "title_content";
		String sortCate = "order";
		String isbn = webHelper.getString("isbn");

		if (webHelper.getString("searchList") != null) {
			keywordOption = webHelper.getString("searchList");
		}

		if (webHelper.getString("sortCate") != null) {
			sortCate = webHelper.getString("sortCate");
		}

		// 이 값이 존재하지 않는다면 데이터 조회가 불가능하므로 반드시 필수값으로 처리해야함
		if (boardno == 0) {
			return webHelper.redirect(null, "게시글이 없습니다");

		}

		int totalCount = 0;

		/** 3) 데이터 조회하기 */
		// 저장할 값들을 Beans에 담는다
		Board input = new Board();
		Comment cmtInput = new Comment();
		cmtInput.setBoardNo(boardno);
		input.setBoardNo(boardno);
		input.setHits(hits);
		input.setLove(love);
		input.setHate(hate);
		
		// 조회결과를 저장할 객체 선언
		Board output = null;
		Book book = new Book();
		book.setIsbn(isbn);
		// 쿠키목록이 있다면,
		myCookie = webHelper.getCookie("mycookie" + mycookie);

		try {
			// 데이터 조회
			// --> 데이터 저장에 성공하면 파라미터로 전달하는 input객체에 pk값이 저장
			output = boardService.getBoardItem(input);
			commentList = commentService.getCommentList(cmtInput);
			if(boardCate==2 && isbn!=null) {
			book = bookService.getBookItem(book);
			}

			if (myCookie == null) {
				boardService.editViewCount(input);
			}

			totalCount = customerService.getCustomerCount(userInfo);
		} catch (Exception e) {
			// 에러발생시 DB접속을 끊고 에러 메시지를 표시한후 이전페이지로 이동
			return webHelper.redirect(null, e.getLocalizedMessage());

		}
		String bookTitle = book.getTitle();
		String bookCover = book.getCover();

		model.addAttribute("output", output);
		model.addAttribute("commentList", commentList);
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("boardCate", boardCate);
		model.addAttribute("keyword", keyword);
		model.addAttribute("keywordOption", keywordOption);
		model.addAttribute("sortCate", sortCate);
		model.addAttribute("boardno", boardno);
		model.addAttribute("bookTitle", bookTitle);
		model.addAttribute("bookCover", bookCover);

		String viewPath = "board/board_view";
		return new ModelAndView(viewPath);
	}

	@RequestMapping(value = "/board/board_edit.do", method = RequestMethod.GET)
	public ModelAndView edit(Model model) {

		int boardno = webHelper.getInt("boardNo");
		int boardCate = webHelper.getInt("boardCate");
		/** 3) 데이터 조회하기 */
		// 저장할 값들을 Beans에 담는다
		Board input = new Board();
		input.setBoardNo(boardno);

		// 조회결과를 저장할 객체 선언
		Board output = null;

		try {
			// 데이터 조회
			// --> 데이터 저장에 성공하면 파라미터로 전달하는 input객체에 pk값이 저장
			output = boardService.getBoardItem(input);

		} catch (Exception e) {
			// 에러발생시 DB접속을 끊고 에러 메시지를 표시한후 이전페이지로 이동

			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		model.addAttribute("output", output);
		model.addAttribute("boardCate", boardCate);
		model.addAttribute("boardno", boardno);

		String viewPath = "board/board_edit";
		return new ModelAndView(viewPath);
	}

	@RequestMapping(value = "/board/board_edit_ok.do", method = RequestMethod.POST)
	public ModelAndView edit_ok(Model model) {

		int boardno = webHelper.getInt("boardNo");
		String date = webHelper.getString("reg_date");
		int boardCate = webHelper.getInt("boardCate");

		if (date == null) {
			Calendar calendar = Calendar.getInstance();
			calendar.add(Calendar.DAY_OF_MONTH, 0);
			date = String.format("%04d%02d%02d%02d%02d%02d", calendar.get(Calendar.YEAR),
					calendar.get(Calendar.MONTH) + 1, calendar.get(Calendar.DAY_OF_MONTH),
					calendar.get(Calendar.HOUR_OF_DAY), calendar.get(Calendar.MINUTE), calendar.get(Calendar.SECOND));
		}
		String regdate = date.replace("-", "");

		/** 2) 사용자가 입력한 파라미터 수신 및 유효성 검사 */
		String title = webHelper.getString("title");
		String content = webHelper.getString("content");

		// 학과 이름은 필수항목이므로 입력여부를 검사
		// 위치는 미필수(null 허용)이므로 입력여부를 검사하지 않는다
		if (title == null) {
			return webHelper.redirect(null, "제목을 입력하세요");

		}
		if (content == null) {
			return webHelper.redirect(null, "내용을 입력하세요");

		}

		/** 3) 데이터 저장하기 */
		// 저장할 값들을 Beans에 담는다
		Board input = new Board();
		input.setBoardNo(boardno);
		input.setTitle(title);
		input.setContent(content);
		input.setReg_date(regdate);
		Board output = new Board();
		try {
			// 데이터 저장
			// --> 데이터 저장에 성공하면 파라미터로 전달하는 input객체에 pk값이 저장
			boardService.editBoard(input);
			output = boardService.getBoardItem(input);
		} catch (Exception e) {
			// 에러발생시 DB접속을 끊고 에러 메시지를 표시한후 이전페이지로 이동
			return webHelper.redirect(null, e.getLocalizedMessage());

		}
		model.addAttribute("boardno", boardno);
		/** 5) 결과를 확인하기 위한 페이지 이동 */
		// 저장 결과를 확인하기 위해서 데이터 저장시 생성된 pk값을 상세 페이지로 전달
		return webHelper.redirect("board_view.do?boardCate=" + boardCate + "&boardNo=" + input.getBoardNo() +"&isbn="+output.getIsbn(),
				"수정되었습니다.");

	}

	@RequestMapping(value = "/board/board_delete_ok.do", method = RequestMethod.GET)
	public ModelAndView delete_ok(Model model) {
		int boardno = webHelper.getInt("boardNo");
		int boardCate = webHelper.getInt("boardCate");
		// 이 값이 존재하지 않는다면 데이터 삭제가 불가능하므로 반드시 필수값으로 처리
		if (boardno == 0) {
			return webHelper.redirect(null, "게시글이 없습니다.");
		}

		/** 3) 데이터 삭제하기 */
		// 삭제에 피룡한 조건값을 Beans에 저장
		Board input = new Board();
		input.setBoardNo(boardno);
		input.setBoardCate(boardCate);
		try {
			// 데이터 삭제
			boardService.deleteBoard(input);
		} catch (Exception e) {
			// 에러발생시 DB접속을 끊고 에러 메시지를 표시한후 이전페이지로 이동
			return webHelper.redirect(null, e.getLocalizedMessage());

		}

		/** 5) 결과를 확인하기 위한 페이지 이동 */
		// 확인할 대상이 삭제된 상태이므로 목록페이지로 이동
		return webHelper.redirect("board_list.do?boardCate=" + input.getBoardCate(), "삭제되었습니다.");
	}

	@RequestMapping(value = "/board/love_hate_ok.do", method = RequestMethod.GET)
	public ModelAndView love_hate(Model model, HttpServletRequest request) {

		HttpSession session = request.getSession();
		Customer userInfo = (Customer) session.getAttribute("userInfo");

		if (userInfo == null) {
			userInfo = null;
		}

		if (userInfo == null) {
			return webHelper.redirect(null, "추천은 로그인 후 이용해주세요.");
		}

		int No = userInfo.getUserno();
		LoveHate lH = new LoveHate();
		int boardCate = webHelper.getInt("boardCate");
		int boardNo = webHelper.getInt("boardNo");
		int count;
		int type = webHelper.getInt("type");
		Board boardInput = new Board();
		boardInput.setBoardNo(boardNo);
		lH.setBoardNo(boardNo);
		lH.setUserNo(No);

		try {
			count = lovehateService.getLoveHateOptionCount(lH);
		} catch (Exception e) {

			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		/** 2) 사용자가 입력한 파라미터 수신 및 유효성 검사 */

		// 학과 이름은 필수항목이므로 입력여부를 검사
		// 위치는 미필수(null 허용)이므로 입력여부를 검사하지 않는다

		if (count == 1) {
			return webHelper.redirect(null, "이미 누르셨습니다.");

		} else if (type == 0) {
			try {
				boardService.editBoardLove(boardInput);
			} catch (Exception e) {
				return webHelper.redirect(null, e.getLocalizedMessage());

			}

		} else {
			try {
				boardService.editBoardHate(boardInput);
			} catch (Exception e) {
				return webHelper.redirect(null, e.getLocalizedMessage());

			}

		}

		/** 3) 데이터 저장하기 */
		// 저장할 값들을 Beans에 담는다
		LoveHate input = new LoveHate();
		input.setBoardNo(boardNo);
		input.setUserNo(No);
		input.setLoveType(type);

		try {
			lovehateService.addLoveHate(input);
		} catch (Exception e) {

			return webHelper.redirect(null, e.getLocalizedMessage());

		}
		/** 5) 결과를 확인하기 위한 페이지 이동 */
		// 저장 결과를 확인하기 위해서 데이터 저장시 생성된 pk값을 상세 페이지로 전달
		if (input.getLoveType() == 0) {
			return webHelper.redirect("board_view.do?boardCate=" + boardCate + "&boardNo=" + boardNo, "추천되었습니다.");
		} else {
			return webHelper.redirect("board_view.do?boardCate=" + boardCate + "&boardNo=" + boardNo, "비추천되었습니다.");
		}

	}

	@RequestMapping(value = "/board/cmt_edit_ok.do", method = RequestMethod.POST)
	public ModelAndView cmt_edit_ok(Model model) {

		int boardno = webHelper.getInt("boardNo");
		String date = webHelper.getString("reg_date");
		int boardCate = webHelper.getInt("boardCate");
		int cmtNo = webHelper.getInt("cmtNo");
		String cmt_content = webHelper.getString("cmt_content");

		if (date == null) {
			Calendar calendar = Calendar.getInstance();
			calendar.add(Calendar.DAY_OF_MONTH, 0);
			date = String.format("%04d%02d%02d%02d%02d%02d", calendar.get(Calendar.YEAR),
					calendar.get(Calendar.MONTH) + 1, calendar.get(Calendar.DAY_OF_MONTH),
					calendar.get(Calendar.HOUR_OF_DAY), calendar.get(Calendar.MINUTE), calendar.get(Calendar.SECOND));
		}
		String regdate = date.replace("-", "");

		/** 2) 사용자가 입력한 파라미터 수신 및 유효성 검사 */

		// 학과 이름은 필수항목이므로 입력여부를 검사
		// 위치는 미필수(null 허용)이므로 입력여부를 검사하지 않는다
		if (cmt_content == null) {
			return webHelper.redirect(null, "내용을 입력하세요");

		}

		/** 3) 데이터 저장하기 */
		// 저장할 값들을 Beans에 담는다
		Comment input = new Comment();
		input.setCmt_reg_date(regdate);
		input.setCmtNo(cmtNo);
		input.setCmt_content(cmt_content);
		Board input2 = new Board();
		input2.setBoardNo(boardno);
		Board output = new Board();

		try {
			// 데이터 저장
			// --> 데이터 저장에 성공하면 파라미터로 전달하는 input객체에 pk값이 저장
			commentService.editComment(input);
			output = boardService.getBoardItem(input2);
		} catch (Exception e) {
			// 에러발생시 DB접속을 끊고 에러 메시지를 표시한후 이전페이지로 이동
			return webHelper.redirect(null, e.getLocalizedMessage());

		}

		model.addAttribute("boardno", boardno);
		model.addAttribute("boardCate", boardCate);

		/** 5) 결과를 확인하기 위한 페이지 이동 */
		// 저장 결과를 확인하기 위해서 데이터 저장시 생성된 pk값을 상세 페이지로 전달
		return webHelper.redirect("board_view.do?boardCate=" + boardCate + "&boardNo=" + boardno + "&isbn="+output.getIsbn(), "수정되었습니다.");
	}

	@RequestMapping(value = "/board/cmt_add_ok.do", method = RequestMethod.POST)
	public ModelAndView cmt_add_ok(Model model, HttpServletRequest request) {

		HttpSession session = request.getSession();
		Customer userInfo = (Customer) session.getAttribute("userInfo");
		
		
		if (userInfo == null) {
			userInfo = null;
		}

		int boardCate = webHelper.getInt("boardCate");

		int boardno = webHelper.getInt("boardNo");
		String Id = userInfo.getUserId();
		int cmtNo = webHelper.getInt("cmtNo");
		int No = userInfo.getUserno();
		String date = webHelper.getString("reg_date");

		if (date == null) {
			Calendar calendar = Calendar.getInstance();
			calendar.add(Calendar.DAY_OF_MONTH, 0);
			date = String.format("%04d%02d%02d%02d%02d%02d", calendar.get(Calendar.YEAR),
					calendar.get(Calendar.MONTH) + 1, calendar.get(Calendar.DAY_OF_MONTH),
					calendar.get(Calendar.HOUR_OF_DAY), calendar.get(Calendar.MINUTE), calendar.get(Calendar.SECOND));
		}
		String regdate = date.replace("-", "");

		/** 2) 사용자가 입력한 파라미터 수신 및 유효성 검사 */
		String cmt_content = webHelper.getString("cmt_content");

		// 학과 이름은 필수항목이므로 입력여부를 검사
		// 위치는 미필수(null 허용)이므로 입력여부를 검사하지 않는다

		if (cmt_content == null) {
			return webHelper.redirect(null, "내용을 입력하세요");

		}

		/** 3) 데이터 저장하기 */
		// 저장할 값들을 Beans에 담는다
		Comment input = new Comment();

		input.setUserNo(No);
		input.setUserId(Id);
		input.setCmt_content(cmt_content);
		input.setCmt_reg_date(regdate);
		input.setBoardNo(boardno);
		input.setCcmt_ref(cmtNo);
		Board input2 = new Board();
		input2.setBoardNo(boardno);
		Board output = new Board();

		try {
			// 데이터 저장
			// --> 데이터 저장에 성공하면 파라미터로 전달하는 input객체에 pk값이 저장
			commentService.addComment(input);
			commentService.editRefComment(input);
			output = boardService.getBoardItem(input2);
		} catch (Exception e) {

			return webHelper.redirect(null, e.getLocalizedMessage());

		}
		model.addAttribute("boardCate", boardCate);
		model.addAttribute("boardno", boardno);

		/** 5) 결과를 확인하기 위한 페이지 이동 */
		// 저장 결과를 확인하기 위해서 데이터 저장시 생성된 pk값을 상세 페이지로 전달
		return webHelper.redirect("board_view.do?boardCate=" + boardCate + "&boardNo=" + boardno + "&isbn="+output.getIsbn(), "저장되었습니다.");
	}

	@RequestMapping(value = "/board/cmt_delete_ok.do", method = RequestMethod.GET)
	public ModelAndView cmt_delete_ok(Model model) {
		int boardno = webHelper.getInt("boardNo");
		int boardCate = webHelper.getInt("boardCate");
		int cmtNo = webHelper.getInt("cmtNo");
		// 이 값이 존재하지 않는다면 데이터 삭제가 불가능하므로 반드시 필수값으로 처리
		if (boardno == 0) {
			return webHelper.redirect(null, "게시글이 없습니다.");

		}

		/** 3) 데이터 삭제하기 */
		// 삭제에 피룡한 조건값을 Beans에 저장
		Comment input = new Comment();
		input.setCmtNo(cmtNo);

		try {
			// 데이터 삭제
			commentService.deleteComment(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());

		}

		/** 5) 결과를 확인하기 위한 페이지 이동 */
		// 확인할 대상이 삭제된 상태이므로 목록페이지로 이동
		return webHelper.redirect("board_view.do?boardCate=" + boardCate + "&boardNo=" + boardno, "삭제되었습니다.");
	}

	@RequestMapping(value = "/board/cmt_love_hate_ok.do", method = RequestMethod.GET)
	public ModelAndView cmt_love_hate_ok(Model model, HttpServletRequest request) {

		HttpSession session = request.getSession();
		Customer userInfo = (Customer) session.getAttribute("userInfo");
	
		if (userInfo == null) {
			userInfo = null;
		}

		if (userInfo == null) {
			return webHelper.redirect(null, "추천은 로그인 후 이용해주세요.");
		}
		int No = userInfo.getUserno();
		LoveHate lH = new LoveHate();
		int boardCate = webHelper.getInt("boardCate");
		int cmtNo = webHelper.getInt("cmtNo");
		int boardNo = webHelper.getInt("boardNo");
		
		int count;
		int type = webHelper.getInt("type");
		int cateType = 1;
		Comment comment = new Comment();
		comment.setCmtNo(cmtNo);
		lH.setCmtNo(cmtNo);
		lH.setUserNo(No);
		//isbn 받기위해 책을 boardno 로 가져온다
		Board input2 = new Board();
		input2.setBoardNo(boardNo);
		Board output = new Board();
		try {
			count = lovehateService.getLoveHateCmtCount(lH);
			output = boardService.getBoardItem(input2);
			
			
		} catch (Exception e) {

			return webHelper.redirect(null, e.getLocalizedMessage());

		}

		/** 2) 사용자가 입력한 파라미터 수신 및 유효성 검사 */

		// 학과 이름은 필수항목이므로 입력여부를 검사
		// 위치는 미필수(null 허용)이므로 입력여부를 검사하지 않는다

		if (count == 1) {
			return webHelper.redirect(null, "이미 누르셨습니다.");

		} else if (type == 0) {
			try {
				commentService.editLoveCount(comment);
			} catch (Exception e) {
				return webHelper.redirect(null, e.getLocalizedMessage());

			}

		} else {
			try {
				commentService.editHateCount(comment);
			} catch (Exception e) {

				return webHelper.redirect(null, e.getLocalizedMessage());

			}

		}

		/** 3) 데이터 저장하기 */
		// 저장할 값들을 Beans에 담는다
		LoveHate input = new LoveHate();
		input.setBoardNo(boardNo);
		input.setCmtNo(cmtNo);
		input.setUserNo(No);
		input.setLoveType(type);
		input.setType(cateType);

		try {
			lovehateService.addLoveHate(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());

		}

		/** 5) 결과를 확인하기 위한 페이지 이동 */
		// 저장 결과를 확인하기 위해서 데이터 저장시 생성된 pk값을 상세 페이지로 전달
		if(input.getLoveType()==0) {
			return webHelper.redirect("board_view.do?boardCate=" + boardCate+ "&boardNo=" + boardNo +"&isbn=" + output.getIsbn(), "추천되었습니다.");
		}else {
			return webHelper.redirect("board_view.do?boardCate=" + boardCate+ "&boardNo=" + boardNo +"&isbn=" + output.getIsbn(), "비추천되었습니다.");
		}
	}

	@RequestMapping(value = "/board/ccmt_add_ok.do", method = RequestMethod.POST)
	public ModelAndView ccmt_add_ok(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		Customer userInfo = (Customer) session.getAttribute("userInfo");

		if (userInfo == null) {
			userInfo = null;
		}

		int boardno = webHelper.getInt("boardNo");
		int boardCate = webHelper.getInt("boardCate");
		int cmtNo = webHelper.getInt("cmtNo");
		String Id = userInfo.getUserId();
		int No = userInfo.getUserno();
		String date = webHelper.getString("reg_date");

		if (date == null) {
			Calendar calendar = Calendar.getInstance();
			calendar.add(Calendar.DAY_OF_MONTH, 0);
			date = String.format("%04d%02d%02d%02d%02d%02d", calendar.get(Calendar.YEAR),
					calendar.get(Calendar.MONTH) + 1, calendar.get(Calendar.DAY_OF_MONTH),
					calendar.get(Calendar.HOUR_OF_DAY), calendar.get(Calendar.MINUTE), calendar.get(Calendar.SECOND));
		}
		String regdate = date.replace("-", "");

		/** 2) 사용자가 입력한 파라미터 수신 및 유효성 검사 */
		String cmt_content = webHelper.getString("cmt_content");

		// 학과 이름은 필수항목이므로 입력여부를 검사
		// 위치는 미필수(null 허용)이므로 입력여부를 검사하지 않는다

		if (cmt_content == null) {
			return webHelper.redirect(null, "내용을 입력하세요");
		}

		/** 3) 데이터 저장하기 */
		// 저장할 값들을 Beans에 담는다
		Comment input = new Comment();

		input.setUserNo(No);
		input.setUserId(Id);
		input.setCmt_content(cmt_content);
		input.setCmt_reg_date(regdate);
		input.setBoardNo(boardno);
		input.setCcmt_ref(cmtNo);
		input.setCcmt_exist(1);

		Board input2 = new Board();
		input2.setBoardNo(boardno);
		Board output = new Board();
		
		try{
			// 데이터 저장
			// --> 데이터 저장에 성공하면 파라미터로 전달하는 input객체에 pk값이 저장
			commentService.addComment(input);
			output = boardService.getBoardItem(input2);		
		}catch(Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		/** 5) 결과를 확인하기 위한 페이지 이동 */
		// 저장 결과를 확인하기 위해서 데이터 저장시 생성된 pk값을 상세 페이지로 전달
		return webHelper.redirect("board_view.do?boardCate="+ boardCate +"&boardNo="+ boardno +"&isbn=" + output.getIsbn(),"저장되었습니다.");
	}

	@RequestMapping(value = "/board/ccmt_edit_ok.do", method = RequestMethod.POST)
	public ModelAndView ccmt_edit_ok(Model model) {

		int boardno = webHelper.getInt("boardNo");
		String date = webHelper.getString("reg_date");
		int boardCate = webHelper.getInt("boardCate");
		int cmtNo = webHelper.getInt("cmtNo");
		String cmt_content = webHelper.getString("cmt_content");
		if (date == null) {
			Calendar calendar = Calendar.getInstance();
			calendar.add(Calendar.DAY_OF_MONTH, 0);
			date = String.format("%04d%02d%02d%02d%02d%02d", calendar.get(Calendar.YEAR),
					calendar.get(Calendar.MONTH) + 1, calendar.get(Calendar.DAY_OF_MONTH),
					calendar.get(Calendar.HOUR_OF_DAY), calendar.get(Calendar.MINUTE), calendar.get(Calendar.SECOND));
		}
		String regdate = date.replace("-", "");

		/** 2) 사용자가 입력한 파라미터 수신 및 유효성 검사 */

		// 학과 이름은 필수항목이므로 입력여부를 검사
		// 위치는 미필수(null 허용)이므로 입력여부를 검사하지 않는다
		if (cmt_content == null) {
			return webHelper.redirect(null, "내용을 입력하세요");

		}

		/** 3) 데이터 저장하기 */
		// 저장할 값들을 Beans에 담는다
		Comment input = new Comment();
		input.setCmt_reg_date(regdate);
		input.setCmtNo(cmtNo);
		input.setCmt_content(cmt_content);
		Board input2 = new Board();
		input2.setBoardNo(boardno);
		Board output = new Board();

		try {
			// 데이터 저장
			// --> 데이터 저장에 성공하면 파라미터로 전달하는 input객체에 pk값이 저장
			commentService.editComment(input);
			output = boardService.getBoardItem(input2);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());

		}

		/** 5) 결과를 확인하기 위한 페이지 이동 */
		// 저장 결과를 확인하기 위해서 데이터 저장시 생성된 pk값을 상세 페이지로 전달
		return webHelper.redirect("board_view.do?boardCate="+ boardCate +"&boardNo=" + boardno + "&isbn=" + output.getIsbn(), "수정되었습니다.");
	}

	@RequestMapping(value = "/board/FAQ.do", method = RequestMethod.GET)
	public String FAQ() {
		return "board/FAQ";
	}
}