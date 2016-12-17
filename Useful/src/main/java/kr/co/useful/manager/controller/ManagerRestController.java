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
			@RequestParam(value = "page", required=false) String page,//page : ���° �������� ��û�ߴ���
            @RequestParam(value = "rows", required=false) String rows,//rows : ������ �� ��� ���� ����������
            @RequestParam(value = "sidx", required=false) String sidx,//sidx : �����ϴ� ������ �Ǵ� �ε���
            @RequestParam(value = "sord", required=false) String sord) {//sord : �������� �Ǵ� ��������
		
			JsonObj obj = new JsonObj(); // jqgrid�� ���ϴ� json���°� �ֱ⶧���� �� ������ ���� ���߱����� ��ü����
			
			List<Map<String, Object>> list =null;
			
	        int int_page = Integer.parseInt(page);// 1 2 3
	        int perPageNum = (int)Double.parseDouble(rows);

	        try {
				list=dao.emplist();
			}
	        catch (Exception e) {
				e.printStackTrace();
			}
	        obj.setRows(list);  // list<map>������ �޾ƿ� �����͸� �����ؼ� ��( �׸��忡 �ѷ��� �� �����͵� )
	        //page : ���� ������
	        obj.setPage(int_page);// ���� �������� �Ű������� �Ѿ�� page�� �������ش�. 
	         
	        //records : �������� ������ ����
	        obj.setRecords(list.size());
	         
	        //total : rows�� ���� �� ��������
	        // �� ������ ������ ������ ���� / ���������� ������ ���� �̷� ��
	        int totalPage = (int)Math.ceil(list.size()/Double.parseDouble(rows));
	        obj.setTotal(totalPage); // �� ������ �� (������ ������ ��ȣ)
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