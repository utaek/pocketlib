
package pocketLib.spring.pocketLibSpring.mybatis.model;


import lombok.Data;

@Data
public class BookRank {
	private int RankNo;
	private int userno;
	private String isbn;
	private int value;
	private static int offset;
	private static int listCount;

	public static int getOffset() {
		return offset;
	}

	public static void setOffset(int offset) {
		BookRank.offset = offset;
	}

	public static int getListCount() {
		return listCount;
	}

	public static void setListCount(int listCount) {
		
		BookRank.listCount = listCount;
	}

}

