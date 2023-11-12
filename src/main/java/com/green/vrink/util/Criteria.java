package com.green.vrink.util;


import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


//페이징 크리테리아
@Getter
@Setter
@ToString

	/**
	 * @author 최규하
	 * 페이징 크리테리아 기본적인 형식을 따름
	 */
public class Criteria {
	
	//사용자가 선택한 페이지 정보를 담을 변수.

	private int pageNum;
	private int countPerPage;

	//검색에 필요한 데이터를 변수로 선언.
	private String keyword;
	private String type;
	private String orderBy;
	private String filter;
	private Integer userId;
	private Integer editorId;
	public int getOffset() {
    return (this.pageNum - 1) * this.countPerPage;
}
	public Criteria() {
		this.pageNum = 1;
		this.countPerPage = 10;
	}

}
