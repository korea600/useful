package kr.co.useful.approval.domain;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class ApprovalPageMaker {
	private int totalCount;
	private int startPage;
	private int endPage;
	private int displayPage=10;
	private boolean prev;
	private boolean next;
	private ApprovalCriteria cri;
	
	private void calcData(){
		endPage = (int)(Math.ceil(cri.getPage()/(double)displayPage) * displayPage);
		startPage = endPage-displayPage+1;
		int tempEndPage = (int) (Math.ceil(totalCount / (double) cri.getPerPage()));
		if(endPage>tempEndPage) endPage=tempEndPage;
		prev = (startPage==1) ? false:true;
		next = (endPage*cri.getPerPage() >= totalCount) ? false:true;
	}
	
	public void setTotalCount(int totalCount){
		this.totalCount = totalCount;
		calcData();
	}
	
	public String makeQuery(int page){
		UriComponents uri = UriComponentsBuilder.newInstance()
						.queryParam("page", page)
						.queryParam("perPage", cri.getPerPage())
						.build();
		return uri.toUriString();
	}

	public String makeSearch(int page){
		UriComponents uri = UriComponentsBuilder.newInstance()
				.queryParam("page", page)
				.queryParam("perPage", cri.getPerPage())
				.queryParam("searchBy", cri.getSearchBy())
				.queryParam("keyword", cri.getKeyword())
				.build();
		return uri.toUriString();
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

	public int getDisplayPage() {
		return displayPage;
	}

	public void setDisplayPage(int displayPage) {
		this.displayPage = displayPage;
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

	public ApprovalCriteria getCri() {
		return cri;
	}

	public void setCri(ApprovalCriteria cri) {
		this.cri = cri;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public String toString() {
		return "ApprovalPageMaker [totalCount=" + totalCount + ", startPage=" + startPage + ", endPage=" + endPage
				+ ", displayPage=" + displayPage + ", prev=" + prev + ", next=" + next + ", cri=" + cri + "]";
	}

}
