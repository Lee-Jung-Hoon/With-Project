package kr.co.with.studygroup.moneybook.service;

import java.util.List;

import kr.co.with.studygroup.moneybook.vo.MoneyBookVO;

public interface MoneybookService {

	public MoneyBookVO regMoneybook(MoneyBookVO moneybook) throws Exception;

	public List<MoneyBookVO> SelectMoneybookList(int groupNo) throws Exception;

	public void deleteMoneybook(int no) throws Exception;

}
