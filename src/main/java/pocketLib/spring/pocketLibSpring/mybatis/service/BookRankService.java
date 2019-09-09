package pocketLib.spring.pocketLibSpring.mybatis.service;

import java.util.List;

import pocketLib.spring.pocketLibSpring.mybatis.model.BookRank;


public interface BookRankService {


	public BookRank getBookRankItem(BookRank input) throws Exception;

	public List<BookRank> getBookRankListbyIsbn(BookRank input) throws Exception;

	
	public List<BookRank> getBookRankListbyUserId(BookRank input) throws Exception;

	public List<BookRank> getBookRankList(BookRank input) throws Exception;

	public int getBookRankCount(BookRank input) throws Exception;

	public int addBookRank(BookRank input) throws Exception;

	public int editBookRank(BookRank input) throws Exception;

	public int deleteBookRank(BookRank input) throws Exception;
}
