package pocketLib.spring.pocketLibSpring.mybatis.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import pocketLib.spring.pocketLibSpring.mybatis.model.Book;
import pocketLib.spring.pocketLibSpring.mybatis.model.BookInterested;
import pocketLib.spring.pocketLibSpring.mybatis.model.BookRead;

import pocketLib.spring.pocketLibSpring.mybatis.model.Searching;
import pocketLib.spring.pocketLibSpring.mybatis.service.BookService;
@Service
@Slf4j
public class BookServiceImpl implements BookService {
    /** MyBatis */
    // --> import org.apache.ibatis.session.SqlSession
	@Autowired
	SqlSession sqlSession;

   
    @Override
    public Book getBookItem(Book input) throws Exception {
        Book result = null;
        try {
            result = sqlSession.selectOne("BookMapper.selectItem", input);
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
    public List<Book> getBookList(Book input) throws Exception {
        List<Book> result = null;
        try {
            result = sqlSession.selectList("BookMapper.selectList", input);
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
    public List<Book> getBookSearchingList(Searching input) throws Exception {
        List<Book> result = null;
        try {
            result = sqlSession.selectList("BookMapper.selectBookSearchingList", input);
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
    public int getBookCount(Book input) throws Exception {
        int result = 0;
        
        try {
            result = sqlSession.selectOne("BookMapper.selectCount", input);
        } catch (Exception e) {
           log.error(e.getLocalizedMessage());
            throw new Exception("데이터 조회에 실패했습니다.");
        } 
        
        return result;
    }
    
    
    
    
    @Override
    public int addBook(Book input) throws Exception {
        int result = 0;
        try {
            result = sqlSession.insert("BookMapper.insertItem", input);
           
        } catch (NullPointerException e) {
           log.error(e.getLocalizedMessage());
            throw new Exception("저장된 데이터가 없습니다.");
        } catch (Exception e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("데이터 저장에 실패했습니다.");
        } 
        return result;
    }
    
    
    @Override
    public int editBook(Book input) throws Exception {
        int result = 0;
        try {
            result = sqlSession.update("BookMapper.updateItem", input);
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
    public int deleteBook(Book input) throws Exception {
        int result = 0;
        try {
            result = sqlSession.delete("BookMapper.deleteItem", input);
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
	public List<Book> getReadList(BookRead input) throws Exception {
		 List<Book> result = null;
	        try {
	            result = sqlSession.selectList("BookMapper.ReadList", input);
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
	public List<Book> getInterestedList(BookInterested input) throws Exception {
		 List<Book> result = null;
	        try {
	            result = sqlSession.selectList("BookMapper.InterestedList", input);
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
	public int addBestseller(Book input) throws Exception {
		int result = 0;
        try {
            result = sqlSession.insert("RegisterBestsellerMapper.insertBestseller", input);
           
        } catch (NullPointerException e) {
           log.error(e.getLocalizedMessage());
            throw new Exception("저장된 데이터가 없습니다.");
        } catch (Exception e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("데이터 저장에 실패했습니다.");
        } 
        return result;
	}

	@Override
	public List<Book> getBestsellerList(Book input) throws Exception {
		List<Book> result = null;
        try {
            result = sqlSession.selectList("RegisterBestsellerMapper.selectBestsellerList", input);
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
}