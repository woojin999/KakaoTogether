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
				<a href="/member/mypage?mno=${ses.mno }"><span>내정보</span></a>
			</li>
			<li>
				<a href="/board/mylist/${ses.mno }"><span>기부 글 작성내역</span></a>
			</li>
			<li>
				<a href="/wait"><span>내 기부내역</span></a>
			</li>
		</ul>
	</div> 
</div> 


<div class="group_fundlist">
	

	<ul class="list_fund">
		 <c:forEach items="${list }" var="bvo">
		<li class="listcard" style="margin-bottom: 20px">
			<a href="/board/detail?bno=${bvo.bno }&pageNo=${pgn.pgvo.pageNo }&qty=${pgn.pgvo.qty}" class="link_content">
				<span class="img_box">
				<img class="img" src="/upload/${fn:replace(bvo.boardImg,'\\','/')}" alt="...">
				</span>
				<span class="text_box">
					<span class="title">${bvo.title}</span>
					<span class="agency">${bvo.writer}</span>
					<input type="hidden" id="mno" name="mno" value="${ses.mno}">
					<span class="state">
						<span class="state_bar"></span>
							<c:set var="state" value="120"/>
							<c:set var="state" value="300"/>
							
							<c:if test="${(bvo.finalPrice/bvo.price*100) < 101 }">
								<span class="state_ing" style="width: ${bvo.finalPrice/bvo.price*100}%;"></span>
							</c:if>
							<c:if test="${(bvo.finalPrice/bvo.price*100) > 100 }">
								<span class="state_ing" style="width: 100%;"></span>
							</c:if>
					</span>
					<span class="price_goal" style="margin-top: 9px;"> ${bvo.finalPrice} </span>
				</span>
			</a>
		</li>
		</c:forEach>
	</ul>
	
	<div class="" style="text-align: center; font-size: 18px; padding-top: 20px">
						<ul>
							<c:if test="${pgn.prev }">
								<li><a
									href="/board/mylist/${22}?pageNo=${pgn.startPage-1 }&qty=${pgn.pgvo.qty }&type=${pgn.pgvo.type}">이전</a></li>
							</c:if>
							<c:forEach begin="${pgn.startPage }" end="${pgn.endPage }"
								var="i">
								<li class="${pgn.pgvo.pageNo == i ? 'active' : '' }" style="margin-right: 10px"><a
									href="/board/mylist/${22}?pageNo=${i }&qty=${pgn.pgvo.qty}&type=${pgn.pgvo.type}" >${i }</a></li>
							</c:forEach>
							<c:if test="${pgn.next }">
								<li><a
									href="/board/mylist/${22}?pageNo=${pgn.endPage+1 }&qty=${pgn.pgvo.qty }&type=${pgn.pgvo.type}">다음</a></li>
							</c:if>
						</ul>
					</div>
</div>
<jsp:include page="../common/footer.jsp" />