package pocketLib.spring.pocketLibSpring.mybatis.service;

import java.util.List;

import pocketLib.spring.pocketLibSpring.mybatis.model.Searching;

public interface SearchingService {
	
	public int addQueryValue(Searching input) throws Exception;
	
	public int queryCount(Searching input) throws Exception;
	
	public List<Searching> CSVList(Searching input) throws Exception;
	

}
