package study.team.abuhae.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import study.team.abuhae.model.Admin_info;
import study.team.abuhae.model.Coupon;
import study.team.abuhae.model.Cus_bbs;
import study.team.abuhae.model.Cus_category;
import study.team.abuhae.model.Cus_sub_category;
import study.team.abuhae.model.Leave_member;
import study.team.abuhae.model.Mom_info;
import study.team.abuhae.model.Report;
import study.team.abuhae.model.Sitter_info;
import study.team.abuhae.service.AdminService;

@Slf4j
@Service
public class AdminServiceImpl implements AdminService {
	//mybatis 세션 객체 주입 설정
	@Autowired
	SqlSession sqlsession;
	
	/*
	 * 관리자 로그인 기능
	 */
	@Override
	public Admin_info getAdminLogin(Admin_info input) throws Exception {
		Admin_info result = null;
		
		try {
			result = sqlsession.selectOne("AdminMapper.selectIDItem", input);
			
			//조회결과 없음
			if(result == null) {
				throw new NullPointerException("result=null");
			}
			
			//반환받은 객체가 null이 아니고, 패스워드가 같다면 로그인 성공으로 침
			if(result != null && result.getAdminpw().equals(input.getAdminpw())) {
				return result;
			} else {
				//일치하는 정보가 없다면 null 리턴
				return null;
			}
			
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
	}
	
	//========== 신고 회원 목록 조회 =================
	@Override
	public List<Mom_info> getReportList(Report input) throws Exception {
		List<Mom_info> result = null;
		
		try {
			result = sqlsession.selectList("AdminMapper.selectSingoList", input);
			
			//조회결과 없음
			if(result == null) {
				throw new NullPointerException("result=null");
			}
			
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		
		return result;
	}

	@Override
	public int getReportCount(Report input) throws Exception {
		int result = 0;
		try {
			result = sqlsession.selectOne("AdminMapper.selectCountReport", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		return result;
	}


	@Override
	public int updateReportMember(Mom_info input) throws Exception {
		int result = 0;
		
		try {
			result = sqlsession.update("AdminMapper.updateSingoMember", input);
			
			if (result==0) {
				throw new NullPointerException("result=0");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("수정된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 수정에 실패했습니다.");
		}
		return result;
	}

	
	//=========탈퇴회원 조회==============
	@Override
	public List<Leave_member> getLeaveList(Leave_member input) throws Exception {
		List<Leave_member> result = null;
		try {
			result = sqlsession.selectList("AdminMapper.selectLeaveMember", input);
			
			//조회결과 없음
			if(result == null) {
				throw new NullPointerException("result=null");
			}
			
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		
		return result;
	}

	@Override
	public int getLeaveCount(Mom_info input) throws Exception {
		int result = 0;
		try {
			result = sqlsession.selectOne("AdminMapper.selectCountLeaveMember", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		return result;
	}
	
	@Override
	public int getLeaveSitterCount(Sitter_info input) throws Exception {
		int result = 0;
		try {
			result = sqlsession.selectOne("AdminMapper.selectCountLeaveMember", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		return result;
	}
	
	@Override
	public int deleteLeaveMember(Mom_info input) throws Exception {
		int result = 0;
		
		try {

			//탈퇴 처리 날짜 업데이트
			result = sqlsession.update("AdminMapper.updateLeaveDate", input);
			if(input.getType() == 'M') {
				//찜하기 삭제
				result = sqlsession.delete("MemberMapper.heartDelete", input);
				//신고 삭제
				result = sqlsession.delete("MemberMapper.reportDelete", input);
				//지원내역 삭제
				result = sqlsession.delete("MemberMapper.connectDelete", input);
				//리뷰 삭제
				result = sqlsession.delete("MemberMapper.reviewtDelete", input);
				//쿠폰삭제
				result = sqlsession.delete("MemberMapper.couponDelete", input);
				//프로필이미지 삭제
				result = sqlsession.delete("MemberMapper.profimgDelete", input);
				//mominfo 삭제
				result = sqlsession.delete("MemberMapper.mominfoDelete", input);
				//member 삭제
				result = sqlsession.delete("MemberMapper.memberDelete", input);
			} else {
				//찜하기 삭제
				result = sqlsession.delete("MemberMapper.heartDelete", input);
				//신고 삭제
				result = sqlsession.delete("MemberMapper.reportDelete", input);
				//지원내역 삭제
				result = sqlsession.delete("MemberMapper.connectDelete", input);
				//리뷰 삭제
				result = sqlsession.delete("MemberMapper.reviewtDelete", input);
				//쿠폰삭제
				result = sqlsession.delete("MemberMapper.couponDelete", input);
				//프로필이미지 삭제
				result = sqlsession.delete("MemberMapper.profimgDelete", input);
				//시터 인증 삭제
				result = sqlsession.delete("MemberMapper.resicertDelete", input);
				//sitterinfo 삭제
				result = sqlsession.delete("MemberMapper.sitterinfoDelete", input);
				//member 삭제
				result = sqlsession.delete("MemberMapper.memberDelete", input);
			}
			
			
			if (result==0) {
				throw new NullPointerException("result=0");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("수정된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 수정에 실패했습니다.");
		}
		return result;
	}
	
	
	
	//=======이용권 회원 조회 ============
	@Override
	public List<Mom_info> getSubList(Mom_info input) throws Exception {
		List<Mom_info> result = null;
		try {
			result = sqlsession.selectList("AdminMapper.selectSubMember", input);
			
			//조회결과 없음
			if(result == null) {
				throw new NullPointerException("result=null");
			}
			
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		
		return result;
	}

	@Override
	public int getSubCount(Mom_info input) throws Exception {
		int result = 0;
		try {
			result = sqlsession.selectOne("AdminMapper.selectCountSubMember", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		return result;
	}
	
	@Override
	public int getHasCopItem(Coupon input) throws Exception {
		int result = 0;
		try {
			result = sqlsession.selectOne("AdminMapper.selectCountHasCopItem", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		return result;
	}

	@Override
	public int addCoupon(Coupon input) throws Exception {
		int result = 0;
		try {
			result = sqlsession.insert("AdminMapper.addCoupon", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 입력에 실패했습니다.");
		}
		return result;
	}
	
	@Override
	public int addCoupon2(Coupon input) throws Exception {
		int result = 0;
		try {
			result = sqlsession.insert("AdminMapper.addCoupon2", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 입력에 실패했습니다.");
		}
		return result;
	}
	
	//================고객센터 글쓰기================

	@Override
	public List<Cus_category> getCategory() throws Exception {
		List<Cus_category> result = null;
		try {
			result = sqlsession.selectList("CustomerAdMapper.selectCategoryList");
			
			//조회결과 없음
			if(result == null) {
				throw new NullPointerException("result=null");
			}
			
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		
		return result;
	}
	
	@Override
	public Cus_category getCategoryItem(Cus_bbs input) throws Exception {
		Cus_category result = new Cus_category();
		try {
			result = sqlsession.selectOne("CustomerAdMapper.selectCategoryItem", input);
			
			//조회결과 없음
			if(result == null) {
				throw new NullPointerException("result=null");
			}
			
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		
		return result;
	}


	@Override
	public List<Cus_sub_category> getSubCategory() throws Exception {
		List<Cus_sub_category> result = null;
		try {
			result = sqlsession.selectList("CustomerAdMapper.selectCategorySubList");
			
			//조회결과 없음
			if(result == null) {
				throw new NullPointerException("result=null");
			}
			
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		
		return result;
	}

	@Override
	public int addBoard(Cus_bbs input) throws Exception {
		int result =0;
		
		try {
			result = sqlsession.insert("CustomerAdMapper.addCumtomer", input);
			if (result==0) {
				throw new NullPointerException("result=0");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("작성된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 작성에 실패했습니다.");
		}
		
		return result;
	}

	@Override
	public List<Cus_bbs> getBoardList(Cus_bbs input) throws Exception {
		List<Cus_bbs> result = null;
		try {
			result = sqlsession.selectList("CustomerAdMapper.selectBoardList", input);
			
			//조회결과 없음
			if(result == null) {
				throw new NullPointerException("result=null");
			}
			
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		
		return result;
	}

	@Override
	public int getboardCount(Cus_bbs input) throws Exception {
		int result = 0;
		try {
			result = sqlsession.selectOne("CustomerAdMapper.countBorad", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		return result;
	}

	@Override
	public int editBoard(Cus_bbs input) throws Exception {
		int result =0;
		
		try {
			result = sqlsession.update("CustomerAdMapper.updateBoard", input);
			if (result==0) {
				throw new NullPointerException("result=0");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("작성된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 작성에 실패했습니다.");
		}
		
		return result;
	}

	@Override
	public int deleteBoard(Cus_bbs input) throws Exception {
		int result =0;
		
		try {
			result = sqlsession.delete("CustomerAdMapper.deleteBoard", input);
			if (result==0) {
				throw new NullPointerException("result=0");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("작성된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 작성에 실패했습니다.");
		}
		
		return result;
	}

}
