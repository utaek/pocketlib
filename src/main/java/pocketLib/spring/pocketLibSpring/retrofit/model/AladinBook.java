<<<<<<< HEAD
package pocketLib.spring.pocketLibSpring.retrofit.model;

import java.util.List;

import com.google.gson.annotations.SerializedName;

import lombok.Data;

@Data
public class AladinBook {

	/*
	 * @SerializedName("title") public String title;
	 * 
	 * @SerializedName("searchCategoryName") public String searchCategoryName;
	 */

	@SerializedName("item")
	public List<Item> item;

	@Data
	public class Item {
		@SerializedName("link")
		public String link;
		@SerializedName("cover")
		public String cover;
		@SerializedName("title")
		public String title;
		@SerializedName("author")
		public String author;
		@SerializedName("pubDate")
		public String pubDate;
		@SerializedName("description")
		public String description;
		@SerializedName("isbn")
		public String isbn;
		
		@SerializedName("publisher")
		public String publisher;
		
		@SerializedName("customerReviewRank")
		public int customerReviewRank;

		@SerializedName("categoryName")
		public String categoryName;

		@SerializedName("categoryId")
		public int categoryId;
		
		@SerializedName("priceSales")
		public int priceSales;

		@SerializedName("priceStandard")
		public int priceStandard;
	}

}
=======
package pocketLib.spring.pocketLibSpring.retrofit.model;

import java.util.List;

import com.google.gson.annotations.SerializedName;

import lombok.Data;

@Data
public class AladinBook {

	/*
	 * @SerializedName("title") public String title;
	 * 
	 * @SerializedName("searchCategoryName") public String searchCategoryName;
	 */

	@SerializedName("item")
	public List<Item> item;

	@Data
	public class Item {
		@SerializedName("link")
		public String link;
		@SerializedName("cover")
		public String cover;
		@SerializedName("title")
		public String title;
		@SerializedName("author")
		public String author;
		@SerializedName("pubDate")
		public String pubDate;
		@SerializedName("description")
		public String description;
		@SerializedName("isbn")
		public String isbn;
		
		@SerializedName("publisher")
		public String publisher;
		@SerializedName("customerReviewRank")
		public int customerReviewRank;

		@SerializedName("categoryName")
		public String categoryName;

		@SerializedName("categoryId")
		public int categoryId;
		
		@SerializedName("priceSales")
		public int priceSales;

		@SerializedName("priceStandard")
		public int priceStandard;
	}

}
>>>>>>> f1cd26bbb41b54115ce93ea2b1be85db5b4cc012
