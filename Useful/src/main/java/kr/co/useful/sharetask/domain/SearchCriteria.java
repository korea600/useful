package kr.co.useful.sharetask.domain;

public class SearchCriteria extends Criteria{
	
	private String searchType;//�˻�Ÿ��
	private String keyword;//�˻���
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
		return "SearchCritera �˻����� = "+searchType+", �˻��� = "+keyword+", �������� ="+getPage()
		    +", �������� ����� = "+getPerPageNum()+"]";                           
	}
	
}
