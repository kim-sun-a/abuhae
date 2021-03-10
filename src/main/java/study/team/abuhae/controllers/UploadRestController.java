package study.team.abuhae.controllers;

import java.io.File;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import study.team.abuhae.helper.WebHelper;
import study.team.abuhae.model.ProfileFile;
import study.team.abuhae.service.UploadService;

@RestController
public class UploadRestController {
	@Autowired WebHelper webHelper;
	@Autowired UploadService uploadService;
	
	/** 파일 업로드 insert 기능 */
	@RequestMapping(value = "/upload/add_upload", method = RequestMethod.POST)
	public Map<String, Object> add_upload(
			@RequestParam(required = false) MultipartFile photo,
			@RequestParam(value = "memberno", defaultValue = "0") int memberno) {
		/** 1) 업로드 파일 저장하기 */
		// 업로드 된 파일이 존재하는지 확인
		if (photo.getOriginalFilename().isEmpty()) {
			return webHelper.getJsonError("업로드할 파일을 선택해주세요.");
		}
		
		// 업로드 된 파일이 저장될 경로 정보를 생성한다.
		File targetFile =  new File(webHelper.getUploadDir(), photo.getOriginalFilename());
		
		// 업로드 된 파일을 지정된 경로로 복사한다.
		try {
			photo.transferTo(targetFile);
		} catch (Exception e) {
			e.printStackTrace();
			return webHelper.getJsonError("프로필 업르드에 실패했습니다.");
		}
		
		/** 2) 업로드 경로 정보 처리하기 */
		// 복사된 파일의 절대경로를 추출한다.
		// --> 운영체제 호환을 위해 역슬래시를 슬래시로 변환한다.
		String absPath = targetFile.getAbsolutePath().replace("\\", "/");
		
		// 절대경로에서 이미 root-context에 지정되어 있는 업로드 폴더 경로를 삭제한다.
		String filePath = absPath.replace(webHelper.getUploadDir(), "");
		
		/** 3) 업로드 결과 Beans에 저장 */
		ProfileFile item = new ProfileFile();
		item.setContentType(photo.getContentType());
		item.setFileName(photo.getName());
		item.setFileSize(photo.getSize());
		item.setOriginName(photo.getOriginalFilename());
		item.setFilePath(filePath);
		item.setMemberno(memberno);
		
		// 업로드 경로와 썸네일 경로는 웹 상에서 접근 가능한 경로 문자열로 변환하여 Beans에 추가한다.
		String fileUrl = webHelper.getUploadUrl(filePath);
		item.setFileUrl(fileUrl);
		
		// DB에 저장 
		try {
			uploadService.addProfile(item);
		} catch (Exception e) {
			
			return webHelper.getJsonError("이미지 파일 저장에 실패했습니다.");
		}
		
		return webHelper.getJsonData();
	}
	
	/** 파일 업로드 update 기능 */
	@RequestMapping(value = "/upload/edit_upload", method = RequestMethod.POST)
	public Map<String, Object> edit_upload() {
		return null;
	}
	
}
