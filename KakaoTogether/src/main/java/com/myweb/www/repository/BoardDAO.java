package com.myweb.www.repository;

import java.util.List;

import com.myweb.www.domain.BoardVO;
import com.myweb.www.domain.PagingVO;

public interface BoardDAO {
	int insert(BoardVO bvo);
	List<BoardVO> selectList(PagingVO pgvo);
	BoardVO selectOne(long bno);
	int update(BoardVO bvo);
	int delete(long bno);
	int selectTotalCount(PagingVO pgvo);
	long selectLastBno();
	
}
