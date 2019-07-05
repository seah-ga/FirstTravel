package com.kh.ljh.domain;

import com.kh.ljh.domain.PagingDto;

public class PaginationDto {
	private int totalCount; // 데이터 갯수
	private int startPage; // 시작 페이지
	private int endPage; // 끝 페이지
	private boolean prev; // 이전 출력 여부
	private boolean next; // 다음 출력 여부
	private int paginationCount = 10; // 페이지 출력 개수
	private int pageCount;
	private PagingDto pagingDto;

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		calcData();
	}
	
	private void calcData() {
		// 505 : 51
		int perPage = pagingDto.getPerPage();
		// 전체 페이지 수 
		pageCount = totalCount / perPage;
		if (totalCount % perPage > 0) {
			pageCount += 1;
		}
		
		int page = pagingDto.getPage();
		startPage = ((page - 1) / paginationCount) * paginationCount + 1;
		endPage = startPage + paginationCount - 1;
		if (endPage > pageCount) {
			endPage = pageCount;
		}
		
		if (startPage != 1) {
			prev = true;
		}
		
		if (endPage != pageCount) {
			next = true;
		}
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public int getPaginationCount() {
		return paginationCount;
	}

	public void setPaginationCount(int paginationCount) {
		this.paginationCount = paginationCount;
	}

	public PagingDto getPagingDto() {
		return pagingDto;
	}

	public void setPagingDto(PagingDto pagingDto) {
		this.pagingDto = pagingDto;
	}

	@Override
	public String toString() {
		return "PaginationDto [totalCount=" + totalCount + ", startPage=" + startPage + ", endPage=" + endPage
				+ ", prev=" + prev + ", next=" + next + ", paginationCount=" + paginationCount + ", pageCount="
				+ pageCount + ", pagingDto=" + pagingDto + "]";
	}

	

}
