package pocketLib.spring.pocketLibSpring.mybatis.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import pocketLib.spring.pocketLibSpring.mybatis.model.BookRead;
import pocketLib.spring.pocketLibSpring.mybatis.service.BookReadService;
@Service
@Slf4j
public class BookReadServiceImpl implements BookReadService {

	@Autowired
	SqlSession sqlSession;


	
	@Override
	public int addBookRead(BookRead input) throws Exception {
		int result=0;
		try {
			
			result=sqlSession.insert("BookReadMapper.insertItem", input);
	
			if(result==0) {
				throw new NullPointerException("reulst=0");
			}
		}catch(NullPointerException e) {
			log.error(e.getLocalizedMessage());
			 throw new Exception("저장된 데이터가 없습니다.");
		}catch(Exception e) {
			    log.error(e.getLocalizedMessage());
	            throw new Exception("데이터 저장에 실패했습니다.");
		} 

		
		return result;
	}


	@Override
	public BookRead getBookReadItem(BookRead input) throws Exception {
		  BookRead result = null;
	        try {
	            result = sqlSession.selectOne("BookReadMapper.selectItem", input);
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
	public List<BookRead> getBookReadList(BookRead input) throws Exception {
		 List<BookRead> result = null;
	        try {
	            result = sqlSession.selectList("BookReadMapper.selectList", input);
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
	public int getBookReadCount(BookRead input) throws Exception {
		 int result = 0;
	        
	        try {
	            result = sqlSession.selectOne("BookReadMapper.selectCount", input);
	        } catch (Exception e) {
	           log.error(e.getLocalizedMessage());
	            throw new Exception("데이터 조회에 실패했습니다.");
	        } 
	        
	        return result;
	}


	

	@Override
	public int editBookRead(BookRead input) throws Exception {
		 int result = 0;
	        try {
	            result = sqlSession.update("BookReadMapper.updateItem", input);
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
	public int deleteBookRead(BookRead input) throws Exception {
		 int result = 0;
	        try {
	            result = sqlSession.delete("BookReadMapper.deleteItem", input);
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


	@Override
	public List<BookRead> getCountby_reg_date(BookRead input) throws Exception {
		List<BookRead> result = null;
        
        try {
            result = sqlSession.selectList("BookReadMapper.selectCountbyReg_date", input);
        } catch (Exception e) {
           log.error(e.getLocalizedMessage());
            throw new Exception("데이터 조회에 실패했습니다.");
        } 
        return result;
	}


	@Override
	public int getBookReadAllCount(BookRead input) throws Exception {
		int result = 0;
        
        try {
            result = sqlSession.selectOne("BookReadMapper.AllCount", input);
        } catch (Exception e) {
           log.error(e.getLocalizedMessage());
            throw new Exception("데이터 조회에 실패했습니다.");
        } 
        
        return result;
	}

	
}

