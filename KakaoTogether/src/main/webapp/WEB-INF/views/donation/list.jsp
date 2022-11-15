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
				<a href="/member/mypage?mno=${ses.mno }${userMno }"><span>내정보</span></a>
			</li>
			<li>
				<a href="/board/mylist/${ses.mno }${userMno }"><span>기부글 작성내역</span></a>
			</li>
			<li>
				<a href="/donation/list/${ses.mno }${userMno }"><span>내 기부내역</span></a>
			</li>
		</ul>
	</div> 
</div> 

<div style="width: 600px; padding: 10px; margin:auto; text-align:center; font-family: KakaoBold; font-size: 30px; color: #555;">
	<div style="margin-top: 20px;">
		<span>기부 내역</span><br>
	</div>
</div>

<div id="mydonation_wrap">
	<ul>
		<c:forEach var="dvo" items="${list}" > 
		<li>
		<a href="/board/detail?bno=${dvo.bno }" class="link_content">
			<div class="box">
				<span class="thumb_img">
					<img src="/upload/${fn:replace(dvo.boardImg,'\\','/')}">
					
				</span>
				<div class="text_box">
					<span class="title">
						<span class="txt_title"><span>${dvo.title }</span></span>
						<span class="txt_price">
							${dvo.donation }
							<span class="txt_won">원</span>
						</span>
					</span>
					<span class="date">${dvo.comment }</span>
					<span class="date" style="float: right;">${dvo.donationAt }</span>
				</div>
				<div class="reset"></div>
			</div>
			</a>
		</li>
		</c:forEach> 
	</ul>
	
</div>
<jsp:include page="../common/footer.jsp" />