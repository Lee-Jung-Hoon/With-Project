package kr.co.with.studygroup.calendar.service;

import java.util.List;

import kr.co.with.studygroup.calendar.vo.CalendarVO;

public interface CalendarService {

   public int registSch(CalendarVO calendar) throws Exception;

   public List<CalendarVO> selectList() throws Exception;

   public void updateSch(CalendarVO calendar) throws Exception;

   public void deleteSch(int no) throws Exception;

   public CalendarVO updateForm(int no) throws Exception; 
}