package study.team.abuhae.model;

import lombok.Data;

@Data
public class Cus_bbs {
	
	private int boardnum;   // 게시글 일련번호
	private int cateno;
	private int subcateno;   // 수정 일자
	private String title;   // 작성 일자
	private String text;   // 게시글 내용
	private String writer;   // 게시글 제목
	private String reg_date;   // 작성자
	private String edit_date;   // 작성자
	
	/** join 절에 따른 추가 멤버변수 */
	private String sub_category;
	private String category;
	
	/** 페이지 구현을 위한 static 변수 */
	private static int offset; // 조회 시작 위치
	private static int listCount; // limit 절에서 사용할 데이터 수 

	public static int getOffset() { return offset; }

	public static void setOffset(int offset) { Cus_bbs.offset = offset; }

	public static int getListCount() { return listCount; }

	public static void setListCount(int listCount) { Cus_bbs.listCount = listCount; }
	
}
