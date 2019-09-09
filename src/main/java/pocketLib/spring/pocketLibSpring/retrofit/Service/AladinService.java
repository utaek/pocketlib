package pocketLib.spring.pocketLibSpring.retrofit.Service;

import org.springframework.stereotype.Service;

import pocketLib.spring.pocketLibSpring.retrofit.model.AladinBook;
import pocketLib.spring.pocketLibSpring.retrofit.model.AladinBookList;
import retrofit2.Call;
import retrofit2.http.GET;
import retrofit2.http.Query;

/*/**
 * 
 샘플 : http://www.aladin.co.kr/ttb/api/
ItemSearch.aspx?
ttbkey=[TTBKey]
&Query=aladdin
&QueryType=Title
&MaxResults=10
&start=1
&SearchTarget=Book
&output=js
&Version=20190801

 * @return
 */
@Service
public interface AladinService {
	public static final String BASE_URL = "http://www.aladin.co.kr";
	
	@GET("/ttb/api/ItemSearch.aspx")
	Call<AladinBook> getAladinBookSearch(
			@Query("TTBKey") String ttbkey, 
			@Query("Query") String Query,
			@Query("QueryType") String queryType , 
			@Query("MaxResults") int maxResults ,
			@Query("Cover") String cover ,
			
			@Query("start") int start, 
			@Query("SearchTarget") String searchTarget, 
			@Query("output") String output,
			@Query("Version") int version);
	
	//베스트셀러
		@GET("/ttb/api/ItemList.aspx")
		Call<AladinBookList> getBestseller(
				@Query("TTBKey") String ttbkey, 
				@Query("QueryType") String queryType , 
				@Query("MaxResults") int maxResults ,
				@Query("Cover") String cover ,
				@Query("start") int start, 
				@Query("SearchTarget") String searchTarget, 
				@Query("CategoryId") int categoryId, 
				@Query("output") String output,
				@Query("Version") int version);

		@GET("/ttb/api/ItemList.aspx")
		Call<AladinBookList> getBestseller2(
				@Query("TTBKey") String ttbkey, 
				@Query("QueryType") String queryType , 
				@Query("MaxResults") int maxResults ,
				@Query("Cover") String cover ,
				@Query("start") int start, 
				@Query("SearchTarget") String searchTarget, 
				@Query("output") String output,
				@Query("Version") int version);
	//신간전체리스트
	@GET("/ttb/api/ItemList.aspx")
	Call<AladinBookList> getItemNewAll(
			@Query("TTBKey") String ttbkey, 
			@Query("QueryType") String queryType , 
			@Query("MaxResults") int maxResults ,
			@Query("Cover") String cover ,
			
			@Query("start") int start, 
			@Query("SearchTarget") String searchTarget, 
			@Query("CategoryId") int categoryId, 
			@Query("output") String output,
			@Query("Version") int version);
	
	
	//주목할 만한 신간리스트
	@GET("/ttb/api/ItemList.aspx")
	Call<AladinBookList> getItemNewSpecial(
			@Query("TTBKey") String ttbkey, 
			@Query("QueryType") String queryType , 
			@Query("MaxResults") int maxResults ,
			@Query("Cover") String cover ,
			
			@Query("start") int start, 
			@Query("SearchTarget") String searchTarget, 
			@Query("CategoryId") int categoryId, 
			@Query("output") String output,
			@Query("Version") int version);
		
	
	
	//편집자 추천 리스트
	@GET("/ttb/api/ItemList.aspx")
	Call<AladinBookList> getEditorChoice(
			@Query("TTBKey") String ttbkey, 
			@Query("QueryType") String queryType , 
			@Query("MaxResults") int maxResults ,
			@Query("Cover") String cover ,
			
			@Query("start") int start, 
			@Query("SearchTarget") String searchTarget, 
			@Query("output") String output,
			@Query("Version") int version);


	


	//북플베스트셀러
	@GET("/ttb/api/ItemList.aspx")
	Call<AladinBookList> getBPBestseller();

}
