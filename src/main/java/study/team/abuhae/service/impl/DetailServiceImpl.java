package study.team.abuhae.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import study.team.abuhae.model.Connect;
import study.team.abuhae.model.Heart;
import study.team.abuhae.model.Mom_info;
import study.team.abuhae.model.Report;
import study.team.abuhae.model.Review;
import study.team.abuhae.model.Sitter_info;
import study.team.abuhae.service.DetailService;

@Slf4j
@Service
public class DetailServiceImpl implements DetailService {
	
	@Autowired
	SqlSession sqlSession;
	

	@Override
	public Sitter_info getSitterItem(Sitter_info input) throws Exception {
		Sitter_info result = null;
		
		try {
			result = sqlSession.selectOne("DetailMapper.selectItem", input);
			
			if (result==null) {
				throw new NullPointerException("result=null");
			}
			
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		} catch (Exception e) {
			log.debug(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		
		
		return result;
	}

	@Override
	public int editSitter(Sitter_info input) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.update("DetailMapper.updateItem", input);
		} catch (NullPointerException e) {
			log.debug(e.getLocalizedMessage());
			throw new Exception("수정된 조회수가 없습니다.");
		} catch (Exception e) {
			log.debug(e.getLocalizedMessage());
			throw new Exception("조회수 수정에 실패했습니다.");
		}
		return result;
	}

	@Override
	public int addSitter(Sitter_info input) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.insert("DetailMapper.insertItem", input);
			
			if (result == 0) {
				throw new NullPointerException("result=0");
			}
		} catch (NullPointerException e) {
			log.debug(e.getLocalizedMessage());
			throw new Exception("저장된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 저장에 실패했습니다.");
		}
		
		return result;
	}

	@Override
	public Mom_info getMomItem(Mom_info input) throws Exception {
		
		Mom_info result = null;
		
		try {
			result = sqlSession.selectOne("DetailMapper.selectItemMom", input);
			
			if (result==null) {
				throw new NullPointerException("result=null");
			}
			
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		} catch (Exception e) {
			log.debug(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		
		
		return result;
	}

	@Override
	public int addReport(Report input) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.insert("DetailMapper.insertReport", input);
			
			if (result == 0) {
				throw new NullPointerException("result=0");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("저장된 데이터가 없습니다.");
		} catch (Exception e) {
			log.debug(e.getLocalizedMessage());
			throw new Exception("데이터 저장에 실패했습니다.");
		}
		
		return result;
	}

	@Override
	public Sitter_info getWantAge(Sitter_info input) throws Exception {
		Sitter_info result = null;
		
		try {
			result = sqlSession.selectOne("DetailMapper.selectWantAge", input);
			
			if (result==null) {
				throw new NullPointerException("result=null");
			}
			
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		} catch (Exception e) {
			log.debug(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		
		
		return result;
	}

	@Override
	public int addHeart(Heart input) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.insert("SearchMapper.insertHeart", input);
			
			if (result == 0) {
				throw new NullPointerException("result=0");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("저장된 데이터가 없습니다.");
		} catch (Exception e) {
			log.debug(e.getLocalizedMessage());
			throw new Exception("데이터 저장에 실패했습니다.");
		}
		
		return result;
	}

	@Override
	public int deleteHeart(Heart input) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.delete("SearchMapper.deleteHeart", input);
			
			if (result == 0) {
				throw new NullPointerException("result=0");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("삭제된 찜 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 삭제에 실패했습니다.");
		}
		
		return result;
	}

	@Override
	public int addConnect(Connect input) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.insert("DetailMapper.insertConnect", input);
			
			if (result == 0) {
				throw new NullPointerException("result=0");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("저장된 데이터가 없습니다.");
		} catch (Exception e) {
			log.debug(e.getLocalizedMessage());
			throw new Exception("데이터 저장에 실패했습니다.");
		}
		
		return result;
	}

	@Override
	public Mom_info getMomMember(Mom_info input) throws Exception {
		Mom_info result = null;

		try {
			result = sqlSession.selectOne("DetailMapper.selectHeart", input);
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
		
		//반환된 데이터가 있으면 데이터 조회가 있다는 뜻
		return result;
	}

	@Override
	public Sitter_info getSitterMember(Sitter_info input) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
		public int findHeart(Heart input) throws Exception {
		int result = 0;
			
		try {
			result = sqlSession.selectOne("SearchMapper.findHeart", input);
			
			if (result == 0) {
				throw new NullPointerException("result=0");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("삭제된 찜 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 삭제에 실패했습니다.");
		}
		
		return result;	
	}

	@Override
	public List<Review> getReviewList(Review input) throws Exception {
		List<Review> result = null;
	      
	      try {
	         result = sqlSession.selectList("DetailMapper.ReviewList", input);
	         
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
	public List<Review> getReviewListTotal(Review input) throws Exception {
		List<Review> result = null;
	      
	      try {
	         result = sqlSession.selectList("DetailMapper.ReviewListTotal", input);
	         
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




}
