package kr.co.useful.board.domain;

public class Criteria {
	private int page=1;
	private int perPageNum=10;

	public String toString() {
		return "Criteria [페이지=" + page + ", 페이지출력수=" + perPageNum + "]";
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getPerPageNum() {
		return perPageNum;
	}

	public void setPerPageNum(int perPageNum) {
		this.perPageNum = perPageNum;
	}

	public int getPageStart(){
		return (page-1)*perPageNum;
	}
}
