<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="../common/header.jsp" />
<jsp:include page="../common/nav.jsp" />

<div style="width: 600px; padding: 10px; margin:auto; text-align:center; font-family: KakaoBold; font-size: 30px; color: #555;">
	<div style="margin-top: 150px;">
		<span>프로모션</span><br>
	</div>
</div>

<div id="prom_wrap">
	<ul>
		<c:forEach items="${list}" var="bvo">
		<li>
			<a href="/board/pmcontent?bno=${bvo.bno }&pageNo=${pgn.pgvo.pageNo }&qty=${pgn.pgvo.qty}" class="link_card">
				<span class="thumb_img">
					<img src="/upload/${fn:replace(bvo.boardImg,'\\','/')}">
				</span>
				<div class="text_box">
					<span class="title">${bvo.title}</span>
					<span class="cate">프로모션</span>
					<span class="date">${fn:substring(bvo.regAt, 0, (fn:length(bvo.regAt)-8))} ~ ${bvo.endDate}</span>
					
				</div>
			</a>
		</li>
		</c:forEach>
	</ul>
	
				<div class="" style="text-align: center; font-size: 18px; padding-top: 20px">
						<ul>
							<c:if test="${pgn.prev }">
								<li><a
									href="/board/promotion/?pageNo=${pgn.startPage-1 }&qty=${pgn.pgvo.qty }">이전</a></li>
							</c:if>
							<c:forEach begin="${pgn.startPage }" end="${pgn.endPage }"
								var="i">
								<li class="${pgn.pgvo.pageNo == i ? 'active' : '' }" style="margin-right: 10px"><a
									href="/board/promotion/?pageNo=${i }&qty=${pgn.pgvo.qty}" >${i }</a></li>
							</c:forEach>
							<c:if test="${pgn.next }">
								<li><a
									href="/board/promotion/?pageNo=${pgn.endPage+1 }&qty=${pgn.pgvo.qty }">다음</a></li>
							</c:if>
						</ul>
					</div>
	
</div>
<jsp:include page="../common/footer.jsp" />