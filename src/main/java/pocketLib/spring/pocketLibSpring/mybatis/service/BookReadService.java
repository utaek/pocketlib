package pocketLib.spring.pocketLibSpring.mybatis.service;

import java.util.List;

import org.springframework.stereotype.Service;

import pocketLib.spring.pocketLibSpring.mybatis.model.BookRead;


public interface BookReadService {

	public BookRead getBookReadItem(BookRead input) throws Exception;

	public List<BookRead> getBookReadList(BookRead input) throws Exception;

	public int getBookReadCount(BookRead input) throws Exception;

	public int addBookRead(BookRead input) throws Exception;

	public int editBookRead(BookRead input) throws Exception;

	public int deleteBookRead(BookRead input) throws Exception;

}
