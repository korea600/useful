package kr.co.useful.schedule.domain;

public class SearchCriteria extends Criteria{
	
	private String searchType;//�˻�Ÿ��
	private String keyword;//�˻���
	
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

	public String toString(){
		return "SearchCritera �˻����� = "+searchType+", �˻��� = "+keyword+", �������� ="+getPage()
		    +", �������� ����� = "+getPerPageNum()+"]";                           
	}
	
}
