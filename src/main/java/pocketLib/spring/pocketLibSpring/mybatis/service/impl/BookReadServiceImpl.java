package pocketLib.spring.pocketLibSpring.mybatis.service.impl;

import java.util.List;


import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import pocketLib.spring.pocketLibSpring.mybatis.model.BookRead;
import pocketLib.spring.pocketLibSpring.mybatis.service.BookReadService;


@Slf4j
@Service
public class BookReadServiceImpl implements BookReadService {

	SqlSession sqlSession;

	public BookReadServiceImpl(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	
	@Override
	public int addBookRead(BookRead input) throws Exception {
		int result=0;
		try {
			
			result=sqlSession.insert("BookReadMapper.insertItem", input);
	
			if(result==0) {
				throw new NullPointerException("reulst=0");
			}
		}catch(NullPointerException e) {
			sqlSession.rollback();
			log.error(e.getLocalizedMessage());
			 throw new Exception("저장된 데이터가 없습니다.");
		}catch(Exception e) {
			   sqlSession.rollback();
	            log.error(e.getLocalizedMessage());
	            throw new Exception("데이터 저장에 실패했습니다.");
		} finally {
            sqlSession.commit();
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
	public List<BookRead> getBookReadList(BookRead input) throws Exception {
		 List<BookRead> result = null;
	        try {
	            result = sqlSession.selectList("BookReadMapper.selectList", input);
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
	public int getBookReadCount(BookRead input) throws Exception {
		 int result = 0;
	        
	        try {
	            result = sqlSession.selectOne("BookReadMapper.selectCount", input);
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
	public int editBookRead(BookRead input) throws Exception {
		 int result = 0;
	        try {
	            result = sqlSession.update("BookReadMapper.updateItem", input);
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


	@Override
	public int deleteBookRead(BookRead input) throws Exception {
		 int result = 0;
	        try {
	            result = sqlSession.delete("BookReadMapper.deleteItem", input);
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

	
}

