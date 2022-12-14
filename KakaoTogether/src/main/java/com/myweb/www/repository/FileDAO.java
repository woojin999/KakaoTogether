package com.myweb.www.repository;

import java.util.List;

import com.myweb.www.domain.FileVO;

public interface FileDAO {
	int insertBFile(FileVO fvo);
	List<FileVO> selectListBFile(long bno);
	int deleteFile(String uuid);
	int deleteAllBFile(long bno);
	List<FileVO> selectAllFiles();
}
