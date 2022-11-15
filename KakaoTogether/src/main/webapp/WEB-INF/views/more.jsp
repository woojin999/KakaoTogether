<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="common/header.jsp" />
<jsp:include page="common/nav.jsp" />

<div style="width: 600px; padding: 150px; margin:auto; text-align:center; font-family: KakaoBold; font-size: 30px; color: #555;">
	<div style="margin-top: 20px; margin-bottom: 10px">
		<span>카카오 같이가치 제작기</span><br>
		<span style="font-family: KakaoLight;  font-size: 20px;">프로젝트 기획 - 개발 범위 소개</span><br><br>
		<div class="img" style="margin-bottom: 10px;"><img class="profile" src="/resources/image/lwj.jpg"></div>
		<span style="font-family: KakaoLight; font-size: 15px;">Java / Spring framework</span><br>
		<span style="font-family: KakaoLight; font-size: 20px;">1차 개발</span><br>
		<span style="font-family: KakaoLight; font-size: 15px;">회원 관리 기능 - 회원 가입, 로그인 및 로그아웃</span><br>
		<span style="font-family: KakaoLight; font-size: 15px;">게시판 관리 기능 - 카테고리 별 조회, 페이징, 파일 첨부, 게시글 등록, 수정</span><br>
		<span style="font-family: KakaoLight; font-size: 15px;">기부 및 응원하기 기능 - 기부 금액 증가, 응원 수 증가</span><br>
		<span style="font-family: KakaoLight; font-size: 15px;">회원 활동 내역 관리 기능 - 마이페이지(나의글, 내 기부)</span><br>
		<span style="font-family: KakaoLight; font-size: 12px;">개발기간: 2022.11.03.~2022.11.14.</span><br>
	</div>
</div>

<style>
.img {
	margin: auto;
    width: 150px;
    height: 150px; 
    border-radius: 70%;
    overflow: hidden;
    
}
.profile {
    width: 100%;
    height: 100%;
    object-fit: cover;
    float: right;
}
</style>

<jsp:include page="common/footer.jsp" />