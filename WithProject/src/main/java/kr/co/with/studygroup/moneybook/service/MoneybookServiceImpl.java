package kr.co.with.studygroup.moneybook.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.with.studygroup.moneybook.dao.MoneybookDAO;
import kr.co.with.studygroup.moneybook.vo.MoneyBookSearchVO;
import kr.co.with.studygroup.moneybook.vo.MoneyBookVO;

@Service
public class MoneybookServiceImpl implements MoneybookService {

	@Autowired
	private MoneybookDAO dao;
	

	// 가계부 입력 등록을 위한 service
	@Override
	public MoneyBookVO regMoneybook(MoneyBookVO moneybook) throws Exception {
		return dao.regMoneybook(moneybook);
	}

	// 가계부 입력 리스트 출력을 위한 service
	@Override
	public List<MoneyBookVO> SelectMoneybookList(int groupNo) {
		return dao.SelectMoneybookList(groupNo);
	}

	// 가계부 입력 리스트 삭제를 위한 service
	@Override
	public void deleteMoneybook(int no) throws Exception {
		dao.deleteMoneybook(no);
	}

	// 가계부 내역 검색을 위한 service
	@Override
	public List<MoneyBookVO> SelectMoneybookListOption(MoneyBookSearchVO search) throws Exception {
		return dao.SelectMoneybookListOption(search);
	}

	@Override
	public List<MoneyBookVO> SortSearchMoneybook(MoneyBookSearchVO search) throws Exception {
		return dao.SortSearchMoneybook(search);
	}

}
