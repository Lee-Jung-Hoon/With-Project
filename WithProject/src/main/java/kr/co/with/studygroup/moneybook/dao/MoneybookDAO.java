package kr.co.with.studygroup.moneybook.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.with.studygroup.moneybook.vo.MoneyBookSearchVO;
import kr.co.with.studygroup.moneybook.vo.MoneyBookVO;

@Repository
public class MoneybookDAO {

	@Autowired
	private SqlSessionTemplate session;
	
	// 가계부 입력 등록을 위한 dao
	public MoneyBookVO regMoneybook(MoneyBookVO moneybook) {
		session.insert("with.moneybook.dao.insertMoneybook", moneybook);
		return session.selectOne("with.moneybook.dao.selectcurrMoneybook");
	}

	// 가계부 입력 리스트 출력을 위한 dao
	public List<MoneyBookVO> SelectMoneybookList(int groupNo) {
		return session.selectList("with.moneybook.dao.selectMoneybookList", groupNo);
	}

	// 가계부 입력 리스트 삭제를 위한 dao
	public void deleteMoneybook(int no) {
		session.delete("with.moneybook.dao.deleteMoneybook", no);
	}

	// 가계부 입력 리스트 출력을 위한 dao
	public List<MoneyBookVO> SelectMoneybookListOption(MoneyBookSearchVO search) {
		return session.selectList("with.moneybook.dao.SelectMoneybookListOption", search);
	}

	// 가계부 사용 내역별 리스트 출력을 위한 dao
	public List<MoneyBookVO> SortSearchMoneybook(MoneyBookSearchVO search) {
		String array[] = {"식비", "교통비", "생활용품", "교통/차량", "경조사", "장소대여비", "미분류"};
		List<MoneyBookVO> val = new ArrayList<>();
		for(int i=0; i<array.length; i++) {
			search.setSearch(array[i]);
			val.add(session.selectOne("with.moneybook.dao.SortSearchMoneybook", search));
		}
		return val;
	}

	// 가계부 카드 내역 출력을 위한 dao
	public MoneyBookVO SelectCardList(MoneyBookVO search) {
		return session.selectOne("with.moneybook.dao.SelectCardList", search);
	}
}
