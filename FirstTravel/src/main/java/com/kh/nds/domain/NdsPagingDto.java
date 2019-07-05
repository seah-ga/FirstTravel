package com.kh.nds.domain;

public class NdsPagingDto {
	private int page = 1; // 현재 페이지
	private int perPage = 6; // 한 페이지당 보여질 글 갯수
	private int startRow = 1;
	private int endRow = startRow + perPage - 1;
	private String searchType;
	private String keyword;
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
		setRows();
	}
	private void setRows() {
		startRow = page * perPage - perPage + 1;
		endRow = startRow + perPage - 1;
	}
	public int getPerPage() {
		return perPage;
	}
	public void setPerPage(int perPage) {
		this.perPage = perPage;
		setRows();
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
	public NdsPagingDto(int page, int perPage, int startRow, int endRow, String searchType, String keyword) {
		super();
		this.page = page;
		this.perPage = perPage;
		this.startRow = startRow;
		this.endRow = endRow;
		this.searchType = searchType;
		this.keyword = keyword;
	}
	public NdsPagingDto() {
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "PagingDto [page=" + page + ", perPage=" + perPage + ", startRow=" + startRow + ", endRow=" + endRow+
				 ", searchType=" + searchType + ", keyword=" + keyword + "]";
	}
	
	
}
