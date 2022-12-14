package com.myweb.www.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class DonationVO {
	private long dno; // 기부 번호
	private long mno; // 회원 번호
	private long bno; // 게시글 번호
	private long donation; // 기부 금액
	private String comment; // 기부 내용
	private String donationAt; // 기부일
	private String title;
	private String boardImg;
	private String userName;
	private String donaName;
	
	// register
	public DonationVO(long mno, long bno, long donation, String comment, String donaName) {
		this.mno = mno;
		this.bno = bno;
		this.donation = donation;
		this.comment = comment;
		this.donaName = donaName;
	}
	
	// mydonalist
	public DonationVO(long dno, long mno, long bno, long donation, String donationAt, String donaName) {
		this.dno = dno;
		this.mno = mno;
		this.bno = bno;
		this.donation = donation;
		this.donationAt = donationAt;
		this.donaName = donaName;
	}
	
	// list AllArgsConstructor
	
	
}