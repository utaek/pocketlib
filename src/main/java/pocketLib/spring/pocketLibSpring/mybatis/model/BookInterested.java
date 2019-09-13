package pocketLib.spring.pocketLibSpring.mybatis.model;

import lombok.Data;

@Data
public class BookInterested {
	private int bINo;
	private int userno;
	private String isbn;
	private String reg_date;

	private static int offset;
	private static int listCount;

	public static int getOffset() {
		return offset;
	}

	public static void setOffset(int offset) {
		BookInterested.offset = offset;
	}

	public static int getListCount() {
		return listCount;
	}

	public static void setListCount(int listCount) {
		
		BookInterested.listCount = listCount;
	}

}

