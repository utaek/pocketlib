package pocketLib.spring.pocketLibSpring.mybatis.model;

import lombok.Data;


/**
 * 와아
 * @author Sooyeon
 *
 */
@Data
public class Book {

	private String isbn;
	private String title;
	private String author;
	private String description;
	
	private String pubDate;
	private int priceSales;
	private int priceStandard;
	private String cover;
	private int categoryId;
	private String categoryName;
	private String publisher;
		
	private static int offset;
	private static int listCount;

	public static int getOffset() {
		return offset;
	}

	public static void setOffset(int offset) {
		Book.offset = offset;
	}

	public static int getListCount() {
		return listCount;
	}

	public static void setListCount(int listCount) {
		
		Book.listCount = listCount;
	}

}

