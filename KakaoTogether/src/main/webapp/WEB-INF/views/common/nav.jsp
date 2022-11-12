<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%-- <c:set var="url" value="${requestScope['javax.servlet.forward.request_uri']}" /> --%>
<div id="top_wrap">
	<div id="wrap_logo">
		<a class="mainLogo" href="/"><img src="/resources/image/main_logo.png"></a>
	</div>
	<nav id="wrap_topCate" class="" style="position: static; top: initial;">
		<ul class="inner">
			<li>
				<a href="/board/list?state=A&topic=">
					<span class="on">같이기부</span>
				</a>
			</li>
			<li>
				<a href="/prom">
					<span class="on">프로모션</span>
				</a>
			</li>
			<li>
				<a href="/moreinfo">	
						<span class="on">더보기</span>
				</a>
			</li>
			<li>
				<a href="/sendmail">
						<span>Contact</span>
				</a>
			</li>
		</ul>
	</nav>
	
	<nav id="wrap_util">
		<ul class="inner">
		
			<c:choose>
				<c:when test="${ses.mno ne null && ses.mno ne '' }">
				<li>
				<a class="link_util link_fund" href="/board/register" 
				 style="background-color:#dc287c; border-color:#dc287c;">등록하기</a>
			</li>
			<li>
				<a class="link_util link_login" href="/member/mypage" 
				 style="background-color:#333; border-color:#333; color: #fff;">마이페이지</a>
			</li>
			<li>
				<a class="link_util link_login" href="/member/logout">로그아웃</a>
			</li>
				</c:when>
				
				<c:otherwise>
				<li>
				<a class="link_util link_fund" href="/member/register">회원가입</a>
			</li>
			<li>
				<a class="link_util link_login" href="/member/login">로그인</a>
			</li>
				</c:otherwise>
			</c:choose>
			
			<li>
				<a class="btn_search" href="/search"><span class="ico_search"><img src="/resources/image/ico_search_01.svg"></span></a>
			</li>
		</ul>
	</nav>
</div>