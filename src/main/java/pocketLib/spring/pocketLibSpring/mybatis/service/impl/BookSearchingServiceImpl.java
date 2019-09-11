package pocketLib.spring.pocketLibSpring.mybatis.service.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import pocketLib.spring.pocketLibSpring.mybatis.model.Board;
import pocketLib.spring.pocketLibSpring.mybatis.model.BookSearching;
import pocketLib.spring.pocketLibSpring.mybatis.model.Searching;
import pocketLib.spring.pocketLibSpring.mybatis.service.BookSearchingService;
import pocketLib.spring.pocketLibSpring.mybatis.service.SearchingService;


@Service
@Slf4j
public class BookSearchingServiceImpl implements BookSearchingService{
	
	@Autowired
	SqlSession sqlSession;
	
	 @Override
	    public int addIntoBookSearching(BookSearching input) throws Exception {
	        int result = 0;
	        try {
	            result = sqlSession.insert("BookSearchingMapper.insertItem", input);
	           
	        } catch (NullPointerException e) {
	           log.error(e.getLocalizedMessage());
	            throw new Exception("저장된 데이터가 없습니다.");
	        } catch (Exception e) {
	            log.error(e.getLocalizedMessage());
	            throw new Exception("데이터 저장에 실패했습니다.");
	        } 
	        return result;
	    }
	

	
}
