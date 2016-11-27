package kr.co.useful.board.domain;

import org.springframework.web.util.*;

public class PageMaker {
private int totalCount;
private int startPage;
private int endPage;

private int displayPageNum=10;
private boolean prev;
private boolean next;
private Criteria cri;

public void calc(){
	endPage=(int) (Math.ceil(cri.getPage()/(double)displayPageNum)*displayPageNum);
	startPage=(endPage-displayPageNum)+1;
	int tempEndPage=(int) (Math.ceil(totalCount)/(double)cri.getPerPageNum());
	if(endPage>tempEndPage){
		endPage=tempEndPage;
	}
	prev=startPage==1?false:true;
	next=endPage*cri.getPerPageNum()>=totalCount?false:true;
}
public String query(int page){
	UriComponents uriComponents=UriComponentsBuilder.newInstance()
			.queryParam("page", page)
			.queryParam("perPageNum", cri.getPerPageNum())
			.build();
	return uriComponents.toUriString();
}

public String serach(int page){
	UriComponents uriComponents=UriComponentsBuilder.newInstance()
			.queryParam("page", page)
			.queryParam("perPageNum", cri.getPerPageNum())
			.queryParam("keyword", ((SearchCriteria)cri).getKeyword())
			.queryParam("searchType", ((SearchCriteria)cri).getSearchType())
			.build();
	return uriComponents.toUriString();
}

@Override
public String toString() {
	return "PageMaker [totalCount=" + totalCount + ", startPage=" + startPage + ", endPage=" + endPage
			+ ", displayPageNum=" + displayPageNum + ", prev=" + prev + ", next=" + next + ", cri=" + cri + "]";
}
public int getTotalCount() {
	return totalCount;
}
public void setTotalCount(int totalCount) {
	this.totalCount = totalCount;
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
public int getDisplayPageNum() {
	return displayPageNum;
}
public void setDisplayPageNum(int displayPageNum) {
	this.displayPageNum = displayPageNum;
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
public Criteria getCri() {
	return cri;
}
public void setCri(Criteria cri) {
	this.cri = cri;
}

}
