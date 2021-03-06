package kr.co.useful.sharetask.domain;

public class SearchCriteria extends Criteria{
	
	private String searchType;//검색타입
	private String keyword;//검색어
	private int deptno;
	
	public SearchCriteria() {}
	
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
	
	public int getDeptno() {
		return deptno;
	}

	public void setDeptno(int deptno) {
		this.deptno = deptno;
	}

	public String toString(){
		return "SearchCritera 검색조건 = "+searchType+", 검색어 = "+keyword+", 현페이지 ="+getPage()
		    +", 페이지당 출력행 = "+getPerPageNum()+"]";                           
	}
	
}
