package com.myweb.www.repository;


import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.myweb.www.domain.DonationVO;
import com.myweb.www.domain.PagingVO;

public interface DonationDAO {
	int insert(DonationVO dvo);
	List<DonationVO> selectList(@Param("bno") long bno, @Param("pgvo") PagingVO pgvo);
	List<DonationVO> selectMyList(PagingVO pgvo);
	int selectTotalCount(long bno);
	int selectMyTotalCount(PagingVO pgvo);
	long selectBno(long dno);
}
