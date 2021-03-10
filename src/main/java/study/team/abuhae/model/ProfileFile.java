package study.team.abuhae.model;

import lombok.Data;

@Data
public class ProfileFile {
	private int profno;
	private String fileName;
	private String originName;
	private String contentType;
	private long fileSize;
	private String filePath;
	private String fileUrl;
	private String thumbnailpath;
	private String thumnailurl;
	private int memberno;
	private String isProfile;

	/** join에 따른 멤버변수 추가 */
	private int momno;
	private int sitterno;
}
