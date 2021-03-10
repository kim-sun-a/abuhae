package study.team.abuhae.model;

import lombok.Data;

@Data
public class ResiCert {
	private int resino;   
	private String fileName;   
	private String originName; 
	private String contentType;   
	private long fileSize;
	private String filePath;   
	private String fileUrl;   
	private String check_resi;
	private String check_birthdate;   
	private String cert;
	private String reg_date;   // 인증 요청 날짜
	private int sitterno;   // 시터회원 일련번호
	
	//join 절에 따른 변수 추가
	private String name;
	private String id;
}
