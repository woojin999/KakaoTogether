package com.myweb.www.handler;

import java.io.File;
import java.nio.file.Paths;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.myweb.www.domain.FileVO;
import com.myweb.www.repository.FileDAO;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
@AllArgsConstructor
public class FileSweepHandler {
private final String UP_DIR = "C:\\_java\\lec\\_spring\\uploaded\\";
	
	@Inject
	private FileDAO fdao;
	
	@Scheduled(cron = "00 00 18 * * *")
	public void fileSweeper() throws Exception {
		log.info(">>> fileSweeper Running Start : {}", LocalDateTime.now());
		
		List<FileVO> dbFileList = fdao.selectAllFiles();
		
		List<String> savedFileList = new ArrayList<>();
		
		for (FileVO fvo : dbFileList) {
			String filePath = fvo.getSaveDir() + "\\" + fvo.getUuid();
			String fileName = fvo.getImageName();
			savedFileList.add(UP_DIR + filePath + "_" + fileName);
				savedFileList.add(UP_DIR+filePath+"_th"+fileName);
		}
		
		LocalDate now = LocalDate.now();
		String targetDay = now.toString(); 
		targetDay = targetDay.replace("-", File.separator);
		
		File dir = Paths.get(UP_DIR + targetDay).toFile();
		File[] allFileObjects = dir.listFiles();
		
		for (File file : allFileObjects) {
			String storedFileName = file.toPath().toString();
			if(!savedFileList.contains(storedFileName)) {
				file.delete();
				log.info(">>> deleted file : {}", storedFileName);
			}
		}
		log.info(">>> fileSweeper Running Finish : {}", LocalDateTime.now());
	}
}
