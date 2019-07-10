package com.kh.kdw.domain;

public class PagingDto {
	 private int page = 1; // 현재 페이지
	 private int perPage = 12; // 한 페이지당 보여질 글 갯수
	 private int startRow = 1;
	 private int endRow = startRow + perPage - 1;
	 private String searchType;
	 private String keyword;
	 private String g_location;
//	 private int user_code;
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
		setRow();
	}
	private void setRow() {
		// 1	2	10	page		1	2	10
		// 1	11	91	starRow		1	6	46
		// 10	20	100	endRow		5	10	50
		startRow = (page - 1) * perPage + 1;
		endRow = startRow + perPage - 1;
		
	}
	public int getPerPage() {
		return perPage;
	}
	public void setPerPage(int perPage) {
		this.perPage = perPage;
		setRow();
	}
	public int getStartRow() {
		return startRow;
	}
	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}
	public int getEndRow() {
		return endRow;
	}
	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	public String getG_location() {
		return g_location;
	}
	public void setG_location(String g_location) {
		this.g_location = g_location;
	}
//	public int getUser_code() {
//		return user_code;
//	}
//	public void setUser_code(int user_code) {
//		this.user_code = user_code;
//	}
//	@Override
//	public String toString() {
//		return "PagingDto [page=" + page + ", perPage=" + perPage + ", startRow=" + startRow + ", endRow=" + endRow
//				+ ", searchType=" + searchType + ", keyword=" + keyword + ", g_location=" + g_location + ", user_code="
//				+ user_code + "]";
//	}
	

	

	 
	 
}
