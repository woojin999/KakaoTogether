package com.myweb.www.service;

import java.util.List;


import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.myweb.www.domain.BoardDTO;
import com.myweb.www.domain.BoardVO;
import com.myweb.www.domain.FileVO;
import com.myweb.www.domain.PagingVO;
import com.myweb.www.repository.BoardDAO;
import com.myweb.www.repository.FileDAO;

@Service
public class BoardServiceImpl implements BoardService {

	@Inject
	private BoardDAO bdao;
	
	@Inject
	private FileDAO fdao;
	
	@Override
	public int register(BoardDTO bdto) {
		int isUp = bdao.insert(bdto.getBvo());
		
		if (isUp > 0 && bdto.getFileList().size() > 0) {
			long bno = bdao.selectLastBno();
			for(FileVO fvo : bdto.getFileList()) {
				fvo.setBno(bno);
				isUp *= fdao.insertBFile(fvo);
			}
		}
		return isUp;
	}

	@Override
	public List<BoardVO> getList(PagingVO pgvo) {
		return bdao.selectList(pgvo);
	}

	@Override
	public List<BoardVO> getPmList(PagingVO pgvo) {
		return bdao.selectPmList(pgvo);
	}
	
	@Override
	public List<BoardVO> getMyList(PagingVO pgvo) {
		return bdao.selectMyList(pgvo);
	}
	
	@Override
	public BoardDTO getDetail(long bno) {
		
		return new BoardDTO(bdao.selectOne(bno)
							, fdao.selectListBFile(bno));
	}

	@Override
	public int modify(BoardDTO bdto) {
		int isUp = bdao.update(bdto.getBvo());
		if (bdto.getFileList() != null) {
			isUp = fdao.deleteAllBFile(bdto.getBvo().getBno());
			if (isUp > 0 && bdto.getFileList().size() > 0) {
				for (FileVO fvo : bdto.getFileList()) {
					fvo.setBno(bdto.getBvo().getBno());
					isUp *= fdao.insertBFile(fvo);
				}
			}
		}
		return isUp;
	}

	@Override
	public int remove(long bno) {
		int isUp = bdao.delete(bno);
		if(isUp > 0) {
			isUp = fdao.deleteAllBFile(bno);
		}
		return isUp;
	}

	@Override
	public int getTotalCount(PagingVO pgvo) {
		return bdao.selectTotalCount(pgvo);
	}

	@Override
	public int removeFile(String uuid) {
		return fdao.deleteFile(uuid);
	}

	@Override
	public int cheerup(BoardVO bvo) {
		return bdao.cheer(bvo);
	}

	@Override
	public int getMyTotalCount(PagingVO pgvo) {
		return bdao.selectMyTotalCount(pgvo);
	}


	@Override
	public int getPmTotalCount(PagingVO pgvo) {
		return bdao.selectPmTotalCount(pgvo);
	}

	

	

}
