package kr.co.useful.manager.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import kr.co.useful.manager.domain.JsonObj;
import kr.co.useful.manager.persistence.ManagerDAO;
import kr.co.useful.manager.service.ManagerService;

@RestController
@RequestMapping("/manager")
public class ManagerRestController {
	
	@Inject
	private ManagerDAO dao;
	
	@Inject
	private ManagerService service;

	@RequestMapping("/list")
	public JsonObj list(
			@RequestParam(value = "page", required=false) String page,//page : 몇번째 페이지를 요청했는지
            @RequestParam(value = "rows", required=false) String rows,//rows : 페이지 당 몇개의 행이 보여질건지
            @RequestParam(value = "sidx", required=false) String sidx,//sidx : 소팅하는 기준이 되는 인덱스
            @RequestParam(value = "sord", required=false) String sord) {//sord : 내림차순 또는 오름차순
		
			JsonObj obj = new JsonObj(); // jqgrid는 원하는 json형태가 있기때문에 그 포맷을 쉽게 맞추기위한 객체생성
			
			List<Map<String, Object>> list =null;
			
	        int int_page = Integer.parseInt(page);// 1 2 3
	        int perPageNum = (int)Double.parseDouble(rows);

	        try {
				list=dao.emplist();
			}
	        catch (Exception e) {
				e.printStackTrace();
			}
	        obj.setRows(list);  // list<map>형태의 받아온 데이터를 가공해서 셋( 그리드에 뿌려줄 행 데이터들 )
	        //page : 현재 페이지
	        obj.setPage(int_page);// 현재 페이지를 매개변수로 넘어온 page로 지정해준다. 
	         
	        //records : 보여지는 데이터 개수
	        obj.setRecords(list.size());
	         
	        //total : rows에 의한 총 페이지수
	        // 총 페이지 갯수는 데이터 갯수 / 한페이지에 보여줄 갯수 이런 식
	        int totalPage = (int)Math.ceil(list.size()/Double.parseDouble(rows));
	        obj.setTotal(totalPage); // 총 페이지 수 (마지막 페이지 번호)
		return obj;
	}
	
	@RequestMapping("/listSearch")
	public JsonObj list2(@RequestParam(value = "page", required=false) String page,
			            	@RequestParam(value = "rows", required=false) String rows,
				            @RequestParam(value = "sidx", required=false) String sidx,
				            @RequestParam(value = "sord", required=false) String sord,
				            String keyword,String searchType){
		JsonObj obj = new JsonObj(); 
			
		List<Map<String, Object>> list =null;
			
	    int int_page = Integer.parseInt(page);// 1 2 3
	    int perPageNum = (int)Double.parseDouble(rows);
	        
	    try {
			list=dao.emplistSearch(searchType, keyword);
		}
	    catch (Exception e) {
			e.printStackTrace();
		}
	    obj.setRows(list);
	    obj.setPage(int_page);
	    obj.setRecords(list.size());
        int totalPage = (int)Math.ceil(list.size()/Double.parseDouble(rows));
        obj.setTotal( totalPage ); 
		return obj;
	}

	@RequestMapping("/commute_Update")
	public String commute_Update(@RequestBody Map<String,Object> requestMap,Model model)throws Exception{
		service.commute_update(requestMap);
		return "SUCCESS";
	}
}