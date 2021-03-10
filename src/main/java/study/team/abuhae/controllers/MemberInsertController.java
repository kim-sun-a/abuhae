package study.team.abuhae.controllers;

import java.util.Arrays;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import study.team.abuhae.helper.AgeHelper;
import study.team.abuhae.model.Connect;
import study.team.abuhae.model.Mom_info;
import study.team.abuhae.model.ResiCert;
import study.team.abuhae.model.Review;
import study.team.abuhae.model.Sitter_info;
import study.team.abuhae.service.MemberInsertService;

@Controller
public class MemberInsertController {
	/** Service 패턴 구현체 주입 */
	@Autowired
	MemberInsertService memberInsertService;

	public int random(int n1, int n2) {
		int a = (int) ((Math.random() * (n2 - n1 + 1)) + n1);
		return a;
	}

	/**
	 * 멤버를 DB에 추가하는 컨트롤러 2021-02-04 하리 
	 * 따로 view가 없습니다. 
	 * 프로젝트 실행하고 value 안 url 주소창에 입력하여 추가하세요.
	 **/
	@RequestMapping(value = "/member_insert.do", method = RequestMethod.GET)
	public void member_insert(Model model) {
		// 다양한 검색 결과를 보여주기 위해 만든 배열

		/** 공통 */
		// 프로필 업데이트 날짜 및 시간 출력을 위한 값

		// 다양한 주소 출력을 위한 값
		String loc[] = { "역삼동", "개포동", "청담동", "삼성동", "대치동", "신사동", "논현동", "압구정동", "세곡동", "자곡동", "율현동", "일원동", "수서동",
				"도곡동" };

		// 스케줄
		String[] days = { "mon", "tue", "wed", "thu", "fri", "sat", "sun" };
		String[] frequency = { "regular", "shortTerm", "noplan" };
		String[] wanttime = {"wek_morning","wek_launch","wek_evning","end_morning","end_launch","end_evning"};

		// 원하는 활동
		String[] acts = { "innerplay", "guide", "read", "outside", "korean", "english", "study", "sport",
				"simple_cleaning", "eat", "do_dish", "long_move_in", "short_move_in" };

		String[] age = { "got_baby", "baby", "children", "element" };


		// 저장할 값들을 Beans에 담는다.
		Mom_info input = new Mom_info();

		for (int i = 1; i <= 100; i++) {
			input.setType('M');
			input.setId("mom" + i);
			input.setPassword("mom123");
			input.setName("전하리" + i);
			input.setEmail("aaa@aaa.aa");
			input.setPhone("01088888888");
			input.setBirthdate("1997-06-18");
			input.setGender('F');
			input.setJob_opening('Y');

			// 원하는 활동
			String wantact1 = new String(acts[random(0, 3)]);
			String wantact2 = new String(acts[random(4, 9)]);
			String wantact3 = new String(acts[random(10, 12)]);
			
			input.setWant_act1(wantact1);
			input.setWant_act2(wantact2);
			input.setWant_act3(wantact3);

			// 0307 지우 - '대' 제거
			input.setWant_age("20");
			input.setKids_num(random(1, 2));

			// 아이 나이 랜덤입력
			int birthYear = random(1, 9);
			int birthMonth = random(1, 12);
			input.setKids_age("201" + birthYear + String.format("%02d", birthMonth));
			AgeHelper ageHelper = new AgeHelper();
			String nai = ageHelper.kidsEng(input.getKids_age());
			String nai2 = "";

			if (input.getKids_num() == 2) {
				birthYear = random(1, 9);
				birthMonth = random(1, 12);
				input.setKids_age2("201" + birthYear + String.format("%02d", birthMonth));
				nai2 = ageHelper.kidsEng(input.getKids_age2());
			}
			
			input.setKids_nai(nai);
			input.setKids_nai2(nai2);

			// 시급 랜덤입력
			int payment = random(9000, 20000);
			input.setPayment(payment);

			input.setPayment_ok('Y');
			input.setSi("서울특별시");
			input.setGu("강남구");
			// 동 랜덤입력
			input.setDong(loc[random(0, loc.length - 1)]);

			// 스케줄 랜덤입력
			// 가능한 요일
			String dayOk[] = new String[3];
			dayOk[0] = "\"" + days[random(0, 2)] + "\"";
			dayOk[1] = "\"" + days[random(3, 4)] + "\"";
			dayOk[2] = "\"" + days[random(5, 6)] + "\"";
			String wanttimeok[] = new String[2];
			wanttimeok[0] = "\"" + wanttime[random(0, 2)] + "\"";
			wanttimeok[1] = "\"" + wanttime[random(3, 5)] + "\"";

			// 프로필 업데이트 및 스케줄 날짜 랜덤입력
			int day = random(1, 28);
			int hour = random(1, 12);
			int minsec = random(1, 59);
			
			String freq = frequency[random(0, frequency.length - 1)];
			
			if (freq == "regular") {
				input.setSchedule("{\"day\":" + Arrays.toString(dayOk) + ", \"frequency\": \""
						+ freq + "\", \"startdate\": \""
						+ String.format("%02d/%02d/%02d", 2021, 03, random(1, 31)) + "\"}");
			}
			
			if (freq == "shortTerm") {
				input.setSchedule("{\"frequency\": \""+ freq
						+ "\", \"startdate\": \""+ String.format("%02d/%02d/%02d", 2021, 03, random(1, 31)) + "\"}");
			}
			
			if (freq == "noplan") {
				input.setSchedule("{\"wanttime\":" + Arrays.toString(wanttimeok) + ", \"frequency\": \""
						+ freq + "\"}");
			}

			
			input.setSchedule_ok('Y');
			input.setSitter_gender('F');
			input.setCare_type("이모님(도우미)과 함께 도와주세요.");

			// 프로필 업데이트 날짜 랜덤입력
			String date = String.format("%02d-%02d %02d:%02d:%02d", 2, day, hour, minsec, minsec);
			String openingdate = "2021-" + date;
			input.setOpeningdate(openingdate);
			input.setSignup_date(openingdate);
			input.setSubscribe('N');

			int memberno = input.getMemberno();
			input.setMemberno(memberno);

			try {
				// 데이터 저장 --> 데이터 저장에 성공하면 파라미터로 전달하는 input 객체에 PK값이 저장된다.
				memberInsertService.addMom(input);
			} catch (Exception e) {
				e.printStackTrace();
			}

		}
		// 저장할 값들을 Beans에 담는다.
		Sitter_info input2 = new Sitter_info();

		for (int i = 1; i <= 100; i++) {
			input2.setType('S');
			input2.setId("sitter" + i);
			input2.setPassword("sitter123");
			input2.setName("김선아" + i);
			input2.setEmail("bbb@aaa.aa");
			input2.setPhone("01088888888");
			input2.setBirthdate("19" + String.format("%02d-%02d-%02d", random(70, 95), random(1, 12), random(1, 28)));
			input2.setGender('F');
			input2.setJob_opening('Y');

			// 시터 유형 랜덤입력
			String[] stType = { "student", "mom", "teacher", "normal" };
			input2.setSitter_type(stType[random(0, stType.length - 1)]);

			// 가능한 돌봄유형
			// 원하는 활동
			String wantact1 = new String(acts[random(0, 3)]);
			String wantact2 = new String(acts[random(4, 9)]);
			String wantact3 = new String(acts[random(10, 12)]);
			
			input2.setWant_act1(wantact1);
			input2.setWant_act2(wantact2);
			input2.setWant_act3(wantact3);

			input2.setWant_age(age[random(0, age.length - 1)]);

			// 시급 랜덤입력
			int payment = random(9000, 20000);

			input2.setPayment(payment);
			input2.setSi("서울특별시");
			input2.setGu("강남구");
			// 동 랜덤입력
			input2.setDong(loc[random(0, loc.length - 1)]);

			// 스케줄 랜덤입력
			// 가능한 요일
			String dayOk[] = new String[3];
			dayOk[0] = "\"" + days[random(0, 2)] + "\"";
			dayOk[1] = "\"" + days[random(3, 4)] + "\"";
			dayOk[2] = "\"" + days[random(5, 6)] + "\"";
			// 프로필 업데이트 및 스케줄 날짜 랜덤입력
			int day = random(1, 28);
			int hour = random(1, 12);
			int minsec = random(1, 59);

			input2.setSchedule("{\"day\":" + Arrays.toString(dayOk) + ", \"frequency\": \""
					+ frequency[random(0, frequency.length - 1)] + "\", \"startdate\": \""
					+ String.format("%02d/%02d/%02d", 2021, 03, random(1, 31)) + "\"}");
			input2.setIntroduce("안녕하세요 짱짱 시터입니다.");
			input2.setCctv('Y');

			// 프로필 업데이트 날짜 랜덤입력
			String date = String.format("%02d-%02d %02d:%02d:%02d", 2, day, hour, minsec, minsec);
			String openingdate = "2021-" + date;
			input2.setOpeningdate(openingdate);

			int memberno2 = input2.getMemberno();
			input2.setMemberno(memberno2);
			input2.setSignup_date(openingdate);
			input2.setSubscribe('N');

			try {
				// 데이터 저장 --> 데이터 저장에 성공하면 파라미터로 전달하는 input 객체에 PK값이 저장된다.
				memberInsertService.addSitter(input2);
			} catch (Exception e) {
				e.printStackTrace();
			}

		}

	}

	// 응답률 더미
	@RequestMapping(value = "/revrate_insert.do", method = RequestMethod.GET)
	public void revrate_insert(Model model) {
		Connect accept = new Connect();

		String[] accepts = { "Y", "N", null };

		// 응답률 랜덤입력
		for (int j = 0; j < 50; j++) {
			accept.setWho("m");
			accept.setSitterno(random(1, 100));
			accept.setAccept(accepts[random(0, 2)]);
			accept.setMomno(random(1, 100));

			try {
				memberInsertService.AcceptInsert(accept);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	// 맘에게 지원한 시터수 더미
	@RequestMapping(value = "/acepcount_insert.do", method = RequestMethod.GET)
	public void acepcount_insert(Model model) {
		Connect applySt = new Connect();
		Review review = new Review();
		Connect output = new Connect();
		
		char[] rev = { '0', '1', '2', '3', '4', '5' };

		// 맘에게 지원한 시터 수 랜덤 입력
		for (int j = 0; j < 50; j++) {
			applySt.setWho("s");
			applySt.setMomno(random(1, 100));
			applySt.setSitterno(random(1, 100));
			
			try {
				output = memberInsertService.getConnect(applySt);
			} catch (Exception e1) {
				e1.printStackTrace();
			}
	
			if (output.getAccept() == "Y") {
				try {
					memberInsertService.applyStInsert(applySt);
					memberInsertService.reviewInsert(review);
				} catch (Exception e) {
					e.printStackTrace();
				}

			}
			
		}
		
		// 리뷰 및 별점 랜덤 입력
		for (int j = 0; j < 50; j++) {
			review.setRev_rate(rev[random(0, rev.length - 1)]);
			review.setContents("리뷰더미");
			review.setSitterno(random(1, 100));
			review.setMomno(random(1, 100));
			review.setCntno(applySt.getCntno());
			try {
				memberInsertService.applyStInsert(applySt);
				memberInsertService.reviewInsert(review);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

}
