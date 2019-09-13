package pocketLib.spring.pocketLibSpring.mybatis.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import pocketLib.spring.pocketLibSpring.mybatis.model.BookInterested;
import pocketLib.spring.pocketLibSpring.mybatis.service.BookInterestedService;
@Service
@Slf4j
public class BookInterestedServiceImpl implements BookInterestedService {

	@Autowired
	SqlSession sqlSession;
	@Override
	public int addBookInterested(BookInterested input) throws Exception {
		int result=0;
		try {
			
			result=sqlSession.insert("BookInterestedMapper.insertItem", input);
	
			if(result==0) {
				throw new NullPointerException("reulst=0");
			}
		}catch(NullPointerException e) {
			sqlSession.rollback();
			log.error(e.getLocalizedMessage());
			 throw new Exception("저장된 데이터가 없습니다.");
		}catch(Exception e) {
	            log.error(e.getLocalizedMessage());
	            throw new Exception("데이터 저장에 실패했습니다.");
		} 
		return result;
	}
	@Override
	public BookInterested getBookInterestedItem(BookInterested input) throws Exception {
		  BookInterested result = null;
	        try {
	            result = sqlSession.selectOne("BookInterestedMapper.selectItem", input);
	            if (result == null) {
	                throw new NullPointerException("result=null");
	            }
	        } catch (NullPointerException e) {
	            log.error(e.getLocalizedMessage());
	            throw new Exception("조회된 데이터가 없습니다.");
	        } catch (Exception e) {
	            log.error(e.getLocalizedMessage());
	            throw new Exception("데이터 조회에 실패했습니다.");
	        } 
	        return result;
	}
	@Override
	public List<BookInterested> getBookInterestedList(BookInterested input) throws Exception {
		 List<BookInterested> result = null;
	        try {
	            result = sqlSession.selectList("BookInterestedMapper.selectList", input);
	            if (result == null) {
	                throw new NullPointerException("result=null");
	            }
	        } catch (NullPointerException e) {
	            log.error(e.getLocalizedMessage());
	            throw new Exception("조회된 데이터가 없습니다.");
	        } catch (Exception e) {
	            log.error(e.getLocalizedMessage());
	            throw new Exception("데이터 조회에 실패했습니다.");
	        } 
	        return result;
	}
	@Override
	public int getBookInterestedCount(BookInterested input) throws Exception {
		 int result = 0;
	        try {
	            result = sqlSession.selectOne("BookInterestedMapper.selectCount", input);
	        } catch (Exception e) {
	            log.error(e.getLocalizedMessage());
	            throw new Exception("데이터 조회에 실패했습니다.");
	        } 
	        return result;
	}

	@Override
	public int editBookInterested(BookInterested input) throws Exception {
		 int result = 0;
	        try {
	            result = sqlSession.update("BookInterestedMapper.updateItem", input);
	            if (result == 0) {
	                throw new NullPointerException("result=0");
	            }
	        } catch (NullPointerException e) {
	            log.error(e.getLocalizedMessage());
	            throw new Exception("수정된 데이터가 없습니다.");
	        } catch (Exception e) {
	            log.error(e.getLocalizedMessage());
	            throw new Exception("데이터 수정에 실패했습니다.");
	        } 
	        return result;
	}


	@Override
	public int deleteBookInterested(BookInterested input) throws Exception {
		 int result = 0;
	        try {
	            result = sqlSession.delete("BookInterestedMapper.deleteItem", input);
	            if (result == 0) {
	                throw new NullPointerException("result=0");
	            }
	        } catch (NullPointerException e) {
	            log.error(e.getLocalizedMessage());
	            throw new Exception("삭제된 데이터가 없습니다.");
	        } catch (Exception e) {
	            log.error(e.getLocalizedMessage());
	            throw new Exception("데이터 삭제에 실패했습니다.");
	        } 
	        return result;
	}

	
}
