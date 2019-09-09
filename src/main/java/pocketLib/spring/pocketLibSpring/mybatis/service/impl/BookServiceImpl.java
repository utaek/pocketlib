package pocketLib.spring.pocketLibSpring.mybatis.service.impl;

import java.util.List;


import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import pocketLib.spring.pocketLibSpring.mybatis.model.Book;
import pocketLib.spring.pocketLibSpring.mybatis.model.BookInterested;
import pocketLib.spring.pocketLibSpring.mybatis.model.BookRead;
import pocketLib.spring.pocketLibSpring.mybatis.service.BookService;

@Slf4j
@Service
public class BookServiceImpl implements BookService {
    /** MyBatis */
    // --> import org.apache.ibatis.session.SqlSession
    SqlSession sqlSession;
    /** 생성자를 통한 객체 생성 */
    public BookServiceImpl(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }
   
    @Override
    public Book getBookItem(Book input) throws Exception {
        Book result = null;
        try {
            result = sqlSession.selectOne("BookMapper.selectItem", input);
            if (result == null) {
                throw new NullPointerException("result=null");
            }
        } catch (NullPointerException e) {
            sqlSession.rollback();
            log.error(e.getLocalizedMessage());
            throw new Exception("조회된 데이터가 없습니다.");
        } catch (Exception e) {
            sqlSession.rollback();
            log.error(e.getLocalizedMessage());
            throw new Exception("데이터 조회에 실패했습니다.");
        } finally {
            sqlSession.commit();
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
            sqlSession.rollback();
            log.error(e.getLocalizedMessage());
            throw new Exception("조회된 데이터가 없습니다.");
        } catch (Exception e) {
            sqlSession.rollback();
            log.error(e.getLocalizedMessage());
            throw new Exception("데이터 조회에 실패했습니다.");
        } finally {
            sqlSession.commit();
        }
        return result;
    }

    @Override
    public int getBookCount(Book input) throws Exception {
        int result = 0;
        
        try {
            result = sqlSession.selectOne("BookMapper.selectCount", input);
        } catch (Exception e) {
            sqlSession.rollback();
            log.error(e.getLocalizedMessage());
            throw new Exception("데이터 조회에 실패했습니다.");
        } finally {
            sqlSession.commit();
        }
        
        return result;
    }
    
    
    
    
    @Override
    public int addBook(Book input) throws Exception {
        int result = 0;
        try {
            result = sqlSession.insert("BookMapper.insertItem", input);
           
        } catch (NullPointerException e) {
            sqlSession.rollback();
            log.error(e.getLocalizedMessage());
            throw new Exception("저장된 데이터가 없습니다.");
        } catch (Exception e) {
            sqlSession.rollback();
            log.error(e.getLocalizedMessage());
            throw new Exception("데이터 저장에 실패했습니다.");
        } finally {
            sqlSession.commit();
        }
        return result;
    }
    /**
     * 학과 데이터 수정하기
     * @param Book 수정할 정보를 담고 있는 Beans
     * @throws Exception
     */
    @Override
    public int editBook(Book input) throws Exception {
        int result = 0;
        try {
            result = sqlSession.update("BookMapper.updateItem", input);
            if (result == 0) {
                throw new NullPointerException("result=0");
            }
        } catch (NullPointerException e) {
            sqlSession.rollback();
            log.error(e.getLocalizedMessage());
            throw new Exception("수정된 데이터가 없습니다.");
        } catch (Exception e) {
            sqlSession.rollback();
            log.error(e.getLocalizedMessage());
            throw new Exception("데이터 수정에 실패했습니다.");
        } finally {
            sqlSession.commit();
        }
        return result;
    }
    /**
     * 학과 데이터 삭제하기
     * @param Book 삭제할 학과의 일련번호를 담고 있는 Beans
     * @throws Exception
     */
    @Override
    public int deleteBook(Book input) throws Exception {
        int result = 0;
        try {
            result = sqlSession.delete("BookMapper.deleteItem", input);
            if (result == 0) {
                throw new NullPointerException("result=0");
            }
        } catch (NullPointerException e) {
            sqlSession.rollback();
            log.error(e.getLocalizedMessage());
            throw new Exception("삭제된 데이터가 없습니다.");
        } catch (Exception e) {
            sqlSession.rollback();
            log.error(e.getLocalizedMessage());
            throw new Exception("데이터 삭제에 실패했습니다.");
        } finally {
            sqlSession.commit();
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
	            sqlSession.rollback();
	            log.error(e.getLocalizedMessage());
	            throw new Exception("조회된 데이터가 없습니다.");
	        } catch (Exception e) {
	            sqlSession.rollback();
	            log.error(e.getLocalizedMessage());
	            throw new Exception("데이터 조회에 실패했습니다.");
	        } finally {
	            sqlSession.commit();
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
	            sqlSession.rollback();
	            log.error(e.getLocalizedMessage());
	            throw new Exception("조회된 데이터가 없습니다.");
	        } catch (Exception e) {
	            sqlSession.rollback();
	            log.error(e.getLocalizedMessage());
	            throw new Exception("데이터 조회에 실패했습니다.");
	        } finally {
	            sqlSession.commit();
	        }
	        return result;
	}
}