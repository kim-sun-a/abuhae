package study.team.abuhae.service;

import java.util.List;

import study.team.abuhae.model.ProfileFile;
import study.team.abuhae.model.ResiCert;

public interface UploadService {
	  /** 프로필 insert */
	  public int addProfile(ProfileFile input) throws Exception;
	  
	  /** 시터회원 프로필 데이터 조회 */
	  public ProfileFile getProfileItem(ProfileFile input) throws Exception;
	  
	  /** 부모회원 프로필 데이터 조회 */
	  public ProfileFile getMomProfileItem(ProfileFile input) throws Exception;
	  
	  public int getProfileCount(ProfileFile input) throws Exception;
	  
	  /** 프로필 사진 업데이트 */
	  public int editProfile(ProfileFile input) throws Exception;
	  
	  /** 인증 업로드 */
	  public int addCertify(ResiCert input) throws Exception;

	  /** 승인 거절 시 인증 재업로드 */
	  public int editCertify(ResiCert input) throws Exception;
	  
	  /** 인증 업로드 데이터 조회 */
	  public ResiCert getCertifyItem(ResiCert input) throws Exception;
	  
	  //인증 총 갯수 조회
	  public int getCertifyListCount(ResiCert input) throws Exception;
	  
	  //인증 확인 여부 조회
	  public int getCertifyItemCount(ResiCert input) throws Exception;
	  
	  //인증 리스트 조회
	  public List<ResiCert> getCertifySitterList(ResiCert input) throws Exception;
	  
	  //인증 리스트 조회
	  public int updateCertOk(ResiCert input) throws Exception;
}
