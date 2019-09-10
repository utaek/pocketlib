package pocketLib.spring.pocketLibSpring.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import lombok.extern.slf4j.Slf4j;
import pocketLib.spring.pocketLibSpring.helper.RetrofitHelper;
import pocketLib.spring.pocketLibSpring.mybatis.model.Book;
import pocketLib.spring.pocketLibSpring.mybatis.service.BookService;
import pocketLib.spring.pocketLibSpring.retrofit.Service.AladinService;
import pocketLib.spring.pocketLibSpring.retrofit.model.AladinBookList;
import retrofit2.Call;
import retrofit2.Retrofit;

@Controller
@Slf4j
public class BookScheduler {
	
	@Autowired
	BookService bookService;
	@Autowired
	RetrofitHelper retrofitHelper;
	
	public void getBook() { 		
		
		AladinBookList booklist = null;

		// 검색 결과 저장할 beans 객체 선언
		String ttbkey = "ttbfreda70890100001";
		String queryType = "Bestseller";

		// 20개 출력할거긴 한데 겹치는 거 빼려면 20개보다는 더 많아야 해서
		
		int maxResults = 50;

		String cover = "Small";
		int start = 1;
		// int maxstart = 2; //1위부터 100위까지 가져와야 함. 한번에 50위씩 가져올 수 있음
		// 200위씩 가져오는 건 너무 많은 것 같아서 일단 100위까지 가져오는 걸로 하고...
		String searchTarget = "Book";
		String output = "js";
		int version = 20131101;
		
		
		
		Retrofit retrofit = retrofitHelper.getRetrofit(AladinService.BASE_URL);
		

		AladinService aladinService = retrofit.create(AladinService.class);

		Call<AladinBookList> call = null;

		int categoryId = 0;
		// 느림 이렇게 밖에 방법이 없는가
		List<Integer> cateList = new ArrayList<Integer>();
		cateList.add(1); // 소설 시 희곡
		cateList.add(74); // 역사
		cateList.add(170); // 경제경영
		cateList.add(336); // 자기계발
		cateList.add(798); // 사회과학
		cateList.add(987); // 과학
		cateList.add(55889); // 국내도서 에세이
		
		

		// for (int quarter = start; quarter <= maxstart; quarter++) {

		for (int k = 0; k < cateList.size(); k++) {
			int cnt = 0; // 카테고리 별 20개씩 세려고
			categoryId = (Integer) cateList.get(k);
			Book book = new Book();
			call = aladinService.getBestseller(ttbkey, queryType, maxResults, cover, start, searchTarget, categoryId,
					output, version);
			
			
			try {
				booklist = call.execute().body();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			// 겹치는 거 빼려고 printList에 isbn 저장할거임
			List<String> printList = new ArrayList<String>();

			if (booklist != null) {
				for (int i = 0; i < booklist.item.size(); i++) {
					AladinBookList.Item item = booklist.item.get(i);
					
					// List에 isbn 넣고 contains 로 값 있으면 넘어가고 없으면 출력...
					printList.add(item.isbn);

					book.setIsbn(item.isbn);
					book.setTitle(item.title);
					book.setAuthor(item.author);
					book.setDescription(item.description);
					book.setPriceSales(item.priceSales);
					book.setPriceStandard(item.priceStandard);
					book.setCategoryId(item.categoryId);
					book.setCategoryName(item.categoryName);
					book.setPubDate(item.pubDate);
					book.setCover(item.cover);
					
					try {
						bookService.addBook(book);
					} catch (Exception e) {
						e.getLocalizedMessage();
					}
					if (item.categoryId != 5536 || printList.contains(item.isbn)) {
						cnt++;
					}
					// cnt 총 20되는 거 체크 해야 한다
					if (cnt >= 14) {
						break;
					}
				}
			}
		}
	}
}	
