package com.kh.ljh.domain;

public class PagingDto {
	private int page = 1; // 현재 페이지
	private int perPage = 10; // 한 페이지당 보여질 글 갯수
	private int startRow = 1;
	private int endRow = startRow + perPage - 1;
	private String searchType;
	private String keyword;

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

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
		setRows();
	}
	
	private void setRows() {
		// 1		2
		// s:1		11
		// e:10		20
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

	@Override
	public String toString() {
		return "PagingDto [page=" + page + ", perPage=" + perPage + ", startRow=" + startRow + ", endRow=" + endRow
				+ ", searchType=" + searchType + ", keyword=" + keyword + "]";
	}

	

}
