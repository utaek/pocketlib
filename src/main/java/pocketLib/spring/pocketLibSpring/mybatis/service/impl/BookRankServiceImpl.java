package pocketLib.spring.pocketLibSpring.mybatis.service.impl;

import java.util.List;


import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import pocketLib.spring.pocketLibSpring.mybatis.model.BookRank;
import pocketLib.spring.pocketLibSpring.mybatis.service.BookRankService;


@Slf4j
@Service
public class BookRankServiceImpl implements BookRankService {

	SqlSession sqlSession;

	public BookRankServiceImpl(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	
	@Override
	public int addBookRank(BookRank input) throws Exception {
		int result=0;
		try {
			
			result=sqlSession.insert("BookRankMapper.insertItem", input);
	
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
	public BookRank getBookRankItem(BookRank input) throws Exception {
		  BookRank result = null;
	        try {
	            result = sqlSession.selectOne("BookRankMapper.selectItem", input);
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
	public List<BookRank> getBookRankList(BookRank input) throws Exception {
		 List<BookRank> result = null;
	        try {
	            result = sqlSession.selectList("BookRankMapper.selectList", input);
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
	public int getBookRankCount(BookRank input) throws Exception {
		 int result = 0;
	        
	        try {
	            result = sqlSession.selectOne("BookRankMapper.selectCount", input);
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
	public int editBookRank(BookRank input) throws Exception {
		 int result = 0;
	        try {
	            result = sqlSession.update("BookRankMapper.updateItem", input);
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
	public int deleteBookRank(BookRank input) throws Exception {
		 int result = 0;
	        try {
	            result = sqlSession.delete("BookRankMapper.deleteItem", input);
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

