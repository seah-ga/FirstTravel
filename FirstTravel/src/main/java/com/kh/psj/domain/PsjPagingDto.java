package com.kh.psj.domain;

public class PsjPagingDto {
	int nowPage;
	int startRow;
	int endRow;
	int startPage;
	int endPage;
	int lastPage;
	int numPerPage = 15;
	int pagingNum = 10;
	int scriptCount;
	SearchDto searchDto;

	public void paging(int nowPage, int scriptCount) {
		///////////////////////////////////////////
	    if( scriptCount % numPerPage != 0 ) {
		    lastPage = endPage = scriptCount / numPerPage + 1;
		}else {
		    lastPage = endPage = scriptCount / numPerPage;
		}
		///////////////////////////////////////
	    
		endPage = (nowPage / pagingNum + 1) * pagingNum;
		if(nowPage % pagingNum == 0 && nowPage / pagingNum > 0) {
			endPage = ( nowPage / pagingNum  ) * pagingNum;
		}
		
		if(endPage > lastPage) {
			endPage = lastPage;
			startPage = (endPage / pagingNum) * pagingNum + 1;
			
		}else {
			startPage= endPage - pagingNum + 1;
		}
		
		if(startPage < 0) {
			startPage = 1;
		}
		
		///////////////////////////
		if(nowPage == lastPage){
			endRow = scriptCount;
		}else{
			endRow = nowPage * numPerPage;
		}
		
		///////////////////////////////
	    if(nowPage == lastPage) {
		    startRow = lastPage * numPerPage - pagingNum + 1;
		    if(startRow > endRow) {
		    	startRow = 1;
		    }
		}else {
		    startRow = endRow - numPerPage + 1;
		    if(startRow < 0) {
		    	startRow = 1;
		    }
	    }
		
	}
	
	///////////이 생성자를 호출할때 페이징 /////////////////////
	public PsjPagingDto(int nowPage, int scriptCount) {
		super();
		this.nowPage = nowPage;
		this.scriptCount = scriptCount;
		paging(nowPage, scriptCount);
	}
	////////////////////////////////////////////////////////
	
	public int getNowPage() {
		return nowPage;
	}
	public SearchDto getSearchDto() {
		return searchDto;
	}

	public void setSearchDto(SearchDto searchDto) {
		this.searchDto = searchDto;
	}

	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
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
	public int getLastPage() {
		return lastPage;
	}
	public void setLastPage(int lastPage) {
		this.lastPage = lastPage;
	}
	public int getNumPerPage() {
		return numPerPage;
	}
	public void setNumPerPage(int numPerPage) {
		this.numPerPage = numPerPage;
	}
	public int getPagingNum() {
		return pagingNum;
	}
	public void setPagingNum(int pagingNum) {
		this.pagingNum = pagingNum;
	}
	public int getScriptCount() {
		return scriptCount;
	}
	public void setScriptCount(int scriptCount) {
		this.scriptCount = scriptCount;
	}
	
	@Override
	public String toString() {
		return "PsjPagingDto [nowPage=" + nowPage + ", startRow=" + startRow + ", endRow=" + endRow + ", startPage="
				+ startPage + ", endPage=" + endPage + ", lastPage=" + lastPage + ", numPerPage=" + numPerPage
				+ ", pagingNum=" + pagingNum + ", scriptCount=" + scriptCount + ", searchDto=" + searchDto + "]";
	}

	public PsjPagingDto(int nowPage, int startRow, int endRow, int startPage, int endPage, int lastPage, int numPerPage,
			int pagingNum, int scriptCount, SearchDto searchDto) {
		super();
		this.nowPage = nowPage;
		this.startRow = startRow;
		this.endRow = endRow;
		this.startPage = startPage;
		this.endPage = endPage;
		this.lastPage = lastPage;
		this.numPerPage = numPerPage;
		this.pagingNum = pagingNum;
		this.scriptCount = scriptCount;
		this.searchDto = searchDto;
	}

	public PsjPagingDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	

}
