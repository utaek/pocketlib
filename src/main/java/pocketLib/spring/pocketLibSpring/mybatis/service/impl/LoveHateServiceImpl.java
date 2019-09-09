package pocketLib.spring.pocketLibSpring.mybatis.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import lombok.extern.slf4j.Slf4j;
import pocketLib.spring.pocketLibSpring.mybatis.model.LoveHate;
import pocketLib.spring.pocketLibSpring.mybatis.service.LoveHateService;

/** 학과 데이터 관리 기능을 제공하기 위한 Service 계층에 대한 구현체 */
@Slf4j
public class LoveHateServiceImpl implements LoveHateService {

    /** MyBatis */
    // --> import org.apache.ibatis.session.SqlSession
	@Autowired
    SqlSession sqlSession;

    /** 생성자를 통한 객체 생성 */
    public LoveHateServiceImpl(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }

    /**
     * 학과 데이터 상세 조회
     * @param LoveHate 조회할 학과의 일련번호를 담고 있는 Beans
     * @return 조회된 데이터가 저장된 Beans
     * @throws Exception
     */
    @Override
    public LoveHate getLoveItem(LoveHate input) throws Exception {
        LoveHate result = null;

        try {
            result = sqlSession.selectOne("LoveHateMapper.selectItem", input);

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
    public List<LoveHate> getLoveList(LoveHate input) throws Exception {
        List<LoveHate> result = null;

        try {
        		result = sqlSession.selectList("LoveHateMapper.selectList", input);
        	
        
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
    public int getLoveHateOptionCount(LoveHate input) throws Exception {
        int result = 0;
        
        try {
        	
        		result = sqlSession.selectOne("LoveHateMapper.selectCountbyboard", input);
        	
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
     * @param LoveHate 저장할 정보를 담고 있는 Beans
     * @throws Exception
     */
    @Override
    public int addLoveHate(LoveHate input) throws Exception {
        int result = 0;

        try {
            result = sqlSession.insert("LoveHateMapper.insertItem", input);

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

	@Override
	public int getLoveHateCmtCount(LoveHate input) throws Exception {
		 int result = 0;
	        
	        try {
	        	
	        		result = sqlSession.selectOne("LoveHateMapper.selectCountbycmt", input);
	        	
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