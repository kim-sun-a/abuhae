package study.team.abuhae.service;

import java.util.List;

import study.team.abuhae.model.Connect;
import study.team.abuhae.model.Coupon;
import study.team.abuhae.model.Heart;
import study.team.abuhae.model.Mom_info;
import study.team.abuhae.model.Report;
import study.team.abuhae.model.Review;
import study.team.abuhae.model.Sitter_info;

public interface SitterMypageService {
   /** 마이페이지 회원 데이터 상세 조회 */
   public Sitter_info getSitterItem(Sitter_info input) throws Exception;
   
   /** 구직 중 클릭시 지원시간 업데이트 */
   public int editSitterOpeningDate(Sitter_info input) throws Exception;
   
   /** 찜한 회원 목록 조히 */
   public List<Heart> getSitterHeartList(Heart input) throws Exception;
   
   /** 찜한 횟수 조회 */
   public int getSitterHeartCount(Sitter_info input) throws Exception;
   
   /** 채용 내역 조회 */
   public List<Connect> getSitterWorkList(Connect input) throws Exception;
   
   /** 채용 횟수 조회 */
   public int getSitterWorkCount(Sitter_info input) throws Exception;
   
   /** 신고 내역 조회 */
   public List<Report> getSitterReprotList(Report input) throws Exception;
   
   /** 신고 횟수 조회 */
   public int getSitterReportCount(Sitter_info input) throws Exception;
   
   /** 내게 지원한 부모회원 목록 조회 */
   public List<Connect> getConnectList(Connect input) throws Exception;
   
   /** 내가 지원한 부모회원 목록 조회 */
   public List<Connect> getSitterApplyList(Connect input) throws Exception;
   
   /** 인터뷰 요청에 대한 수락 / 거절 여부 업데이트 */
   public int editAccept(Connect input) throws Exception;
   
   /** accept가 'Y'일 경우 review 저장 */
   public int addReview(Review input) throws Exception;

   /** 남겨진 리뷰 조회 */
   public List<Review> getSitterReviewList(Review input) throws Exception;
   
   //비밀번호 조회
 	public int bigyoSitterPassword(Sitter_info input) throws Exception;
 	
 	//비밀번호 수정
 	public int updatSitterePassword(Sitter_info input) throws Exception;
 	
 	// 시터 멤버 회원 조회
 	public Sitter_info getSitterMember(Sitter_info input) throws Exception;
 	
 	/** 회원 휴대폰번호 수정 */
	public int editSitterPhone(Sitter_info input) throws Exception;
	
	/** 회원 이메일 수정 */
	public int editSitterEmail(Sitter_info input) throws Exception;
	
	/** 선호하는 활동 수정 */
	public int updateFavoriteact(Sitter_info input) throws Exception;
	
	/** 돌봄 연령대 수정 */
	public int updateWantage(Sitter_info input) throws Exception;
	
	/** 돌봄 활동 수정 */
	public int updateWantact(Sitter_info input) throws Exception;

	/** 활동 스케쥴 수정 */
	public int updateSchedule(Sitter_info input) throws Exception;
	
	/** 시급 수정 */
	public int updatePayment(Sitter_info input) throws Exception;

	/** 자기소개 수정 */
	public int updateIntoroduce(Sitter_info input) throws Exception;
	
	/** 지역 수정 */
	public int updateLocation(Sitter_info input) throws Exception;
	
	/** 탈퇴 */
	 public Sitter_info getSitterAccountItem(Sitter_info input) throws Exception;
}