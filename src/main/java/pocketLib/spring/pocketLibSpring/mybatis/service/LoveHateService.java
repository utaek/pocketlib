package pocketLib.spring.pocketLibSpring.mybatis.service;

import java.util.List;

import pocketLib.spring.pocketLibSpring.mybatis.model.LoveHate;

/** 학과 데이터 관리 기능을 제공하기 위한 Service 계층. */
public interface LoveHateService {
    
    /**
     * 학과 데이터 상세 조회
     * @param LoveHate 조회할 학과의 일련번호를 담고 있는 Beans
     * @return 조회된 데이터가 저장된 Beans
     * @throws Exception
     */
    public LoveHate getLoveItem(LoveHate input) throws Exception;
    
    /**
     * 학과 데이터 목록 조회
     * @return 조회 결과에 대한 컬렉션
     * @throws Exception
     */
    public List<LoveHate> getLoveList(LoveHate input) throws Exception;
    

    /**
     * 학과 데이터가 저장되어 있는 갯수 조회
     * @return int
     * @throws Exception
     */
    public int getLoveHateOptionCount(LoveHate input) throws Exception;
    
    
    public int getLoveHateCmtCount(LoveHate input) throws Exception;
   
    /**
     * 학과 데이터 등록하기
     * @param LoveHate 저장할 정보를 담고 있는 Beans
     * @throws Exception
     */
    public int addLoveHate(LoveHate input) throws Exception;
    
    /**
     * 학과 데이터 수정하기
     * @param LoveHate 수정할 정보를 담고 있는 Beans
     * @throws Exception
     */
  
    
}