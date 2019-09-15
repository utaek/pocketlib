package pocketLib.spring.pocketLibSpring.mybatis.service;

import java.util.List;

import pocketLib.spring.pocketLibSpring.mybatis.model.Book;
import pocketLib.spring.pocketLibSpring.mybatis.model.BookInterested;
import pocketLib.spring.pocketLibSpring.mybatis.model.BookRead;

public interface RecommendService {
	
	public List<Book> getPklibRecommendList() throws Exception;

	public List<Book> getAllCountby_reg_date(BookRead input) throws Exception;
	
	public List<Book> getselectRandombyCate(Book input) throws Exception;
	
	public Book getTopOne(BookRead input) throws Exception;
	
	public List<Book> getselectInterestedCate(Book input) throws Exception;
	
	public Book getInterestedOne(BookInterested input) throws Exception;
	
	public List<Book> getselectValueList(Book input) throws Exception;
}
