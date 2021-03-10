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
import study.team.abuhae.model.Mom_info;
import study.team.abuhae.model.Report;
import study.team.abuhae.model.Review;
import study.team.abuhae.model.Sitter_info;
import study.team.abuhae.service.SitterMypageService;

@Slf4j
@Service
public class SitterMypageServiceImpl implements SitterMypageService {
   // mybatis 세션 객체 주입 설정
   @Autowired
   SqlSession sqlSession;
   //mailhelper 주입
   @Autowired
   MailHelper mailhelper;
   // Service 객체 주입
   
   @Override
   public List<Connect> getConnectList(Connect input) throws Exception {
      List<Connect> result = null;
      
      try {
         result = sqlSession.selectList("ConnectMapper.selectSitterInputApplyList", input);
         
         if (result == null) {
            throw new NullPointerException("result = null");
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
	public int editSitterOpeningDate(Sitter_info input) throws Exception {
		int result = 0;

	      try {
	         result = sqlSession.update("SitterMypageMapper.updateSitterOpeningDate", input);

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
   
   /** 인터뷰 요청에 대한 Accept 업데이트 */
   @Override
   public int editAccept(Connect input) throws Exception {
      int result = 0;
      
      try {
         result = sqlSession.update("ConnectMapper.EditAccept", input);
         
         if (result == 0) {
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
   
   /** accept가 'Y'일 경우 review 입력 */
   @Override
   public int addReview(Review input) throws Exception {
      int result = 0;
      
      try {
         result = sqlSession.insert("ConnectMapper.insertReview", input);
         
         if (result == 0) {
            throw new NullPointerException("result=0");
         }
      } catch (NullPointerException e) {
         log.error(e.getLocalizedMessage());
         throw new Exception("저장된 데이터가 없습니다.");
      } catch (Exception e) {
         log.error(e.getLocalizedMessage());
         throw new Exception("데이터 저장에 실패했습니다.");
      }
      
      return result;
   }

   @Override
   public List<Review> getSitterReviewList(Review input) throws Exception {
      List<Review> result = null;
      
      try {
         result = sqlSession.selectList("ReviewMapper.selectSitterReviewList", input);
         
         if (result == null) {
            throw new NullPointerException("result = null");
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

   /** 시터회원 정보 조회 */
   @Override
   public Sitter_info getSitterItem(Sitter_info input) throws Exception {
      Sitter_info result = null;
         
         try {
            result = sqlSession.selectOne("SitterMypageMapper.selectSitterItem", input);
            
            if (result==null) {
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

   /** 찜 내역 조회 */
   @Override
   public List<Heart> getSitterHeartList(Heart input) throws Exception {
      List<Heart> result = null;
         
         try {
            result = sqlSession.selectList("SitterMypageMapper.selectSitterHeartList", input);
         } catch (Exception e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("데이터 조회에 실패했습니다.");
         }
         
         return result;
   }
   
   /** 찜한 횟수 조회 */
	@Override
	public int getSitterHeartCount(Sitter_info input) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.selectOne("SitterMypageMapper.selectSitterHeartCount", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		}
		
		return result;
	}


   /** 내게 지원한 */
   @Override
   public List<Connect> getSitterWorkList(Connect input) throws Exception {
	   List<Connect> result = null;
       
       try {
          result = sqlSession.selectList("SitterMypageMapper.selectSitterWorkList", input);
          
          if (result==null) {
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
	public int getSitterWorkCount(Sitter_info input) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.selectOne("SitterMypageMapper.selectSitterWorkCount", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		
		return result;
	}

   
   @Override
   public List<Report> getSitterReprotList(Report input) throws Exception {
	   List<Report> result = null;
       
       try {
          result = sqlSession.selectList("SitterMypageMapper.selectSitterReportList", input);
          
          if (result==null) {
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
	public int getSitterReportCount(Sitter_info input) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.selectOne("SitterMypageMapper.selectSitterReportCount", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		
		return result;
	}

   /** 내가 지원한 부모회원 목록 */
	@Override
	public List<Connect> getSitterApplyList(Connect input) throws Exception {
		List<Connect> result = null;
	    
	    try {
	       result = sqlSession.selectList("ConnectMapper.selectSitterOutputApplyList", input);
	       
	       if (result == null) {
	          throw new NullPointerException("result = null");
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

	/** 비밀번호 비교 */
	@Override
	public int bigyoSitterPassword(Sitter_info input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.selectOne("SitterMypageMapper.bigyoSitterPassword", input);

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
	
	/** 비밀번호 업데이트 */
	@Override
	public int updatSitterePassword(Sitter_info input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.update("SitterMypageMapper.updateSitterPw", input);

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

	/** 시터회원 정보 추출 */
	@Override
	public Sitter_info getSitterMember(Sitter_info input) throws Exception {
		Sitter_info result = null;

		try {
			result = sqlSession.selectOne("SitterMypageMapper.selectSitter", input);

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

	/** 회원 휴대폰 번호 수정 */
	@Override
	public int editSitterPhone(Sitter_info input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.update("MomMypageMapper.updateMemberPhoneAccount", input);

			if (result == 0) {
				throw new NullPointerException("result = 0");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("There is no data to edit");
		} catch (Exception e) {
			throw new Exception("Fail to edit your phone number");
		}
		return result;
	}

	/** 회원 이메일 수정 */
	@Override
	public int editSitterEmail(Sitter_info input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.update("MomMypageMapper.updateMemberEmailAccount", input);

			if (result == 0) {
				throw new NullPointerException("result = 0");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("There is no data to edit");
		} catch (Exception e) {
			throw new Exception("Fail to edit your email");
		}
		return result;
	}

	@Override
	public int updateFavoriteact(Sitter_info input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.update("SitterMypageMapper.updateFavoriteact", input);

			if (result == 0) {
				throw new NullPointerException("result = 0");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("There is no data to edit");
		} catch (Exception e) {
			throw new Exception("Fail to edit your email");
		}
		return result;
	}

	@Override
	public int updateWantage(Sitter_info input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.update("SitterMypageMapper.updateWantage", input);

			if (result == 0) {
				throw new NullPointerException("result = 0");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("There is no data to edit");
		} catch (Exception e) {
			throw new Exception("Fail to edit your email");
		}
		return result;
	}

	@Override
	public int updateWantact(Sitter_info input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.update("SitterMypageMapper.updateWantact", input);

			if (result == 0) {
				throw new NullPointerException("result = 0");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("There is no data to edit");
		} catch (Exception e) {
			throw new Exception("Fail to edit your email");
		}
		return result;
	}

	@Override
	public int updateSchedule(Sitter_info input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.update("SitterMypageMapper.updateSchedule", input);

			if (result == 0) {
				throw new NullPointerException("result = 0");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("There is no data to edit");
		} catch (Exception e) {
			throw new Exception("Fail to edit your email");
		}
		return result;
	}

	@Override
	public int updatePayment(Sitter_info input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.update("SitterMypageMapper.updatePayment", input);

			if (result == 0) {
				throw new NullPointerException("result = 0");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("There is no data to edit");
		} catch (Exception e) {
			throw new Exception("Fail to edit your email");
		}
		return result;
	}

	@Override
	public int updateIntoroduce(Sitter_info input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.update("SitterMypageMapper.updateIntroduce", input);

			if (result == 0) {
				throw new NullPointerException("result = 0");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("There is no data to edit");
		} catch (Exception e) {
			throw new Exception("Fail to edit your email");
		}
		return result;
	}

	@Override
	public int updateLocation(Sitter_info input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.update("SitterMypageMapper.updateLocation", input);

			if (result == 0) {
				throw new NullPointerException("result = 0");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("There is no data to edit");
		} catch (Exception e) {
			throw new Exception("Fail to edit your email");
		}
		return result;
	}

	@Override
	public Sitter_info getSitterAccountItem(Sitter_info input) throws Exception {
		Sitter_info result = null;

	      try {
	         result = sqlSession.selectOne("SitterMypageMapper.selectSitterMemberItem", input);

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
	
}