package pocketLib.spring.pocketLibSpring.mybatis.service;

import java.util.List;

import pocketLib.spring.pocketLibSpring.mybatis.model.Book;

public interface RecommendService {
	
	public List<Book> getPklibRecommendList() throws Exception;
    
}
