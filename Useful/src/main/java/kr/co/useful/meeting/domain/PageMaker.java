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
   
   //������ ��ȣ ��¿� ���õ� ���
   public void calcData(){
	   //Math.ceil(double a)  : ������ �ø�  1.1 --> 2   1.9 ---> 2
	   //Math.round(doublc a)   : �ݿø�    1.1 ---> 1     1.5 ---> 2
	   
	  endPage =   (int)( Math.ceil((cri.getPage()/(double)displayPageNum)) 
			        * displayPageNum);//(��������������/�����ִ�������)*�����ִ� ������
	  
	  startPage = (endPage - displayPageNum) +1;
	  
	  int tempEndPage= (int)(Math.ceil(totalCount/(double)cri.getPerPageNum()));
      //tempEndPage : ��ü �� ��������
	  
	  if(endPage > tempEndPage){
    	  endPage = tempEndPage;
      }
      
      prev = (startPage==1) ? false : true;
         //====> ���� 1~10�������� ����� ����   ������ '<<'��ư ���� 
      next = (endPage * cri.getPerPageNum()) >= totalCount ? false: true;
     
   }//calcData

   
   public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	    calcData();//totalCount�� �������� ����¡�� �ʿ��� �����͸� �ʱ�ȭ
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


