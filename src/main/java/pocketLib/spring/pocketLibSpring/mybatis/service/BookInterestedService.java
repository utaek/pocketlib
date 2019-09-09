package pocketLib.spring.pocketLibSpring.mybatis.service;

import java.util.List;

import pocketLib.spring.pocketLibSpring.mybatis.model.BookInterested;

public interface BookInterestedService {
	public BookInterested getBookInterestedItem(BookInterested input) throws Exception;

	public List<BookInterested> getBookInterestedList(BookInterested input) throws Exception;

	public int getBookInterestedCount(BookInterested input) throws Exception;

	public int addBookInterested(BookInterested input) throws Exception;

	public int editBookInterested(BookInterested input) throws Exception;

	public int deleteBookInterested(BookInterested input) throws Exception;

}
