package com.myweb.www.service;

import java.util.List;

import com.myweb.www.domain.BoardDTO;
import com.myweb.www.domain.BoardVO;
import com.myweb.www.domain.PagingVO;

public interface BoardService {
	int register(BoardDTO bdto);
	List<BoardVO> getList(PagingVO pgvo);
	List<BoardVO> getMyList(PagingVO pgvo);
	BoardDTO getDetail(long bno);
	int modify(BoardDTO bvo);
	int remove(long bno);
	int getTotalCount(PagingVO pgvo);
	int getMyTotalCount(PagingVO pgvo);
	int removeFile(String uuid);
	int cheerup(BoardVO bvo);
}
