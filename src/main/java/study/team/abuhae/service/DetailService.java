package study.team.abuhae.service;



import java.util.List;

import study.team.abuhae.model.Connect;
import study.team.abuhae.model.Heart;
import study.team.abuhae.model.Mom_info;
import study.team.abuhae.model.Report;
import study.team.abuhae.model.Review;
import study.team.abuhae.model.Sitter_info;

public interface DetailService {
	
	// 시터 상세페이지 
	public Sitter_info getSitterItem(Sitter_info input) throws Exception;
		
	public int editSitter(Sitter_info input) throws Exception;
	
	public int addSitter(Sitter_info input) throws Exception;
	
	public Sitter_info getWantAge(Sitter_info input) throws Exception;
	
	// 맘 상세페이지 
	public Mom_info getMomItem(Mom_info input) throws Exception;
	
	// 신고페이지
	public int addReport(Report input) throws Exception;
	
	//public Mom_info SelectReport(Mom_info momput) throws Exception;
	
	// 찜하기
	public int addHeart(Heart input) throws Exception;
		
	// 찜하기 취소
	public int deleteHeart(Heart input) throws Exception;
	
	// 찜 여부 조회(찜 버튼용)
	public int findHeart(Heart input) throws Exception;
	
	public int addConnect(Connect input) throws Exception;
	
	//맘시터 회원 조회
	public Mom_info getMomMember(Mom_info input) throws Exception;
		
	//시터회원 회원 조회
	public Sitter_info getSitterMember(Sitter_info input) throws Exception;
	
	// 리뷰 최근 3개만 조회
	public List<Review> getReviewList(Review input) throws Exception;
	
	// 리뷰 전체 조회
	public List<Review> getReviewListTotal(Review input) throws Exception;

}
