package study.team.abuhae.controllers;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import lombok.extern.slf4j.Slf4j;
import study.team.abuhae.helper.WebHelper;
import study.team.abuhae.model.Heart;
import study.team.abuhae.service.DetailService;
import study.team.abuhae.service.SearchService;

@Slf4j
@RestController
public class Page_DetailRestController {
	/** WebHelper 주입 */
    // --> import org.springframework.beans.factory.annotation.Autowired;
    // --> import study.spring.springhelper.helper.WebHelper;
    @Autowired  WebHelper webHelper;
    
	/** Service 패턴 구현체 주입 */
	@Autowired
	DetailService detailService;
	/** Service 패턴 구현체 주입 */
	@Autowired
	SearchService searchService;
	
	/** "/프로젝트이름"에 해당하는 ContextPath 변수 주입 */
	@Value("#{servletContext.contextPath}")
	String contextPath;
	
	// 일자리 찜하기
		@RequestMapping(value = "/heart/detail/insertMom", method = RequestMethod.GET)
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
		@RequestMapping(value = "/heart/detail/deleteMom", method = RequestMethod.GET)
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
			
			// 시터 찜하기
			@RequestMapping(value = "/heart/detail/insertSt", method = RequestMethod.GET)
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
			@RequestMapping(value = "/heart/detail/deleteSt", method = RequestMethod.GET)
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
}
