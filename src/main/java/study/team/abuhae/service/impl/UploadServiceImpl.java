package study.team.abuhae.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import study.team.abuhae.model.Connect;
import study.team.abuhae.model.ProfileFile;
import study.team.abuhae.model.ResiCert;
import study.team.abuhae.model.Sitter_info;
import study.team.abuhae.service.UploadService;

@Slf4j
@Service
public class UploadServiceImpl implements UploadService {
	 // mybatis 세션 객체 주입 설정
   @Autowired
   SqlSession sqlSession;
   
	@Override
	public int addProfile(ProfileFile input) throws Exception {
		 int result = 0;
	      
	      try {
	         result = sqlSession.insert("UploadMapper.addProfile", input);
	         
	         if (result == 0) {
	            throw new NullPointerException("result=0");
	         }
	      } catch (NullPointerException e) {
	         log.error(e.getLocalizedMessage());
	         throw new Exception("There is no data to save");
	      } catch (Exception e) {
	         log.error(e.getLocalizedMessage());
	         throw new Exception("Fail to save data");
	      }
	      
	      return result;
	}

	@Override
	public ProfileFile getProfileItem(ProfileFile input) throws Exception {
		ProfileFile result = null;
        
        try {
           result = sqlSession.selectOne("UploadMapper.selecSittertProfileItem", input);
       
        } catch (Exception e) {
           log.error(e.getLocalizedMessage());
           throw new Exception("데이터 조회에 실패했습니다.");
        }
        
        return result;
	}

	@Override
	public int getProfileCount(ProfileFile input) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.selectOne("UploadMapper.selectProfileAll");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		
		return result;
	}

	@Override
	public int editProfile(ProfileFile input) throws Exception {
		int result = 0;
	      
	      try {
	         result = sqlSession.update("UploadMapper.editProfile", input);
	         
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

	@Override
	public ProfileFile getMomProfileItem(ProfileFile input) throws Exception {
		ProfileFile result = null;
        
        try {
           result = sqlSession.selectOne("UploadMapper.selectMomProfileItem", input);
       
        } catch (Exception e) {
           log.error(e.getLocalizedMessage());
           throw new Exception("데이터 조회에 실패했습니다.");
        }
        
        return result;
	}

	@Override
	public int addCertify(ResiCert input) throws Exception {
		 int result = 0;
	      
	      try {
	         result = sqlSession.insert("UploadMapper.addCertify", input);
	         
	         if (result == 0) {
	            throw new NullPointerException("result=0");
	         }
	      } catch (NullPointerException e) {
	         log.error(e.getLocalizedMessage());
	         throw new Exception("There is no data to save");
	      } catch (Exception e) {
	         log.error(e.getLocalizedMessage());
	         throw new Exception("Fail to save data");
	      }
	      
	      return result;
	}

	@Override
	public int editCertify(ResiCert input) throws Exception {
		int result = 0;
	      
	      try {
	         result = sqlSession.update("UploadMapper.editCertify", input);
	         
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

	@Override
	public ResiCert getCertifyItem(ResiCert input) throws Exception {
		ResiCert result = null;
        
        try {
           result = sqlSession.selectOne("UploadMapper.selectCertifyItem", input);
       
        } catch (Exception e) {
           log.error(e.getLocalizedMessage());
           throw new Exception("데이터 조회에 실패했습니다.");
        }
        
        return result;
	}

	@Override
	public int getCertifyListCount(ResiCert input) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.selectOne("UploadMapper.selectCertifyistCount");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		
		return result;
	}
	
	@Override
	public int getCertifyItemCount(ResiCert input) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.selectOne("UploadMapper.selectCertifyItemCount", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		
		return result;
	}

	@Override
	public List<ResiCert> getCertifySitterList(ResiCert input) throws Exception {
		List<ResiCert> result = null;
		
		try {
			result = sqlSession.selectList("UploadMapper.selectCertifySitterList",input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		
		return result;
	}

	@Override
	public int updateCertOk(ResiCert input) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.update("UploadMapper.certOk", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		
		return result;
	}

	

}
