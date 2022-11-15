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
				<a href="/board/mylist/${ses.mno }${userMno }"><span>기부 글 작성내역</span></a>
			</li>
			<li>
				<a href="/donation/list/${ses.mno }${userMno }"><span>내 기부내역</span></a>
			</li>
		</ul>
	</div> 
</div> 

<div id="mydonation_wrap">
	<ul>
	<%-- 	<c:forEach var="mydonation" items="${MydonationList}" varStatus="status"> --%>
		<li>
			<div class="box">
				<span class="thumb_img">
					<img src="${imgSrc}/for-test/${mydonation.image0}">
					
				</span>
				<div class="text_box">
					<span class="title">
						<span class="txt_title"><span>제목</span></span>
						<span class="txt_price">
							100000
							<span class="txt_won">원</span>
						</span>
					</span>
					<span class="date">날짜</span>
				</div>
				<div class="reset"></div>
			</div>
			
		</li>
		<%-- </c:forEach> --%>
	</ul>
	
</div>
<jsp:include page="../common/footer.jsp" />