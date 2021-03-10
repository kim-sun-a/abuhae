package study.team.abuhae.controllers;

import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import lombok.extern.slf4j.Slf4j;
import study.team.abuhae.helper.AgeHelper;
import study.team.abuhae.helper.PageData;
import study.team.abuhae.helper.WebHelper;
import study.team.abuhae.model.Heart;
import study.team.abuhae.model.Mom_info;
import study.team.abuhae.model.Sitter_info;
import study.team.abuhae.service.SearchService;

@Slf4j
@RestController

public class SearchRestController {
	/** WebHelper 주입 */
	// --> import org.springframework.beans.factory.annotation.Autowired;
	// --> import study.spring.springhelper.helper.WebHelper;
	@Autowired
	WebHelper webHelper;
	
	/** AgeHelper 주입 */
	@Autowired
	AgeHelper ageHelper;

	/** Service 패턴 구현체 주입 */
	@Autowired
	SearchService searchService;

	
	/** 맘시터 찾기 페이지 */
	// 카드 출력 - 비로그인
	@RequestMapping(value = "/search/sitter_search", method = RequestMethod.GET)
	public Map<String, Object> get_st_list_nologin(
			// 페이지 구현에서 사용할 현재 페이지 번호
			@RequestParam(value = "page", defaultValue = "1") int nowPage,
			// 정렬 조건
			@RequestParam(value = "order", defaultValue = "null") String order,
			/** (1) 원하는 활동 선택 **/
			@RequestParam(value = "actList[]", required = false) String[] actList, 
			/** (2) 상세 검색 **/
			@RequestParam(value = "kidsage[]", required = false) String[] kidsAge,
			@RequestParam(value = "caredays[]", required = false) String[] caredays,
			@RequestParam(value = "sitter_type[]", required = false) String[] sitterType,
			@RequestParam(value = "sitter_age[]", required = false) String[] sitterAge,
			/** (3) 주소 검색 **/
			@RequestParam(value = "si", required = false) String si,
			@RequestParam(value = "gu", required = false) String gu,
			@RequestParam(value = "dong", required = false) String dong
			) {
		
		
		/** 1) 페이지 구현에 필요한 변수값 생성 */
		int totalCount = 0; // 전체 게시글 수
		int listCount = 10; // 한 페이지당 표시할 목록 수
		int pageCount = 5; // 한 그룹당 표시할 페이지 번호 수

		/** 2) 데이터 조회하기 */
		
		// 조회에 필요한 조건값(검색어)를 Beans에 담는다.
		Sitter_info input = new Sitter_info();
		if (si != null && gu != null && dong != null) {
			input.setLoc1(si);
			input.setLoc2(gu);
			input.setLoc3(dong);
		}

		if (actList != null) {
			for (int i = 0; i < actList.length; i++) {
				String temp1 = actList[i];
				String temp2 = temp1.replace("'", "");
				actList[i] = temp2;
				log.info("temp2" + temp2);
			}
			input.setActList(actList);
		}

		if (kidsAge != null) {
			for (int i = 0; i < kidsAge.length; i++) {
				String temp1 = kidsAge[i];
				String temp2 = temp1.replace("'", "");
				kidsAge[i] = temp2;
				log.info("temp2" + temp2);
			}
			input.setKidsAge(kidsAge);
		}

		if (caredays != null) {
			input.setCaredays(caredays);
		}

		if (sitterType != null) {
			input.setSitterType(sitterType);
		}

		if (sitterAge != null) {
			input.setSitterAge(sitterAge);
		}
		

		List<Sitter_info> output = null; // 조회결과가 저장될 객체
		PageData pageData = null; // 페이지 번호를 계산한 결과가 저장될 객체

		try {
			// 전체 게시글 수 조회
			totalCount = searchService.getSitterCount(input);
			// 페이지 번호 계산 --> 계산결과를 로그로 출력될 것이다.
			pageData = new PageData(nowPage, totalCount, listCount, pageCount);

			// SQL의 LIMIT절에서 사용될 값을 Beans의 static 변수에 저장
			Sitter_info.setOffset(pageData.getOffset());
			Sitter_info.setListCount(pageData.getListCount());

			// 정렬조건의 값을 Beans에 저장
			Sitter_info.setOrder(order);

			// 데이터 조회하기
			output = searchService.searchSitter(input);
		} catch (Exception e) {
			return webHelper.getJsonError(e.getLocalizedMessage());
		}

		/** 3) JSON 출력하기 */
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("item", output);
		data.put("meta", pageData);
		data.put("totalCount", totalCount);

		return webHelper.getJsonData(data);
	}
	
	// 카드 출력 - 로그인
	@RequestMapping(value = "/search/sitter_search/login", method = RequestMethod.GET)
	public Map<String, Object> get_st_list(
			// 페이지 구현에서 사용할 현재 페이지 번호
			@RequestParam(value = "page", defaultValue = "1") int nowPage,
			// 정렬 조건
			@RequestParam(value = "order", defaultValue = "null") String order,
			/** (1) 원하는 활동 선택 **/
			@RequestParam(value = "actList[]", required = false) String[] actList, 
			/** (2) 상세 검색 **/
			@RequestParam(value = "kidsage[]", required = false) String[] kidsAge,
			@RequestParam(value = "caredays[]", required = false) String[] caredays,
			@RequestParam(value = "sitter_type[]", required = false) String[] sitterType,
			@RequestParam(value = "sitter_age[]", required = false) String[] sitterAge,
			// 로그인 정보
			@RequestParam(value = "momno", required = false) String momno,
			/** (3) 주소 검색 **/
			@RequestParam(value = "si", required = false) String si,
			@RequestParam(value = "gu", required = false) String gu,
			@RequestParam(value = "dong", required = false) String dong) {

		/** 1) 페이지 구현에 필요한 변수값 생성 */
		int totalCount = 0; // 전체 게시글 수
		int listCount = 10; // 한 페이지당 표시할 목록 수
		int pageCount = 5; // 한 그룹당 표시할 페이지 번호 수

		/** 2) 데이터 조회하기 */
		// 조회에 필요한 조건값(검색어)를 Beans에 담는다.
		Sitter_info input = new Sitter_info();
		if (si != null && gu != null && dong != null) {
			input.setLoc1(si);
			input.setLoc2(gu);
			input.setLoc3(dong);
		}

		if (actList != null) {
			for (int i = 0; i < actList.length; i++) {
				String temp1 = actList[i];
				String temp2 = temp1.replace("'", "");
				actList[i] = temp2;
				log.info("temp2" + temp2);
			}
			input.setActList(actList);
		}

		if (kidsAge != null) {
			for (int i = 0; i < kidsAge.length; i++) {
				String temp1 = kidsAge[i];
				String temp2 = temp1.replace("'", "");
				kidsAge[i] = temp2;
				log.info("temp2" + temp2);
			}
			input.setKidsAge(kidsAge);
		}

		if (caredays != null) {
			input.setCaredays(caredays);
		}

		if (sitterType != null) {
			input.setSitterType(sitterType);
		}

		if (sitterAge != null) {
			input.setSitterAge(sitterAge);
		}
		
		if (momno != null) {
			int mom = Integer.parseInt(momno);
			Sitter_info.setLoginMom(mom);
		}
		
		

		List<Sitter_info> output = null; // 조회결과가 저장될 객체
		PageData pageData = null; // 페이지 번호를 계산한 결과가 저장될 객체

		try {
			// 전체 게시글 수 조회
			totalCount = searchService.getSitterCount(input);
			// 페이지 번호 계산 --> 계산결과를 로그로 출력될 것이다.
			pageData = new PageData(nowPage, totalCount, listCount, pageCount);

			// SQL의 LIMIT절에서 사용될 값을 Beans의 static 변수에 저장
			Sitter_info.setOffset(pageData.getOffset());
			Sitter_info.setListCount(pageData.getListCount());

			// 정렬조건의 값을 Beans에 저장
			Sitter_info.setOrder(order);

			// 데이터 조회하기
			output = searchService.searchSitter(input);
		} catch (Exception e) {
			return webHelper.getJsonError(e.getLocalizedMessage());
		}

		/** 3) JSON 출력하기 */
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("item", output);
		data.put("meta", pageData);
		data.put("totalCount", totalCount);

		return webHelper.getJsonData(data);
	}


	/** 일자리 찾기 페이지 */
	// 일자리 카드 출력 - 비로그인
	@RequestMapping(value = "/search/job_search", method = RequestMethod.GET)
	public Map<String, Object> get_mom_list(
			// 페이지 구현에서 사용할 현재 페이지 번호
			@RequestParam(value = "page", defaultValue = "1") int nowPage,
			// 정렬 조건
			@RequestParam(value = "order", defaultValue = "null") String order, 
			// 상세 검색
			@RequestParam(value = "actList[]", required = false) String[] actList,
			@RequestParam(value = "kidsage[]", required = false) String[] kidsAge,
			@RequestParam(value = "caredays[]", required = false) String[] caredays,
			@RequestParam(value = "min_pay", required = false) String min_pay,
			@RequestParam(value = "max_pay", required = false) String max_pay,
			@RequestParam(value = "kids_cnt", required = false) String kids_cnt,
			// 주소 검색
			@RequestParam(value = "si", required = false) String si,
			@RequestParam(value = "gu", required = false) String gu,
			@RequestParam(value = "dong", required = false) String dong) {

		/** 1) 페이지 구현에 필요한 변수값 생성 */
		int totalCount = 0; // 전체 게시글 수
		int listCount = 10; // 한 페이지당 표시할 목록 수
		int pageCount = 5; // 한 그룹당 표시할 페이지 번호 수

		/** 2) 데이터 조회하기 */
		// 조회에 필요한 조건값(검색어)를 Beans에 담는다.
		Mom_info input = new Mom_info();
		
		if (si != null && gu != null && dong != null) {
			input.setLoc1(si);
			input.setLoc2(gu);
			input.setLoc3(dong);
		}
		
		if (actList != null) {
			for (int i = 0; i < actList.length; i++) {
				String temp1 = actList[i];
				String temp2 = temp1.replace("'", "");
				actList[i] = temp2;
				log.info("temp2" + temp2);
			}
			input.setActList(actList);
		}

		if (kidsAge != null) {
			for (int i = 0; i < kidsAge.length; i++) {
				String temp1 = kidsAge[i];
				String temp2 = temp1.replace("'", "");
				kidsAge[i] = temp2;
				log.info("temp2" + temp2);
			}
			input.setKidsAge(kidsAge);
		}

		if (caredays != null) {
			input.setCaredays(caredays);
		}

		if (min_pay != null) {
			int min = Integer.parseInt(min_pay);
			input.setMin_pay(min);
		}

		if (max_pay != null) {
			int max = Integer.parseInt(max_pay);
			input.setMax_pay(max);
		}

		if (kids_cnt != null) {
			int kids = 0;
			switch(kids_cnt) {
			case "1" :
				kids = Integer.parseInt(kids_cnt);
				break;
			case "2" :
				kids = Integer.parseInt(kids_cnt);
				break;
			default :
				System.out.println("all");
			}
			input.setKids_cnt(kids);
		}
		
		List<Mom_info> output = null; // 조회결과가 저장될 객체
		PageData pageData = null; // 페이지 번호를 계산한 결과가 저장될 객체

		try {
			// 전체 게시글 수 조회
			totalCount = searchService.getMomCount(input);
			// 페이지 번호 계산 --> 계산결과를 로그로 출력될 것이다.
			pageData = new PageData(nowPage, totalCount, listCount, pageCount);

			// SQL의 LIMIT절에서 사용될 값을 Beans의 static 변수에 저장
			Mom_info.setOffset(pageData.getOffset());
			Mom_info.setListCount(pageData.getListCount());

			// 정렬조건의 값을 Beans에 저장
			Mom_info.setOrder(order);

			// 데이터 조회하기
			output = searchService.searchMom(input);

			// 아이 나이 계산 with AgeHelper
			for (int i = 0; i < output.size(); i++) {
				Mom_info temp = output.get(i);
				String age = ageHelper.kidsStr(temp.getKids_age());
				temp.setKids_age(age);
				output.set(i, temp);
			}
			
			// 시작일자 - noplan일시 오늘 날짜를 세팅해준다.
			Calendar date = Calendar.getInstance();
			
			for (int i = 0; i < output.size(); i++) {
				Mom_info temp = output.get(i);
				int yy = date.get(Calendar.YEAR);
				int mm = date.get(Calendar.MONTH) + 1;
				int dd = date.get(Calendar.DAY_OF_MONTH);
				String schedule = String.format("%05d/%02d/%02d", yy, mm, dd);
				if (temp.getSchedule() == null) {
					temp.setSchedule(schedule);
					output.set(i, temp);	
				} else {
					output.set(i, temp);
				}
			}

		} catch (Exception e) {
			return webHelper.getJsonError(e.getLocalizedMessage());
		}

		/** 3) JSON 출력하기 */
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("item", output);
		data.put("meta", pageData);
		data.put("totalCount", totalCount);

		return webHelper.getJsonData(data);
	}
	
	// 일자리 카드 출력 - 로그인
		@RequestMapping(value = "/search/job_search/login", method = RequestMethod.GET)
		public Map<String, Object> get_mom_list(
				// 페이지 구현에서 사용할 현재 페이지 번호
				@RequestParam(value = "page", defaultValue = "1") int nowPage,
				// 정렬 조건
				@RequestParam(value = "order", defaultValue = "null") String order, 
				// 상세 검색
				@RequestParam(value = "actList[]", required = false) String[] actList,
				@RequestParam(value = "kidsage[]", required = false) String[] kidsAge,
				@RequestParam(value = "caredays[]", required = false) String[] caredays,
				@RequestParam(value = "min_pay", required = false) String min_pay,
				@RequestParam(value = "max_pay", required = false) String max_pay,
				@RequestParam(value = "kids_cnt", required = false) String kids_cnt,
				// 로그인 정보
				@RequestParam(value = "sitterno", required = false) String sitterno,
				// 주소 검색
				@RequestParam(value = "si", required = false) String si,
				@RequestParam(value = "gu", required = false) String gu,
				@RequestParam(value = "dong", required = false) String dong) {

			/** 1) 페이지 구현에 필요한 변수값 생성 */
			int totalCount = 0; // 전체 게시글 수
			int listCount = 10; // 한 페이지당 표시할 목록 수
			int pageCount = 5; // 한 그룹당 표시할 페이지 번호 수

			/** 2) 데이터 조회하기 */
			// 조회에 필요한 조건값(검색어)를 Beans에 담는다.
			Mom_info input = new Mom_info();
			
			if (si != null && gu != null && dong != null) {
				input.setLoc1(si);
				input.setLoc2(gu);
				input.setLoc3(dong);
			}
			
			if (actList != null) {
				for (int i = 0; i < actList.length; i++) {
					String temp1 = actList[i];
					String temp2 = temp1.replace("'", "");
					actList[i] = temp2;
					log.info("temp2" + temp2);
				}
				input.setActList(actList);
			}

			if (kidsAge != null) {
				for (int i = 0; i < kidsAge.length; i++) {
					String temp1 = kidsAge[i];
					String temp2 = temp1.replace("'", "");
					kidsAge[i] = temp2;
					log.info("temp2" + temp2);
				}
				input.setKidsAge(kidsAge);
			}

			if (caredays != null) {
				input.setCaredays(caredays);
			}

			if (min_pay != null) {
				int min = Integer.parseInt(min_pay);
				input.setMin_pay(min);
			}

			if (max_pay != null) {
				int max = Integer.parseInt(max_pay);
				input.setMax_pay(max);
			}

			if (kids_cnt != null) {
				int kids = 0;
				switch(kids_cnt) {
				case "1" :
					kids = Integer.parseInt(kids_cnt);
					break;
				case "2" :
					kids = Integer.parseInt(kids_cnt);
					break;
				default :
					System.out.println("all");
				}
				input.setKids_cnt(kids);
			}
			
			if (sitterno != null) {
				int stno = Integer.parseInt(sitterno);
				Mom_info.setLoginSt(stno);
			}

			List<Mom_info> output = null; // 조회결과가 저장될 객체
			PageData pageData = null; // 페이지 번호를 계산한 결과가 저장될 객체

			try {
				// 전체 게시글 수 조회
				totalCount = searchService.getMomCount(input);
				// 페이지 번호 계산 --> 계산결과를 로그로 출력될 것이다.
				pageData = new PageData(nowPage, totalCount, listCount, pageCount);

				// SQL의 LIMIT절에서 사용될 값을 Beans의 static 변수에 저장
				Mom_info.setOffset(pageData.getOffset());
				Mom_info.setListCount(pageData.getListCount());

				// 정렬조건의 값을 Beans에 저장
				Mom_info.setOrder(order);

				// 데이터 조회하기
				output = searchService.searchMom(input);

				// 아이 나이 계산 with AgeHelper
				for (int i = 0; i < output.size(); i++) {
					Mom_info temp = output.get(i);
					String age = ageHelper.kidsStr(temp.getKids_age());
					temp.setKids_age(age);
					output.set(i, temp);
				}
				
				// 시작일자 - noplan일시 오늘 날짜를 세팅해준다.
				Calendar date = Calendar.getInstance();
				
				for (int i = 0; i < output.size(); i++) {
					Mom_info temp = output.get(i);
					int yy = date.get(Calendar.YEAR);
					int mm = date.get(Calendar.MONTH) + 1;
					int dd = date.get(Calendar.DAY_OF_MONTH);
					String schedule = String.format("%05d/%02d/%02d", yy, mm, dd);
					if (temp.getSchedule() == null) {
						temp.setSchedule(schedule);
						output.set(i, temp);	
					} else {
						output.set(i, temp);
					}
				}

			} catch (Exception e) {
				return webHelper.getJsonError(e.getLocalizedMessage());
			}

			/** 3) JSON 출력하기 */
			Map<String, Object> data = new HashMap<String, Object>();
			data.put("item", output);
			data.put("meta", pageData);
			data.put("totalCount", totalCount);

			return webHelper.getJsonData(data);
		}
		

		// 시터 찜하기
		@RequestMapping(value = "/heart/insertSt", method = RequestMethod.GET)
		public Map<String, Object> heartSt(/** (3) 찜하기 */
		@RequestParam(value = "sitterno", required = false) String sitterno,
				@RequestParam(value = "momno", required = false) String momno,
				@RequestParam(value = "jjim", required = false) String jjim) {

			// 찜하기
			// 데이터를 전송할 객체 생성
			Heart heart = new Heart();
			int stno = Integer.parseInt(sitterno);
			int mono = Integer.parseInt(momno);

			heart.setMomno(mono);
			heart.setSitterno(stno);
			heart.setWho('M');
			int findHt = 0;
			try {
				searchService.addHeart(heart);
			} catch (Exception e) {
				return webHelper.getJsonError(e.getLocalizedMessage());
			}

			/** 3) JSON 출력하기 */
			Map<String, Object> data = new HashMap<String, Object>();
			data.put("heart", findHt);

			return webHelper.getJsonData(data);
		}

		// 찜하기 취소
		@RequestMapping(value = "/heart/deleteSt", method = RequestMethod.GET)
		public Map<String, Object> heartNoSt(
				/** (3) 찜하기 */
				@RequestParam(value = "sitterno", required = false) String sitterno,
				@RequestParam(value = "momno", required = false) String momno) {

			// 찜하기 취소
			// 데이터를 전송할 객체 생성
			Heart heart = new Heart();
			int stno = Integer.parseInt(sitterno);
			int mono = Integer.parseInt(momno);

			heart.setMomno(mono);
			heart.setSitterno(stno);
			heart.setWho('M');
			try {
				searchService.deleteHeart(heart);
			} catch (Exception e) {
				return webHelper.getJsonError(e.getLocalizedMessage());
			}

			/** 3) JSON 출력하기 */
			Map<String, Object> data = new HashMap<String, Object>();
			data.put("heart", heart);

			return webHelper.getJsonData(data);
		}

	// 일자리 찜하기
	@RequestMapping(value = "/heart/insertMom", method = RequestMethod.GET)
	public Map<String, Object> heartMom(/** (3) 찜하기 */
	@RequestParam(value = "sitterno", required = false) String sitterno,
			@RequestParam(value = "momno", required = false) String momno,
			@RequestParam(value = "jjim", required = false) String jjim) {

		// 찜하기
		// 데이터를 전송할 객체 생성
		Heart heart = new Heart();
		int stno = Integer.parseInt(sitterno);
		int mono = Integer.parseInt(momno);

		heart.setMomno(mono);
		heart.setSitterno(stno);
		heart.setWho('S');
		try {

			searchService.addHeart(heart);

		} catch (Exception e) {
			return webHelper.getJsonError(e.getLocalizedMessage());
		}

		/** 3) JSON 출력하기 */
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("heart", heart);

		return webHelper.getJsonData(data);
	}

	// 찜하기 취소
	@RequestMapping(value = "/heart/deleteMom", method = RequestMethod.GET)
	public Map<String, Object> heartNoMom(
			/** (3) 찜하기 */
			@RequestParam(value = "sitterno", required = false) String sitterno,
			@RequestParam(value = "momno", required = false) String momno) {

		// 찜하기 취소
		// 데이터를 전송할 객체 생성
		Heart heart = new Heart();
		int stno = Integer.parseInt(sitterno);
		int mono = Integer.parseInt(momno);

		heart.setMomno(mono);
		heart.setSitterno(stno);
		heart.setWho('S');
		try {
			searchService.deleteHeart(heart);
		} catch (Exception e) {
			return webHelper.getJsonError(e.getLocalizedMessage());
		}

		/** 3) JSON 출력하기 */
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("heart", heart);

		return webHelper.getJsonData(data);
	}
}
