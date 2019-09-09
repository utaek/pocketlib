package pocketLib.spring.pocketLibSpring.mybatis.model;

import lombok.Data;

/**
 *  안녕하세요~!!!
 */

/** 테이블 구조에 맞춘 Java Beans 생성 */
@Data
public class Board {
    private int boardNo;
    private int userNo;
    private String userId;
    private String title;
    private String content;
    private String reg_date;
    private int boardCate;
    private int hits;
    private int love;
    private int hate;
    
    private String sortCate;

    // 페이지 구현이 필요한 경우 아래 속성도 추가한다.
    private static int offset;
    private static int listCount;
    
    public static int getOffset() {
        return offset;
    }
    
    public static void setOffset(int offset) {
        Board.offset = offset;
    }
    
    public static int getListCount() {
        return listCount;
    }
    
    public static void setListCount(int listCount) {
        Board.listCount = listCount;
    }
}