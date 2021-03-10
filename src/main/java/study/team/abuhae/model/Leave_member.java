package study.team.abuhae.model;

import lombok.Data;

@Data
public class Leave_member {
	private int leav_mem;
	private char type;
	private String id;
	private String name;
	private String email;
	private String phone;
	private String reason;
	private String leave_date;
	private String leaveok_date;
	
	//join 절에 따른 변수 추가
	private String isok;
}
