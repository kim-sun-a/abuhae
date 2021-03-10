package study.team.abuhae.helper;

import java.util.Calendar;

import lombok.Data;
import lombok.extern.slf4j.Slf4j;

@Data
@Slf4j
/*
 * DB에서 kids_age 끌어와 아이 연령대 구하는 helper made by suna 20210212 사용시
 * 객체이름.getKids_age()로 사용
 */
public class AgeHelper {
	// 타입을 구분하는
	public String kidsStr(String kids_age_str) {
		// kids_age 202003 이라고 가정하고
		String kids_age = null;

		// 현재 날짜
		Calendar date = Calendar.getInstance();

		// 현재 년도와 월 구하기
		int year = date.get(Calendar.YEAR);
		int month = date.get(Calendar.MONTH) + 1;

		String yearStr = Integer.toString(year);
		String monthStr = Integer.toString(month);

		// 월이 한 자리일 경우 월 앞에 '0' 붙여주기
		if (monthStr.length() < 2) {
			monthStr = '0' + monthStr;
		}

		String nowdate = yearStr + monthStr;

		// System.out.println(nowdate);
		int kids_age_int = Integer.parseInt(kids_age_str);
		int now_date = Integer.parseInt(nowdate);

		// 개월 수 측정
		int age = (now_date - kids_age_int) / 10;

		if (0 <= age && age <= 6) {
			kids_age = "신생아";
		} else if (6 < age && age <= 36) {
			kids_age = "영아";
		} else if (36 < age && age <= 84) {
			kids_age = "유아";
		} else {
			kids_age = "초등학생";
		}

		return kids_age;
		// log.debug(this.toString());
	}
	
	//회원가입용 age 구분
	public String kidsEng(String kids_age_str) {
		// kids_age 202003 이라고 가정하고
		String kids_age = null;

		// 현재 날짜
		Calendar date = Calendar.getInstance();

		// 현재 년도와 월 구하기
		int year = date.get(Calendar.YEAR);
		int month = date.get(Calendar.MONTH) + 1;

		String yearStr = Integer.toString(year);
		String monthStr = Integer.toString(month);

		// 월이 한 자리일 경우 월 앞에 '0' 붙여주기
		if (monthStr.length() < 2) {
			monthStr = '0' + monthStr;
		}

		String nowdate = yearStr + monthStr;

		// System.out.println(nowdate);
		int kids_age_int = Integer.parseInt(kids_age_str);
		int now_date = Integer.parseInt(nowdate);

		// 개월 수 측정
		int age = (now_date - kids_age_int) / 10;

		if (0 <= age && age <= 6) {
			kids_age = "got_baby";
		} else if (6 < age && age <= 36) {
			kids_age = "baby";
		} else if (36 < age && age <= 84) {
			kids_age = "children";
		} else {
			kids_age = "element";
		}

		return kids_age;
		// log.debug(this.toString());
	}

	public int kidsAge(String kids_age_str) {
		int age = 0;
		// 현재 날짜
		Calendar date = Calendar.getInstance();

		// 현재 년도와 월 구하기
		int year = date.get(Calendar.YEAR);

		if(kids_age_str!=null || kids_age_str!="" ) {
			// 나이 구하기
			String kids_year_str = kids_age_str.substring(0, 4);
			int kids_year = Integer.parseInt(kids_year_str);
			age = year - kids_year;
		} 
		
		
		return age;
	}

	public int kidsMonthly(String kids_age_str) {
		int monthly = 0;
		// 현재 날짜
		Calendar date = Calendar.getInstance();

		// 현재 년도와 월 구하기
		int year = date.get(Calendar.YEAR);
		int month = date.get(Calendar.MONTH) + 1;

		String yearStr = Integer.toString(year);
		String monthStr = Integer.toString(month);

		// 월이 한 자리일 경우 월 앞에 '0' 붙여주기
		if (monthStr.length() < 2) {
			monthStr = '0' + monthStr;
		}

		String nowdate = yearStr + monthStr;
		
		int kids_age_int = Integer.parseInt(kids_age_str);
		int now_date = Integer.parseInt(nowdate);

		// 개월수 측정
		monthly = (now_date - kids_age_int) / 10;

		return monthly;
	}
}
