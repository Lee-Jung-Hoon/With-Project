package kr.co.with.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class WithUtil {
	public String timeStamp(String time) {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date(Long.parseLong(time) * 1000);
		String day = format.format(date);
		return day;
	}
}
