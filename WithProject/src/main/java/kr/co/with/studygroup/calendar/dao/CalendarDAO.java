package kr.co.with.studygroup.calendar.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.with.studygroup.calendar.vo.CalendarVO;

@Repository
public class CalendarDAO {
   
   @Autowired
   private SqlSessionTemplate session;
   
   public int registSch(CalendarVO test) {
      session.insert("with.calendar.dao.registSch", test);
      return session.selectOne("with.calendar.dao.maxId");
   }

   public List<CalendarVO> selectList() {
      return session.selectList("with.calendar.dao.selectSch");
   }

   public void updateSch(CalendarVO test) {
      session.update("with.calendar.dao.updateSch",test);
   }

   public void deleteSch(int no) {
	   System.out.println(no);
      session.delete("with.calendar.dao.deleteSch", no);
   }

}