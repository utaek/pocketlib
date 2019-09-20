package pocketLib.spring.pocketLibSpring.mybatis.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import pocketLib.spring.pocketLibSpring.mybatis.model.Board;
import pocketLib.spring.pocketLibSpring.mybatis.service.BoardService;

/** 학과 데이터 관리 기능을 제공하기 위한 Service 계층에 대한 구현체 */
@Slf4j
@Service
public class BoardServiceImpl implements BoardService {

	/** MyBatis */
	@Autowired
	SqlSession sqlSession;

	/**
	 * 학과 데이터 상세 조회
	 * 
	 * @param Board 조회할 학과의 일련번호를 담고 있는 Beans
	 * @return 조회된 데이터가 저장된 Beans
	 * @throws Exception
	 */
	@Override
	public Board getBoardItem(Board input) throws Exception {
		Board result = null;

		try {
			result = sqlSession.selectOne("BoardMapper.selectItem", input);

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

	/**
	 * 학과 데이터 목록 조회
	 * 
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	@Override
	public List<Board> getBoardOptionList(Board input, String keywordOption) throws Exception {
		List<Board> result = null;

		try {
			if (keywordOption == null || keywordOption.equals("title_content")) {
				result = sqlSession.selectList("BoardMapper.selectOptionList1", input);
			} else if (keywordOption.equals("title")) {
				result = sqlSession.selectList("BoardMapper.selectOptionList2", input);
			} else {
				result = sqlSession.selectList("BoardMapper.selectOptionList3", input);
			}

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

	/**
	 * 학과 데이터가 저장되어 있는 갯수 조회
	 * 
	 * @return int
	 * @throws Exception
	 */
	@Override
	public int getBoardOptionCount(Board input, String keywordOption) throws Exception {
		int result = 0;

		try {
			if (keywordOption == null || keywordOption.equals("title_content")) {
				result = sqlSession.selectOne("BoardMapper.selectOptionCount1", input);
			} else if (keywordOption.equals("title")) {
				result = sqlSession.selectOne("BoardMapper.selectOptionCount2", input);
			} else {
				result = sqlSession.selectOne("BoardMapper.selectOptionCount3", input);
			}
		} catch (Exception e) {

			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		} 
		return result;
	}

	/**
	 * 학과 데이터 등록하기
	 * 
	 * @param Board 저장할 정보를 담고 있는 Beans
	 * @throws Exception
	 */
	@Override
	public int addBoard(Board input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.insert("BoardMapper.insertItem", input);

			if (result == 0) {
				throw new NullPointerException("result=0");
			}
		} catch (NullPointerException e) {

			log.error(e.getLocalizedMessage());
			throw new Exception("저장된 데이터가 없습니다.");
		} catch (Exception e) {

			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 저장에 실패했습니다.");
		}

		return result;
	}

	/**
	 * 학과 데이터 수정하기
	 * 
	 * @param Board 수정할 정보를 담고 있는 Beans
	 * @throws Exception
	 */
	@Override
	public int editBoard(Board input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.update("BoardMapper.updateItem", input);

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

	/**
	 * 학과 데이터 수정하기
	 * 
	 * @param Board 수정할 정보를 담고 있는 Beans
	 * @throws Exception
	 */
	@Override
	public int editViewCount(Board input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.update("BoardMapper.updateViewCount", input);

		} catch (NullPointerException e) {

			log.error(e.getLocalizedMessage());
			throw new Exception("수정된 데이터가 없습니다.");
		} catch (Exception e) {

			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 수정에 실패했습니다.");
		}
		return result;
	}

	/**
	 * 학과 데이터 삭제하기
	 * 
	 * @param Board 삭제할 학과의 일련번호를 담고 있는 Beans
	 * @throws Exception
	 */
	@Override
	public int deleteBoard(Board input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.delete("BoardMapper.deleteItem", input);

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
	public int editBoardLove(Board input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.update("BoardMapper.updateLove", input);

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
	public int editBoardHate(Board input) throws Exception {
		  int result = 0;

	        try {
	            result = sqlSession.update("BoardMapper.updateHate", input);

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
	public int addBoard2(Board input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.insert("BoardMapper.insertItemForBook", input);

			if (result == 0) {
				throw new NullPointerException("result=0");
			}
		} catch (NullPointerException e) {

			log.error(e.getLocalizedMessage());
			throw new Exception("저장된 데이터가 없습니다.");
		} catch (Exception e) {

			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 저장에 실패했습니다.");
		}

		return result;
	}}