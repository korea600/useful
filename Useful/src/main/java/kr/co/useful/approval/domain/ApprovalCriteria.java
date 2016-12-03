package kr.co.useful.approval.domain;

public class ApprovalCriteria {
	private int page;
	private int perPage;
	private String searchBy;
	private String keyword;
	
	public ApprovalCriteria() {
		page=1; perPage=10;
	}
	
	public int getPageStart(){
		return perPage*(page-1);
	}
	
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getPerPage() {
		return perPage;
	}
	public void setPerPage(int perPage) {
		this.perPage = perPage;
	}
	public String getSearchBy() {
		return searchBy;
	}
	public void setSearchBy(String searchBy) {
		this.searchBy = searchBy;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	public String toString() {
		return "ApprovalCriteria [page=" + page + ", perPage=" + perPage + ", searchBy=" + searchBy + ", keyword="
				+ keyword + "]";
	}
	
}
