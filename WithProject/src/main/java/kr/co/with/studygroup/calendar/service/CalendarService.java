package kr.co.with.studygroup.calendar.service;

import java.util.List;

import kr.co.with.studygroup.calendar.vo.CalendarVO;

public interface CalendarService {

   public int registSch(CalendarVO test) throws Exception;

   public List<CalendarVO> selectList() throws Exception;

   public void updateSch(CalendarVO test) throws Exception;

   public void deleteSch(int no) throws Exception; 
}