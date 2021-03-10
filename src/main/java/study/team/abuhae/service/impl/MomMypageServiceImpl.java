package study.team.abuhae.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import study.team.abuhae.helper.MailHelper;
import study.team.abuhae.model.Connect;
import study.team.abuhae.model.Coupon;
import study.team.abuhae.model.Heart;
import study.team.abuhae.model.Leave_member;
import study.team.abuhae.model.Mom_info;
import study.team.abuhae.model.Report;
import study.team.abuhae.model.Review;
import study.team.abuhae.service.MomMypageService;

@Slf4j
@Service
public class MomMypageServiceImpl implements MomMypageService {
   // mybatis 세션 객체 주입 설정
   @Autowired
   SqlSession sqlSession;
   // mailhelper 주입
   @Autowired
   MailHelper mailhelper;
   // Service 객체 주입
   MomMypageService momMypageService;

   @Override
   public Mom_info getMemberItem(Mom_info input) throws Exception {
      Mom_info result = null;

      try {
         result = sqlSession.selectOne("MomMypageMapper.selectMomItem", input);

         if (result == null) {
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
   
   /** 구인중/구직중 업데이트 */
	@Override
	public int editMomJobOpening(Mom_info input) throws Exception {
		 int result = 0;

	      try {
	         result = sqlSession.update("MomMypageMapper.updateJobOpening", input);

	         if (result == 0) {
	            throw new NullPointerException("result = 0");
	         }
	      } catch (NullPointerException e) {
	         log.error(e.getLocalizedMessage());
	         throw new Exception("수정된 데이터가 없습니다.");
	      } catch (Exception e) {
	         throw new Exception("데이터 수정에 실패했습니다.");
	      }
	      return result;
	}
	
	/** 구인 날짜 업데이트 */
	@Override
	public int editMomOpeningDate(Mom_info input) throws Exception {
		int result = 0;

	      try {
	         result = sqlSession.update("MomMypageMapper.updateOpeningDate", input);

	         if (result == 0) {
	            throw new NullPointerException("result = 0");
	         }
	      } catch (NullPointerException e) {
	         log.error(e.getLocalizedMessage());
	         throw new Exception("수정된 데이터가 없습니다.");
	      } catch (Exception e) {
	         throw new Exception("데이터 수정에 실패했습니다.");
	      }
	      return result;
	}

   /** 리뷰 수정 기능 (view에서는 리뷰 insert 기능처럼 보여짐) */
   @Override
   public int editReview(Review input) throws Exception {
      int result = 0;

      try {
         result = sqlSession.update("ReviewMapper.editReview", input);

         if (result == 0) {
            throw new NullPointerException("result = 0");
         }
      } catch (NullPointerException e) {
         log.error(e.getLocalizedMessage());
         throw new Exception("수정된 데이터가 없습니다.");
      } catch (Exception e) {
         throw new Exception("데이터 수정에 실패했습니다.");
      }
      return result;
   }

   /** 후기 작성할 수 있는 회원 목록 조회 (조건: 매칭성공) */
   @Override
   public List<Review> getReviewMemberList(Review input) throws Exception {
      List<Review> result = null;

      try {
         result = sqlSession.selectList("ReviewMapper.selectMReviewMemberList", input);

         if (result == null) {
            throw new NullPointerException("result=null");
         }
      } catch (NullPointerException e) {
         log.error(e.getLocalizedMessage());
         throw new Exception("조회된 회원이 없습니다.");
      } catch (Exception e) {
         log.error(e.getLocalizedMessage());
         throw new Exception("데이터 조회에 실패했습니다.");
      }
      return result;
   }

   /** 작성한 후기 목록 조회 기능 */
   @Override
   public List<Review> getReviewList(Review input) throws Exception {
      List<Review> result = null;

      try {
         result = sqlSession.selectList("ReviewMapper.selectReviewList", input);

         if (result == null) {
            throw new NullPointerException("result=null");
         }
      } catch (NullPointerException e) {
         log.error(e.getLocalizedMessage());
         throw new Exception("조회된 회원이 없습니다.");
      } catch (Exception e) {
         log.error(e.getLocalizedMessage());
         throw new Exception("데이터 조회에 실패했습니다.");
      }
      return result;
   }
   
   /** 구인 현황 */
	@Override
	public List<Connect> getMomOutputApplyList(Connect input) throws Exception {
		 List<Connect> result = null;

	      try {
	         result = sqlSession.selectList("ConnectMapper.selectMomOutputApplyList", input);

	         if (result == null) {
	            throw new NullPointerException("result=null");
	         }
	      } catch (NullPointerException e) {
	         log.error(e.getLocalizedMessage());
	         throw new Exception("조회된 회원이 없습니다.");
	      } catch (Exception e) {
	         log.error(e.getLocalizedMessage());
	         throw new Exception("데이터 조회에 실패했습니다.");
	      }
	      return result;
	}
	
	@Override
	public List<Connect> getMomInputApplyList(Connect input) throws Exception {
		 List<Connect> result = null;

	      try {
	         result = sqlSession.selectList("ConnectMapper.selectMomInputApplyList", input);
	      } catch (NullPointerException e) {
	         log.error(e.getLocalizedMessage());
	         throw new Exception("조회된 회원이 없습니다.");
	      } catch (Exception e) {
	         log.error(e.getLocalizedMessage());
	         throw new Exception("데이터 조회에 실패했습니다.");
	      }
	      return result;
	}

   /** 찜한 회원 목록 조회 */
   @Override
   public List<Heart> getHeartList(Heart input) throws Exception {
      List<Heart> result = null;

      try {
         result = sqlSession.selectList("MomMypageMapper.selectHeartList", input);

         if (result == null) {
            throw new NullPointerException("result=null");
         }
      } catch (NullPointerException e) {
         log.error(e.getLocalizedMessage());
         throw new Exception("조회된 회원이 없습니다.");
      } catch (Exception e) {
         log.error(e.getLocalizedMessage());
         throw new Exception("데이터 조회에 실패했습니다.");
      }
      return result;
   }

   /** 찜한 회원 수 조회 */
	@Override
	public int getMomHeartCount(Mom_info input) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.selectOne("MomMypageMapper.selectMomHeartCount", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		
		return result;
	}
   
   /** 채용 내역 조회 */
   @Override
   public List<Connect> getWorkList(Connect input) throws Exception {
      List<Connect> result = null;

      try {
         result = sqlSession.selectList("MomMypageMapper.selectWorkList", input);

         if (result == null) {
            throw new NullPointerException("result=null");
         }
      } catch (NullPointerException e) {
         log.error(e.getLocalizedMessage());
         throw new Exception("조회된 회원이 없습니다.");
      } catch (Exception e) {
         log.error(e.getLocalizedMessage());
         throw new Exception("데이터 조회에 실패했습니다.");
      }
      return result;
   }
   
   /** 채용 횟수 조회 */
   @Override
   public int getMomWorkCount(Mom_info input) throws Exception {
	   int result = 0;
	   
	   try {
		   result = sqlSession.selectOne("MomMypageMapper.selectMomWorkCount", input);
	   } catch (Exception e) {
		   log.error(e.getLocalizedMessage());
		   throw new Exception("데이터 조회에 실패했습니다.");
	   }
	   
   		return result;
   }

   /** 신고 내역 조회 */
   @Override
   public List<Report> getReprotList(Report input) throws Exception {
      List<Report> result = null;

      try {
         result = sqlSession.selectList("MomMypageMapper.selectReportList", input);

         if (result == null) {
            throw new NullPointerException("result=null");
         }
      } catch (NullPointerException e) {
         log.error(e.getLocalizedMessage());
         throw new Exception("조회된 회원이 없습니다.");
      } catch (Exception e) {
         log.error(e.getLocalizedMessage());
         throw new Exception("데이터 조회에 실패했습니다.");
      }
      return result;
   }
   
   /** 신고 횟수 조회 */
   @Override
   public int getMomReprotCount(Mom_info input) throws Exception {
	   int result = 0;
	   
	   try {
		   result = sqlSession.selectOne("MomMypageMapper.selectMomReportCount", input);
		   
	   } catch (Exception e) {
		   log.error(e.getLocalizedMessage());
	   }
	   
	   return result;
   }


   /** 구매 내역 조회 */
   @Override
   public Mom_info getBuyList(Mom_info input) throws Exception {
      Mom_info result = null;

      try {
         result = sqlSession.selectOne("MomMypageMapper.selectBuyList", input);
   
      } catch (Exception e) {
         log.error(e.getLocalizedMessage());
         throw new Exception("데이터 조회에 실패했습니다.");
      }
      return result;
   }

   @Override
   public List<Coupon> getCouponList(Coupon input) throws Exception {
      List<Coupon> result = null;

      try {
         result = sqlSession.selectList("MomMypageMapper.selectCouponList", input);

         if (result == null) {
            throw new NullPointerException("result=null");
         }
      } catch (NullPointerException e) {
         log.error(e.getLocalizedMessage());
         throw new Exception("조회된 회원이 없습니다.");
      } catch (Exception e) {
         log.error(e.getLocalizedMessage());
         throw new Exception("데이터 조회에 실패했습니다.");
      }
      return result;
   }
   

	@Override
	public int getCouponCount(Mom_info input) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.selectOne("MomMypageMapper.selectCouponCount", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		
		return result;
	}

   /** 맘 신청서 수정 */
   @Override
   public int editMomInfo(Mom_info input) throws Exception {
      int result = 0;

      try {
         result = sqlSession.update("MomMypageMapper.editMomInfo", input);

         if (result == 0) {
            throw new NullPointerException("result = 0");
         }
      } catch (NullPointerException e) {
         log.error(e.getLocalizedMessage());
         throw new Exception("no data for edit");
      } catch (Exception e) {
         throw new Exception("Cannot edit");
      }

      return result;
   }

   //////////////////// 선아 작업//////////////////
   @Override
   public Mom_info getAccountItem(Mom_info input) throws Exception {
      Mom_info result = null;

      try {
         result = sqlSession.selectOne("MomMypageMapper.selectMemberItem", input);

         if (result == null) {
            throw new NullPointerException("result=null");
         }
      } catch (NullPointerException e) {
         log.error(e.getLocalizedMessage());
         throw new Exception("조회된 회원이 없습니다.");
      } catch (Exception e) {
         log.error(e.getLocalizedMessage());
         throw new Exception("데이터 조회에 실패했습니다.");
      }
      return result;
   }

   @Override
   public int editPhone(Mom_info input) throws Exception {
      int result = 0;

      try {
         result = sqlSession.update("MomMypageMapper.updateMemberPhoneAccount", input);

         if (result == 0) {
            throw new NullPointerException("result = 0");
         }
      } catch (NullPointerException e) {
         log.error(e.getLocalizedMessage());
         throw new Exception("수정된 데이터가 없습니다.");
      } catch (Exception e) {
         throw new Exception("데이터 수정에 실패했습니다.");
      }
      return result;
   }

   @Override
   public int editEmail(Mom_info input) throws Exception {
      int result = 0;

      try {
         result = sqlSession.update("MomMypageMapper.updateMemberEmailAccount", input);

         if (result == 0) {
            throw new NullPointerException("result = 0");
         }
      } catch (NullPointerException e) {
         log.error(e.getLocalizedMessage());
         throw new Exception("수정된 데이터가 없습니다.");
      } catch (Exception e) {
         throw new Exception("데이터 수정에 실패했습니다.");
      }
      return result;
   }

   @Override
   public int bigyoPassword(Mom_info input) throws Exception {
      int result = 0;

      try {
         result = sqlSession.selectOne("MomMypageMapper.bigyoPassword", input);

         if (result == 0) {
            throw new NullPointerException("result = 0");
         }
      } catch (NullPointerException e) {
         log.error(e.getLocalizedMessage());
         throw new Exception("현재 비밀번호를 확인하세요.");
      } catch (Exception e) {
         throw new Exception("데이터 수정에 실패했습니다.");
      }

      return result;
   }

   @Override
   public int updatePassword(Mom_info input) throws Exception {
      int result = 0;

      try {
         result = sqlSession.update("MomMypageMapper.updateMemberPw", input);

         if (result == 0) {
            throw new NullPointerException("result = 0");
         }
      } catch (NullPointerException e) {
         log.error(e.getLocalizedMessage());
         throw new Exception("수정된 데이터가 없습니다.");
      } catch (Exception e) {
         throw new Exception("데이터 수정에 실패했습니다.");
      }
      return result;
   }

   @Override
   public int addAbuOut(Leave_member input) throws Exception {
      int result = 0;

      try {
         result = sqlSession.insert("MomMypageMapper.addleaveMem", input);

         if (result == 0) {
            throw new NullPointerException("result = 0");
         }
      } catch (NullPointerException e) {
         log.error(e.getLocalizedMessage());
         throw new Exception("저장된 데이터가 없습니다.");
      } catch (Exception e) {
         throw new Exception("데이터 저장에 실패했습니다.");
      }
      return result;
   }

   @Override
   public int updateApplytitle(Mom_info input) throws Exception {
      int result = 0;

      try {
         result = sqlSession.update("MomMypageMapper.updateApplyTitle", input);

         if (result == 0) {
            throw new NullPointerException("result = 0");
         }
      } catch (NullPointerException e) {
         log.error(e.getLocalizedMessage());
         throw new Exception("수정된 데이터가 없습니다.");
      } catch (Exception e) {
         throw new Exception("데이터 수정에 실패했습니다.");
      }
      return result;
   }

   @Override
   public int updateDesc(Mom_info input) throws Exception {
      int result = 0;

      try {
         result = sqlSession.update("MomMypageMapper.updateDesc", input);

         if (result == 0) {
            throw new NullPointerException("result = 0");
         }
      } catch (NullPointerException e) {
         log.error(e.getLocalizedMessage());
         throw new Exception("수정된 데이터가 없습니다.");
      } catch (Exception e) {
         throw new Exception("데이터 수정에 실패했습니다.");
      }
      return result;
   }

   @Override
   public int updateWantage(Mom_info input) throws Exception {
      int result = 0;

      try {
         result = sqlSession.update("MomMypageMapper.updateWantage", input);

         if (result == 0) {
            throw new NullPointerException("result = 0");
         }
      } catch (NullPointerException e) {
         log.error(e.getLocalizedMessage());
         throw new Exception("수정된 데이터가 없습니다.");
      } catch (Exception e) {
         throw new Exception("데이터 수정에 실패했습니다.");
      }
      return result;
   }

   @Override
   public int updateLocation(Mom_info input) throws Exception {
      int result = 0;

      try {
         result = sqlSession.update("MomMypageMapper.updateLocation", input);

         if (result == 0) {
            throw new NullPointerException("result = 0");
         }
      } catch (NullPointerException e) {
         log.error(e.getLocalizedMessage());
         throw new Exception("수정된 데이터가 없습니다.");
      } catch (Exception e) {
         throw new Exception("데이터 수정에 실패했습니다.");
      }
      return result;
   }

   @Override
   public int updateSchedule(Mom_info input) throws Exception {
      int result = 0;

      try {
         result = sqlSession.update("MomMypageMapper.updateSchedule", input);

         if (result == 0) {
            throw new NullPointerException("result = 0");
         }
      } catch (NullPointerException e) {
         log.error(e.getLocalizedMessage());
         throw new Exception("수정된 데이터가 없습니다.");
      } catch (Exception e) {
         throw new Exception("데이터 수정에 실패했습니다.");
      }
      return result;
   }

   @Override
   public int updateKidspay(Mom_info input) throws Exception {
      int result = 0;

      try {
         result = sqlSession.update("MomMypageMapper.updateKidspay", input);

         if (result == 0) {
            throw new NullPointerException("result = 0");
         }
      } catch (NullPointerException e) {
         log.error(e.getLocalizedMessage());
         throw new Exception("수정된 데이터가 없습니다.");
      } catch (Exception e) {
         throw new Exception("데이터 수정에 실패했습니다.");
      }
      return result;
   }

   @Override
   public int updateWantact(Mom_info input) throws Exception {
      int result = 0;

      try {
         result = sqlSession.update("MomMypageMapper.updateWantact", input);

         if (result == 0) {
            throw new NullPointerException("result = 0");
         }
      } catch (NullPointerException e) {
         log.error(e.getLocalizedMessage());
         throw new Exception("수정된 데이터가 없습니다.");
      } catch (Exception e) {
         throw new Exception("데이터 수정에 실패했습니다.");
      }
      return result;
   }

   @Override
   public int updateEtc(Mom_info input) throws Exception {
      int result = 0;

      try {
         result = sqlSession.update("MomMypageMapper.updateEtc", input);

         if (result == 0) {
            throw new NullPointerException("result = 0");
         }
      } catch (NullPointerException e) {
         log.error(e.getLocalizedMessage());
         throw new Exception("수정된 데이터가 없습니다.");
      } catch (Exception e) {
         throw new Exception("데이터 수정에 실패했습니다.");
      }
      return result;
   }
   
   ////// end 선아작업////////////////////

}