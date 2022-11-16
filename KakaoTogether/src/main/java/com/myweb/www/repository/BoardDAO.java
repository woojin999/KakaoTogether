package com.myweb.www.repository;

import java.util.List;


import com.myweb.www.domain.BoardVO;
import com.myweb.www.domain.DonationVO;
import com.myweb.www.domain.PagingVO;

public interface BoardDAO {
	int insert(BoardVO bvo);
	List<BoardVO> selectList(PagingVO pgvo);
	List<BoardVO> selectPmList(PagingVO pgvo);
	List<BoardVO> selectMyList(PagingVO pgvo);
	BoardVO selectOne(long bno);
	BoardVO selectPmOne(long bno);
	int update(BoardVO bvo);
	int updateFinal(DonationVO dvo);
	int delete(long bno);
	int selectTotalCount(PagingVO pgvo);
	int selectPmTotalCount(PagingVO pgvo);
	int selectMyTotalCount(PagingVO pgvo);
	long selectLastBno();
	int cheer(BoardVO bvo);
}
