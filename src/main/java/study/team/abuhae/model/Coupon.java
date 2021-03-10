package study.team.abuhae.model;

import lombok.Data;

@Data
public class Coupon {
	private int coupno;
	private String coup_name;
	private String coup_condition;
	private int coup_price;
	private String reg_date;
	private String exp_date;
	private int memberno;
	
	private int momno;
	private String sitter_type;			// 시터 타입 (대학생, 부모님 등)
	private String want_act1;			// 원하는 활동
	private String want_act2;			// 원하는 활동
	private String want_act3;			// 원하는 활동
	private String want_age;			// 돌보기 원하는 나이 (신생아, 영아 등)
	private String si;					// 시
	private String gu;					// 구
	private String dong;				// 동
	private int payment;				// 원하는 시급
	private char cctv;				// CCTV 동의 여부
	private char isprofile;			// 프로필 등록 여부
	private String schedule;				// 활동 가능 시간 (1, 2, 3, 4)
	//private String schedule_set;		// 원하는 시간 직접 입력 (JSON)
	private String introduce;			// 자기소개
	private int answer;					// 응답률
	private String openingdate; 		// 신청서 등록 시간
	private String days;			// 가능한 요일

	private int sitterno;
	private int kids_num;			// 아이 수
	private String kids_age;		// 아이 나이
	private char   schedule_ok;		// 일정 조정 가능 여부 ('Y' or 'N')
	private String description;		// 시터가 알아야할 사항
	private char   sitter_gender;	// 원하는 시터 성별 ('M' or 'F')
	private char   interview_type;	// 원하는 인터뷰 방식
	private String care_type;		// 원하는 돌봄 타입
	private String apply_title;		// 신청서 제목
	private String apply_content;	// 신청서 내용
	private String kids_age2;		// 아이가 2명일시 넣는 생년월일
	private char payment_ok; 		// 시급협의 여부 ('N', 'Y')
	private String frequency;		// 스케줄 주기
	
	private char type;			// 맘 or 시터 구분 ('M', 'S')
	private String id;			// 아이디
	private String password;	// 비밀번호
	private String name;		// 이름
	private String email;		// 이메일
	private String phone;		// 연락처
	private String birthdate;	// 생년월일
	private char gender;		// 성별 ('F', 'M')
	private String startdate;	// 이용권 시작 날짜
	private String enddate;		// 이용권 종료 날짜
	private char profile_img;	// 프로필 이미지 ('Y' or 'N')
	private char job_opening;	// 구인구직 여부 ('Y' or 'N')
	private char subscribe;		// 구독중인지 아닌지
	private char ticket_type; 	// 이용권 종류 ('1', '3', '6')
	private String ticket_price;// 이용권 금액
	private String signup_date; // 가입일자
}
