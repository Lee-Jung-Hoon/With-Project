package kr.co.with.calendar.vo;

public class CalendarVO {
   private int id;
   private String startDate;
   private String endDate;
   private String title;
   public int getId() {
      return id;
   }
   public void setId(int id) {
      this.id = id;
   }
   public String getStartDate() {
      return startDate;
   }
   public void setStartDate(String startDate) {
      this.startDate = startDate;
   }
   public String getEndDate() {
      return endDate;
   }
   public void setEndDate(String endDate) {
      this.endDate = endDate;
   }
   public String getTitle() {
      return title;
   }
   public void setTitle(String title) {
      this.title = title;
   }
@Override
public String toString() {
	return "CalendarVO [id=" + id + ", startDate=" + startDate + ", endDate=" + endDate + ", title=" + title + "]";
}
   
   
}