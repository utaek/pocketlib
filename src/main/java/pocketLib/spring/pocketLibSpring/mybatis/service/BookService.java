package pocketLib.spring.pocketLibSpring.mybatis.service;

import java.util.List;

import pocketLib.spring.pocketLibSpring.mybatis.model.Book;
import pocketLib.spring.pocketLibSpring.mybatis.model.BookInterested;
import pocketLib.spring.pocketLibSpring.mybatis.model.BookRead;
import pocketLib.spring.pocketLibSpring.mybatis.model.BookSearching;
import pocketLib.spring.pocketLibSpring.mybatis.model.Searching;


public interface BookService {

	public Book getBookItem(Book input) throws Exception;

	public List<Book> getBookList(Book input) throws Exception;

	public List<Book> getReadList(BookRead input) throws Exception;
	
	public List<Book> getBookSearchingList(Searching input) throws Exception;
	

	public List<Book> getInterestedList(BookInterested input) throws Exception;
	
	public List<Book> getBookReadCate(BookRead input) throws Exception;
	

	
	public int getBookCount(Book input) throws Exception;

	public int addBook(Book input) throws Exception;
	
	public int editBook(Book input) throws Exception;

	public int deleteBook(Book input) throws Exception;
	
	public int addBestseller(Book input) throws Exception;
	
	public List<Book> getBestsellerList(Book input) throws Exception;

	
	
}
