package kr.co.useful.meeting.domain;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class PageMaker {
   private int totalCount;
   private int startPage;
   private int endPage;

   private int displayPageNum=10;
   private boolean prev; 
   private boolean next;   
   
   private Criteria cri;
   
   //페이지 번호 출력에 관련된 계산
   public void calcData(){
	   //Math.ceil(double a)  : 무조건 올림  1.1 --> 2   1.9 ---> 2
	   //Math.round(doublc a)   : 반올림    1.1 ---> 1     1.5 ---> 2
	   
	  endPage =   (int)( Math.ceil((cri.getPage()/(double)displayPageNum)) 
			        * displayPageNum);//(현재페이지에서/보여주는페이지)*보여주는 페이지
	  
	  startPage = (endPage - displayPageNum) +1;
	  
	  int tempEndPage= (int)(Math.ceil(totalCount/(double)cri.getPerPageNum()));
      //tempEndPage : 전체 총 페이지수
	  
	  if(endPage > tempEndPage){
    	  endPage = tempEndPage;
      }
      
      prev = (startPage==1) ? false : true;
         //====> 만약 1~10페이지를 출력할 때는   좌측의 '<<'버튼 생략 
      next = (endPage * cri.getPerPageNum()) >= totalCount ? false: true;
     
   }//calcData

   
   public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	    calcData();//totalCount를 기준으로 페이징의 필요한 데이터를 초기화
   }
   
   public String makeQuery(int page){
	   UriComponents uriComponents =
	   UriComponentsBuilder.newInstance()
	   .queryParam("page", page)//pag3
	   .queryParam("perPageNum", cri.getPerPageNum())//page 3& perpageNum=10
	   .build();
     
	   return uriComponents.toUriString();
   }
   
   public String makeSearch(int page){
	   UriComponents uriComponents =
	   UriComponentsBuilder.newInstance()
	   .queryParam("page", page)//pag3
	   .queryParam("perPageNum", cri.getPerPageNum())//page 3& perpageNum=10
	   .queryParam("searchType", ((SearchCriteria)cri).getSearchType())
	   .queryParam("keyword", ((SearchCriteria)cri).getKeyword())
	   .build();
     
	   return uriComponents.toUriString();
	}
 
	public int getTotalCount() {
		return totalCount;
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


