package kr.co.with.studygroup.moneybook.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.with.studygroup.moneybook.service.MoneybookService;
import kr.co.with.studygroup.moneybook.vo.MoneyBookSearchVO;
import kr.co.with.studygroup.moneybook.vo.MoneyBookVO;

@RequestMapping("/moneybook")
@Controller
public class MoneybookController {
	
	@Autowired
	private MoneybookService service;
	
	@RequestMapping("/select_moneybook.json")
	@ResponseBody
	public List<MoneyBookVO> SelectMoneybookList() throws Exception {
		// groupNo 넣을 자리
		int groupNo = 1;
		return service.SelectMoneybookList(groupNo);
	}
	
	@RequestMapping("/select_moneybookOption.json")
	@ResponseBody
	public List<MoneyBookVO> SelectMoneybookListOption(String start, String end) throws Exception {
		// groupNo 넣을 자리
		int groupNo = 1;
		
		MoneyBookSearchVO search = new MoneyBookSearchVO();
		search.setEndDate(end);
		search.setStartDate(start);
		search.setGroupNo(groupNo);
		
		return service.SelectMoneybookListOption(search);
	}
	
	// 
	@RequestMapping("/sortSearchMoneybook.json")
	@ResponseBody
	public List<MoneyBookVO> SortSearchMoneybook(String start, String end) throws Exception {
		// groupNo 넣을 자리
		int groupNo = 1;
		
		MoneyBookSearchVO search = new MoneyBookSearchVO();
		search.setEndDate(end);
		search.setStartDate(start);
		search.setGroupNo(groupNo);
		
		return service.SortSearchMoneybook(search);
	}
	
	
	// 가계부 입력 등록을 위한 json
	@RequestMapping("/reg_moneybook.json")
	@ResponseBody
	public MoneyBookVO RegMoneybook(MoneyBookVO moneybook) throws Exception {
		// groupNo 넣을 자리
		moneybook.setGroupNo(1);		
		// memberNo 넣을 자리
		moneybook.setMemberNo(1);
		return service.regMoneybook(moneybook);
	}
	
	// 가계부 삭제를 위한 json
	@RequestMapping("/delete_moneybook.json")
	@ResponseBody
	public void DeleteMoneybook(int no) throws Exception {
		service.deleteMoneybook(no);
	}
	
	// 카드 내역 확인을 위한 json
	@RequestMapping("/select_CardList.json")
	@ResponseBody
	public MoneyBookVO SelectCardList(String date) throws Exception {
		MoneyBookVO search = new MoneyBookVO();
		search.setGroupNo(1);
		search.setmDate(date);
		return service.SelectCardList(search);
	}

	// 현금 내역 확인을 위한 json
	@RequestMapping("/select_MoneyList.json")
	@ResponseBody
	public MoneyBookVO SelectMoneyList(String date) throws Exception {
		MoneyBookVO search = new MoneyBookVO();
		search.setGroupNo(1);
		search.setmDate(date);
		return service.SelectMoneyList(search);
	}
	
	
	@RequestMapping("/spendChart.json")
	@ResponseBody
	public Map<String, Object> spendChart(String start, String end) throws Exception {
		Map<String, Object> map = new HashMap<>();
		String category[] = {"식비", "교통비", "생활용품", "교통/차량", "경조사", "장소대여비", "미분류"};
		String spendType[] = {"신용카드+", "체크카드-", "현금-", "갚을돈+"};
		String mapKey[] = {"card", "check", "money", "debt"};
		for(int i=0; i<4; i++) {
			MoneyBookSearchVO search = new MoneyBookSearchVO();
			List<Integer> list = new ArrayList<>();
			for(int j=0; j<7; j++) {
				// 그룹 No 넣을 자리
				search.setGroupNo(1);
				search.setCategory(category[j]);
				search.setSearch(spendType[i]);
				search.setStartDate(start);
				search.setEndDate(end);
				list.add(service.selectSpendChart(search));
			}
			map.put(mapKey[i], list);
		}
		return map;
	}
	
	
	
	@RequestMapping("/selectYearChart.json")
	@ResponseBody
	public List<MoneyBookSearchVO> SelectYearChart(String year) throws Exception {
		MoneyBookSearchVO search = new MoneyBookSearchVO();
		search.setStartDate(year);
		// 그룹 No 넣는 자리
		search.setGroupNo(1);
		return service.SelectYearChart(search);
	}
}
