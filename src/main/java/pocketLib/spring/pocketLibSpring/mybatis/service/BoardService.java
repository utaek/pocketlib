package pocketLib.spring.pocketLibSpring.mybatis.service;

import java.util.List;

import pocketLib.spring.pocketLibSpring.mybatis.model.Board;



/** 학과 데이터 관리 기능을 제공하기 위한 Service 계층. */
public interface BoardService {
    
    /**
     * 학과 데이터 상세 조회
     * @param Board 조회할 학과의 일련번호를 담고 있는 Beans
     * @return 조회된 데이터가 저장된 Beans
     * @throws Exception
     */
    public Board getBoardItem(Board input) throws Exception;
    
    /**
     * 학과 데이터 목록 조회
     * @return 조회 결과에 대한 컬렉션
     * @throws Exception
     */
    public List<Board> getBoardOptionList(Board input, String keywordOption) throws Exception;
    
    public List<Board> getNoticeList() throws Exception;
    /**
     * 학과 데이터가 저장되어 있는 갯수 조회
     * @return int
     * @throws Exception
     */
    public int getBoardOptionCount(Board input, String keywordOption) throws Exception;
    
   
    /**
     * 학과 데이터 등록하기
     * @param Board 저장할 정보를 담고 있는 Beans
     * @throws Exception
     */
    public int addBoard(Board input) throws Exception;
    
    public int addBoard2(Board input) throws Exception;
    
    /**
     * 학과 데이터 수정하기
     * @param Board 수정할 정보를 담고 있는 Beans
     * @throws Exception
     */
    public int editBoard(Board input) throws Exception;
    
    public int editBoardLove(Board input) throws Exception;
    
    public int editBoardHate(Board input) throws Exception;
    
    /**
     * 학과 데이터 수정하기
     * @param Board 수정할 정보를 담고 있는 Beans
     * @throws Exception
     */
    public int editViewCount(Board input) throws Exception;
    /**
     * 학과 데이터 삭제하기
     * @param Board 삭제할 학과의 일련번호를 담고 있는 Beans
     * @throws Exception
     */
    public int deleteBoard(Board input) throws Exception;
    
}