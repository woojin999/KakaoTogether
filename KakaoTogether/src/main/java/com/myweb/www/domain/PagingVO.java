package com.myweb.www.domain;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Alias("pgvo")
public class PagingVO {
	private int pageNo;
	private int qty;
	
	private String type;
	private String kw;
	private String orderBy;
	private String topic;
	private String state;
	private long mno;
	
	public PagingVO() {
		this(1, 12);
	}
	
	public PagingVO(int pageNo, int qty) {
		this.pageNo = pageNo;
		this.qty = qty;
	}
	public int getPageStart() {
		return (this.pageNo - 1) * qty;
	}
	public String[] getTypeToArray() {
		return this.type == null ? new String[] {} : this.type.split("");
	}
}
