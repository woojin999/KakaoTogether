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
				<a href="/board/list?state=A&topic="><span class="${pgn.pgvo.state eq 'A'?'on':''}">모금중</span></a>
			</li>
			<li>
				<a href="/board/list?state=B&topic="><span class="${pgn.pgvo.state eq 'B'?'on':''}">모금후기</span></a>
			</li>
			<li>
				<a href="/wait"><span>나눔캠페인</span></a>
			</li>
		</ul>
	</div> <!-- end wrap_tab -->
</div> <!-- end contents -->

<div class="group_catelist">
	<div class="inner_catelist">
		<ul>
			<li>
				<a class=" ${pgn.pgvo.topic eq ''?'on':''}"  href="/board/list?state=${pgn.pgvo.state}&topic=">
					<img src="/resources/image/ico_all.png">
					<span>전체</span>
				</a>
			</li>
			<li>
				<a class=" ${pgn.pgvo.topic eq 'k'?'on':''}"   href="/board/list?state=${pgn.pgvo.state}&topic=k">
					<img src="/resources/image/ico_kidz.png">
					<span>어린이</span>
				</a>
			</li>
			<li>
				<a class=" ${pgn.pgvo.topic eq 'o'?'on':''}"   href="/board/list?state=${pgn.pgvo.state}&topic=o">
					<img src="/resources/image/ico_old.png">
					<span>어르신</span>
				</a>
			</li>
			<li>
				<a class=" ${pgn.pgvo.topic eq 'a'?'on':''}"   href="/board/list?state=${pgn.pgvo.state}&topic=a">
					<img src="/resources/image/ico_accessible.png">
					<span>장애인</span>
				</a>
			</li>
			<li>
				<a class=" ${pgn.pgvo.topic eq 'e'?'on':''}"   href="/board/list?state=${pgn.pgvo.state}&topic=e">
					<img src="/resources/image/ico_earth.png">
					<span>지구촌</span>
				</a>
			</li>
			<li>
				<a class=" ${pgn.pgvo.topic eq 'n'?'on':''}"   href="/board/list?state=${pgn.pgvo.state}&topic=n">
					<img src="/resources/image/ico_neighborhood.png">
					<span>어려운이웃</span>
				</a>
			</li>
		</ul>
	</div>
</div> <!-- end: group_catelist -->

<!-- 게시글 모음 -->
<div class="group_fundlist">
	<div class="sort_cate">
	 <%-- <input type="hidden" name="type" value="${pgn.pgvo.type}"> --%>
		<span class="inner_sort_cate">
			<a href="/board/list?state=${pgn.pgvo.state}&topic=${pgn.pgvo.topic}&type=a">
				<span class="box_sorting ${pgn.pgvo.type eq 'a'?'on':''}">최신순</span>
			</a>
			<a href="/board/list?state=${pgn.pgvo.state}&topic=${pgn.pgvo.topic}&type=b">
				<span class="box_sorting ${pgn.pgvo.type eq 'b'?'on':''}">종료임박순</span>
			</a>
		</span>
	</div>
	<ul class="list_fund">
		 <c:forEach items="${list }" var="bvo">
		<li class="listcard">
			<a href="/board/detail?bno=${bvo.bno }&pageNo=${pgn.pgvo.pageNo }&qty=${pgn.pgvo.qty}" class="link_content">
				<span class="img_box">
				<img class="img" src="/upload/${fn:replace(bvo.boardImg,'\\','/')}" alt="...">
				</span>
				<span class="text_box">
					<span class="title">${bvo.title}</span>
					<span class="agency">${bvo.writer}</span>
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
					<span class="price_goal"> ${bvo.finalPrice} </span>
				</span>
			</a>
		</li>
		</c:forEach>
	</ul>
			<div class="" style="text-align: center; font-size: 18px; padding-top: 20px">
						<ul>
							<c:if test="${pgn.prev }">
								<li><a
									href="/board/list/?pageNo=${pgn.startPage-1 }&qty=${pgn.pgvo.qty }&type=${pgn.pgvo.type}&topic=${pgn.pgvo.topic}">이전</a></li>
							</c:if>
							<c:forEach begin="${pgn.startPage }" end="${pgn.endPage }"
								var="i">
								<li class="${pgn.pgvo.pageNo == i ? 'active' : '' }" style="margin-right: 10px"><a
									href="/board/list/?pageNo=${i }&qty=${pgn.pgvo.qty}&type=${pgn.pgvo.type}&topic=${pgn.pgvo.topic}" >${i }</a></li>
							</c:forEach>
							<c:if test="${pgn.next }">
								<li><a
									href="/board/list/?pageNo=${pgn.endPage+1 }&qty=${pgn.pgvo.qty }&type=${pgn.pgvo.type}&topic=${pgn.pgvo.topic}">다음</a></li>
							</c:if>
						</ul>
					</div>
</div>
<jsp:include page="../common/footer.jsp" />