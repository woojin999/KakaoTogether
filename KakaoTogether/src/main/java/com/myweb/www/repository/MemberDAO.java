package com.myweb.www.repository;

import com.myweb.www.domain.MemberVO;

public interface MemberDAO {
	int insert(MemberVO mvo);
	MemberVO selectOne(MemberVO mvo);
	MemberVO selectDetail(long mno);
}
