package com.myweb.www.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.myweb.www.domain.MemberVO;
import com.myweb.www.repository.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService {

	@Inject
	private MemberDAO mdao;
	
	@Override
	public int register(MemberVO mvo) {
		return mdao.insert(mvo);
	}

	@Override
	public MemberVO login(MemberVO mvo) {
		return mdao.selectOne(mvo);
	}

	@Override
	public MemberVO getDetail(long mno) {
		return mdao.selectDetail(mno);
	}

}
