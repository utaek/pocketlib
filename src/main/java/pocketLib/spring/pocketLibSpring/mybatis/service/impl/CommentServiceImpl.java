package pocketLib.spring.pocketLibSpring.mybatis.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import lombok.extern.slf4j.Slf4j;
import pocketLib.spring.pocketLibSpring.mybatis.model.Comment;
import pocketLib.spring.pocketLibSpring.mybatis.service.CommentService;

/** 학과 데이터 관리 기능을 제공하기 위한 Service 계층에 대한 구현체 */
@Slf4j
public class CommentServiceImpl implements CommentService {

    /** MyBatis */
    // --> import org.apache.ibatis.session.SqlSession
	@Autowired
    SqlSession sqlSession;

    /** 생성자를 통한 객체 생성 */
    public CommentServiceImpl(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }

    /**
     * 학과 데이터 상세 조회
     * @param Comment 조회할 학과의 일련번호를 담고 있는 Beans
     * @return 조회된 데이터가 저장된 Beans
     * @throws Exception
     */
    @Override
    public Comment getCommentItem(Comment input) throws Exception {
        Comment result = null;

        try {
            result = sqlSession.selectOne("CommentMapper.selectItem", input);

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

    /**
     * 학과 데이터 목록 조회
     * @return 조회 결과에 대한 컬렉션
     * @throws Exception
     */
    @Override
    public List<Comment> getCommentList(Comment input) throws Exception {
        List<Comment> result = null;

        try {
        	
        		result = sqlSession.selectList("CommentMapper.selectList", input);
        	
        	
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

    /**
     * 학과 데이터가 저장되어 있는 갯수 조회
     * @return int
     * @throws Exception
     */
    @Override
    public int getCommentCount(Comment input) throws Exception {
        int result = 0;
        
        try {
        	
        		result = sqlSession.selectOne("CommentMapper.selectCount", input);
        	
        } catch (Exception e) {
            sqlSession.rollback();
            log.error(e.getLocalizedMessage());
            throw new Exception("데이터 조회에 실패했습니다.");
        } finally {
            sqlSession.commit();
        }
        
        return result;
    }
  

    /**
     * 학과 데이터 등록하기
     * @param Comment 저장할 정보를 담고 있는 Beans
     * @throws Exception
     */
    @Override
    public int addComment(Comment input) throws Exception {
        int result = 0;

        try {
            result = sqlSession.insert("CommentMapper.insertItem", input);

            if (result == 0) {
                throw new NullPointerException("result=0");
            }
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
     * @param Comment 수정할 정보를 담고 있는 Beans
     * @throws Exception
     */
    @Override
    public int editComment(Comment input) throws Exception {
        int result = 0;

        try {
            result = sqlSession.update("CommentMapper.updateItem", input);

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
     * 학과 데이터 수정하기
     * @param Comment 수정할 정보를 담고 있는 Beans
     * @throws Exception
     */
    @Override
    public int editLoveCount(Comment input) throws Exception {
        int result = 0;

        try {
            result = sqlSession.update("CommentMapper.updateloveCount", input);

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
     * @param Comment 삭제할 학과의 일련번호를 담고 있는 Beans
     * @throws Exception
     */
    @Override
    public int deleteComment(Comment input) throws Exception {
        int result = 0;

        try {
            result = sqlSession.delete("CommentMapper.deleteItem", input);

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
    public int deleteComment2(Comment input) throws Exception {
        int result = 0;

        try {
            result = sqlSession.delete("CommentMapper.deleteItem2", input);

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
	public int editHateCount(Comment input) throws Exception {
		 int result = 0;

	        try {
	            result = sqlSession.update("CommentMapper.updatehateCount", input);

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
	public List<Comment> getCcommentList(Comment input) throws Exception {
		   List<Comment> result = null;

	        try {
	        	
	        		result = sqlSession.selectList("CommentMapper.ccmtselectList", input);
	        	
	        	
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
	public int editCommentexist(Comment input) throws Exception {
		 int result = 0;

	        try {
	            result = sqlSession.update("CommentMapper.updateItem2", input);

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
	public int editRefComment(Comment input) throws Exception {
		int result = 0;

        try {
            result = sqlSession.update("CommentMapper.updateItem3", input);

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
}