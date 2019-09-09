package pocketLib.spring.pocketLibSpring.mybatis.model;

import lombok.Data;

/** 테이블 구조에 맞춘 Java Beans 생성 */
@Data
public class Comment {
	private int cmtNo;
    private int boardNo;
    private int userNo;
    private String userId;
    private String cmt_content;
    private String cmt_reg_date;
    private String cmt_ip;
    private int cmt_love;
    private int cmt_hate;
    private int ccmt_exist;
    private int ccmt_ref;
    private String sortCate;

    // 페이지 구현이 필요한 경우 아래 속성도 추가한다.
    private static int offset;
    private static int listCount;
    
    public static int getOffset() {
        return offset;
    }
    
    public static void setOffset(int offset) {
        Comment.offset = offset;
    }
    
    public static int getListCount() {
        return listCount;
    }
    
    public static void setListCount(int listCount) {
        Comment.listCount = listCount;
    }
}