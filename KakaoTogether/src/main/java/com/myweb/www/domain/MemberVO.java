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
@NoArgsConstructor
@AllArgsConstructor
@Alias("mvo")
public class MemberVO {
	private long mno;
	private String userId;
	private String pwd;
	private String userName;
	private String phone;
	private String email;
	private String postnum;
	private String addr;
	private String regAt;
	
	// signup
	public MemberVO(String userId, String pwd, String userName, String phone, String email, String postnum,
			String addr) {
		this.userId = userId;
		this.pwd = pwd;
		this.userName = userName;
		this.phone = phone;
		this.email = email;
		this.postnum = postnum;
		this.addr = addr;
	}

	
	public MemberVO(long mno, String userName) {
		this.mno = mno;
		this.userName = userName;
	}

	public MemberVO(String userId, String pwd) {
		this.userId = userId;
		this.pwd = pwd;
	}
	
	
	
}