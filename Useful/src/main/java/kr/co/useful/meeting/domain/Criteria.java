package kr.co.useful.meeting.domain;

public class Criteria {
	private int page; // ���� ������
	private int perPageNum; // �� ȭ�鿡 ������ ���� ��

	public Criteria() {
		page = 1;
		perPageNum = 10;
	}// ������

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
		
		return (page-1) * perPageNum;
		
	}
	
	public String toString(){
		return "Critera [�� ������="+page+", �������� ����� = "+perPageNum+"]";                           
		
	}

}