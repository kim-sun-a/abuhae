package study.team.abuhae.model;

import lombok.Data;

@Data
public class Cus_sub_category {
	private int subcateno;
	private int cateno;
	private String sub_category;
	
	/** cus_category table과의 join에 따른 추가 컬럼 */
	private String category;
}
