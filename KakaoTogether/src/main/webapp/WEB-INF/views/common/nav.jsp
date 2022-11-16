<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<div id="top_wrap">
	<div id="wrap_logo">
		<a class="mainLogo" href="/"><img src="/resources/image/main_logo.png"></a>
	</div>
	<nav id="wrap_topCate" class="" style="position: static; top: initial;">
		<ul class="inner">
			<li>
				<a href="/board/list?state=A&topic=">
					<span>같이기부</span>
				</a>
			</li>
			<li>
				<a href="/board/promotion">
					<span>프로모션</span>
				</a>
			</li>
			<li>
				<a href="/wait">
						<span>마음날씨</span>
				</a>
			</li>
			<li>
				<a href="/more">	
						<span>더보기</span>
				</a>
			</li>
		</ul>
	</nav>
	
	<nav id="wrap_util">
		<ul class="inner">
		
			<c:choose>
				<c:when test="${ses.mno ne null && ses.mno ne '' || userId ne null}">
			
				<li>
				<a class="link_util link_fund" href="/board/register" 
				 style="background-color:#dc287c; border-color:#dc287c;">등록하기</a>
			</li>
			<li>
				<a class="link_util link_login" href="/member/mypage?mno=${ses.mno }${userMno }" 
				 style="background-color:#333; border-color:#333; color: #fff;">마이페이지</a>
			</li>
			<c:if test="${userId ne null }">
			<li>
				<span class="link_util link_login">${userNickname } 님</span>
			</li>
			<li>
				<a class="link_util link_login" href="/member/kakaologout">로그아웃</a>
			</li>
			</c:if>
			<c:if test="${ses.mno ne null }">
			<li>
				<a class="link_util link_login" href="/member/logout">로그아웃</a>
			</li>
			</c:if>
				</c:when>
				
				<c:otherwise>
			<li>
				<a class="link_util link_login" href="/member/login">로그인</a>
			</li>
				<li>
				<a class="link_util link_fund" href="/member/register">회원가입</a>
			</li>
				</c:otherwise>
			</c:choose>
			
		</ul>
	</nav>
</div>