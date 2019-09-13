package pocketLib.spring.pocketLibSpring.mybatis.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import pocketLib.spring.pocketLibSpring.mybatis.model.Book;
import pocketLib.spring.pocketLibSpring.mybatis.service.RecommendService;

@Service
@Slf4j
public class RecommendServiceImpl implements RecommendService{
	
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public List<Book> getPklibRecommendList() throws Exception {
		List<Book> result = null;
        try {
            result = sqlSession.selectList("RecommendMapper.selectList");
           
        } catch (NullPointerException e) {
           log.error(e.getLocalizedMessage());
            throw new Exception("whghl된 데이터가 없습니다.");
        } catch (Exception e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("데이터 whghl에 실패했습니다.");
        } 
        return result;
	}
	
}
