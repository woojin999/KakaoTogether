package com.myweb.www.handler;

import java.util.List;

import com.myweb.www.domain.DonationVO;
import com.myweb.www.domain.PagingVO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PagingHandler {
	private int startPage;
	private int endPage;
	private int realEndPage;
	private boolean prev, next;
	
	private int totalCount;
	private PagingVO pgvo;
	private List<DonationVO> donaList;
	
	public PagingHandler(PagingVO pgvo,int totalCount) {
		this.pgvo = pgvo;
		this.totalCount = totalCount;
		
		this.endPage =(int) (Math.ceil(pgvo.getPageNo() / (10 * 1.0))) * 10;
		this.startPage = endPage - 9;
	
		int realEndPage = (int)(Math.ceil((totalCount * 1.0) / pgvo.getQty()));
	
		if(realEndPage < this.endPage) {
		this.endPage = realEndPage;
		}
	
		this.prev = startPage > 1;
		this.next = endPage < realEndPage;
	}
	public PagingHandler(List<DonationVO> donaList,
			 int totalCount, PagingVO pgvo) {
		this(pgvo, totalCount);
		this.donaList = donaList;
	}
}
