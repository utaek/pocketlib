package pocketLib.spring.pocketLibSpring.mybatis.model;

import lombok.Data;

@Data
public class BookRead {
	private int bRNo;
	private int userno;
	private String isbn;

	private static int offset;
	private static int listCount;

	public static int getOffset() {
		return offset;
	}

	public static void setOffset(int offset) {
		BookRead.offset = offset;
	}

	public static int getListCount() {
		return listCount;
	}

	public static void setListCount(int listCount) {
		
		BookRead.listCount = listCount;
	}

}

