<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="../common/header.jsp" />
<jsp:include page="../common/nav.jsp" />

<div id="wrap_cnt_prom">
	<c:set var = "bvo" value="${bdto.bvo }"/>
	<span id="bnoVal" style="display: none;">${bvo.bno}</span>
	<!-- Title Content -->
	<div class="wrap_top_summary">
		<div class="cover">
			<div class="front-pack">
				<span class="txt_sponsor">${bvo.writer}</span>
				<span class="tit_visual">${bvo.title}</span>
			</div>
		</div>
		<div class="cont_visual" style="background-image: url('/upload/${fn:replace(bvo.boardImg,'\\','/')}');">		
		</div>
	</div>
	
	<!-- Body Content -->
	<div id="body_cont">
		<div class="cont_box">
			<span class="img_ico"><img src="/resources/image/ico_pink_pot.png"></span>
			<span class="tit_head">${bvo.subTitle}</span>
			<span class="txt_body">${bvo.description}</span>
			
			<c:forEach items="${bdto.fileList }" var="fvo">
			<span class="img_body" style="background-image: url('/upload/${fn:replace(fvo.saveDir,'\\','/')}/${fvo.uuid }_${fvo.imageName }');"></span>
			</c:forEach>
		</div>
	</div>
	
	 <c:if test="${bvo.mno == ses.mno || bvo.mno == userMno}">
		<div id="btn_update">
			<a href="/board/modify?bno=${bvo.bno }"><span>수 정</span></a>		
		</div>
	</c:if> 
</div>


<jsp:include page="../common/footer.jsp" />