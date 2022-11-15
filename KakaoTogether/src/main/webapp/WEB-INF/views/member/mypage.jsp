<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="../common/header.jsp" />
<jsp:include page="../common/nav.jsp" />

<div id="contents">
	<div id="wrap_tab">
		<ul class="list_tab">
			<li>
				<a href="/member/mypage?mno=${ses.mno }${userMno }"><span>내 정보</span></a>
			</li>
			<li>
				<a href="/board/mylist/${ses.mno }${userMno }"><span>기부글 작성내역</span></a>
			</li>
			<li>
				<a href="/donation/list/${ses.mno }${userMno }"><span>내 기부내역</span></a>
			</li>
		</ul>
	</div> <!-- end wrap_tab -->
</div> <!-- end contents -->

<div style="width: 600px; padding: 10px; margin:auto; text-align:center; font-family: KakaoBold; font-size: 30px; color: #555;">
	<div style="margin-top: 20px; margin-bottom: -40px">
		<span>내 정보</span><br>
	</div>
</div>
<div id="page_join" style="padding-top:0px">
	<div id="main">
		<form id="join_form" name="joinForm" >
			<input type="hidden" name="mno" value="${ses.mno }${userMno }">
			<table class="join_table">
				<tr>
					<td class="item_th">
						<div><span>이름</span></div>
					</td>
					<td class="item_box">
						<div><input readonly="readonly" id="username" name="username" value="${mvo.userName }${userNickname }"></div>
					</td>
				</tr>
				<tr>
					<td class="item_th">
						<div><span>아이디</span></div>
					</td>
					<td class="item_box">
						<div><input readonly="readonly" id="userid" name="userid" onkeyup="idCheck()" value="${mvo.userId }${userId }"></div>
					</td>
				</tr>
				<tr>
					<td class="item_th">
						<div><span>비밀번호</span></div>
					</td>
					<td class="item_box">
						<div><input readonly="readonly" id="passwd" name="passwd" value="${mvo.pwd }"></div>
					</td>
				</tr>
				<tr>
					<td><span>주소</span></td>
					<td class="item_box" style="margin-top: 10px;">
						<div><input readonly="readonly" type="text" name="post" id="postcode" value="${mvo.postnum }" style="margin-top: 10px;" autocomplete="off"></div>
						<div><input readonly="readonly" type="text" name="addr1" id="roadAddress" value="${mvo.addr }" autocomplete="off"></div>
					</td>
				</tr>
				<tr>
					<td class="item_th">
					<div><span>전화번호</span></div></td>
					<td class="item_box">
						<div><input readonly="readonly" type="text" id="phone" name="phone" value="${mvo.phone}" autocomplete="off"></div>
					</td>
				</tr>
				<tr>
					<td class="item_th"><div><span>이메일</span></div></td>
					<td class="item_box">
						<div><input readonly="readonly" type="text" name="email" id="email" value="${mvo.email }${userId }" autocomplete="off"></div>
					</td>
				</tr>
				<tr>
					<td class="item_th">
						<div><span>가입일</span></div>
					</td>
					<td class="item_box">
						<div><input readonly="readonly" id="joindate" name="joindate" value="${mvo.regAt}"></div>
					</td>
				</tr>
			</table>
			
		</form>
	</div>
</div>


<jsp:include page="../common/footer.jsp" />