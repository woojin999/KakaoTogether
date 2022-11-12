package com.myweb.www.service;

import com.myweb.www.domain.MemberVO;

public interface MemberService {
	int register(MemberVO mvo);
	MemberVO login(MemberVO mvo);
	MemberVO getDetail(long mno);
}
