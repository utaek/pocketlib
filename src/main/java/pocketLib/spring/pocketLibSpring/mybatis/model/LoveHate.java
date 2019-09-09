package pocketLib.spring.pocketLibSpring.mybatis.model;

import lombok.Data;

/** 테이블 구조에 맞춘 Java Beans 생성 */
@Data
public class LoveHate {
	private int loveNo;
	private int boardNo;
	private int cmtNo;
	private int userNo;

	private int type;
	private int loveType;

}