package kr.co.with.studygroup.moneybook.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
}
