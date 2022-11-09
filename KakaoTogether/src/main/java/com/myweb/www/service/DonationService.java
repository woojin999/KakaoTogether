package com.myweb.www.service;


import com.myweb.www.domain.DonationVO;
import com.myweb.www.domain.PagingVO;
import com.myweb.www.handler.PagingHandler;

public interface DonationService {
	int register(DonationVO dvo);
	PagingHandler spread(long bno, PagingVO pgvo);
}
