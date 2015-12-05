package kr.co.with.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class WithUtil {
	// 유닉스 시간 타입을 자바 시간 타입으로 변경
	public String timeStamp(String time) {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date(Long.parseLong(time) * 1000);
		String day = format.format(date);
		return day;
	}
}
