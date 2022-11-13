package com.myweb.www.domain;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
@Alias("bvo")
public class BoardVO {
	private long bno; // 게시글 번호
	private long mno; // 회원 번호
	private String title; // 제목
	private String subTitle; // 소제목
	private String writer; // 작성자
	private String topic; // 주제
	private String state; // 모금상태
	private String description; // 본문
	private long price; // 목표 금액
	private String keyword1; //키워드 1
	private String keyword2; //키워드 2
	private String keyword3; //키워드 2
	private String regAt; // 시작일
	private String endDate; // 마감일
	private long finalPrice; // 최종 모금액
	private String boardImg; // 사진
	private int fileCount;
	private int cheer; // 응원수
	private String userName;
	
	// register
	public BoardVO(long mno, String title, String subTitle, String writer, String topic, String state, String description, long price,
			String keyword1, String keyword2, String keyword3, String endDate, String boardImg) {
		this.mno = mno;
		this.title = title;
		this.subTitle = subTitle;
		this.writer = writer;
		this.topic = topic;
		this.state = state;
		this.description = description;
		this.price = price;
		this.keyword1 = keyword1;
		this.keyword2 = keyword2;
		this.keyword3 = keyword3;
		this.endDate = endDate;
		this.boardImg = boardImg;
	}

	// list
	public BoardVO(long bno, long mno, String title, String writer,long price, long finalPrice, String boardImg) {
		this.bno = bno;
		this.mno = mno;
		this.title = title;
		this.writer = writer;
		this.price = price;
		this.finalPrice = finalPrice;
		this.boardImg = boardImg;
	}
	
	// detail
	public BoardVO(long bno, String title, String subTitle, String writer, String description, long price, String keyword1,
			String keyword2, String keyword3, String regAt, String endDate, long finalPrice, String boardImg, int cheer) {
		this.bno = bno;
		this.title = title;
		this.subTitle = subTitle;
		this.writer = writer;
		this.description = description;
		this.price = price;
		this.keyword1 = keyword1;
		this.keyword2 = keyword2;
		this.keyword3 = keyword3;
		this.regAt = regAt;
		this.endDate = endDate;
		this.finalPrice = finalPrice;
		this.boardImg = boardImg;
		this.cheer = cheer;
	}

	// modify
	public BoardVO(long bno, String title, String subTitle, String topic, String state, String description, long price, String keyword1,
			String keyword2, String keyword3, String endDate, String boardImg) {
		this.bno = bno;
		this.title = title;
		this.subTitle = subTitle;
		this.topic = topic;
		this.state = state;
		this.description = description;
		this.price = price;
		this.keyword1 = keyword1;
		this.keyword2 = keyword2;
		this.keyword3 = keyword3;
		this.endDate = endDate;
		this.boardImg = boardImg;
	}
	// 응원하기
	public BoardVO(long bno, int cheer) {
		this.bno = bno;
		this.cheer = cheer;
	}
 
	
}
