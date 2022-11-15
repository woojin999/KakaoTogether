<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="../common/header.jsp" />
<jsp:include page="../common/nav.jsp" />

<div id="page_login">
	<div id="main">
		<div class="title" style="text-align: center;">
			<span class="bold" >회원 로그인</span>
		</div>
		<form action="/member/login" id="login_form" name="loginForm" method="post">
			<input type="hidden" name="next">
			<div class="item_box"> 
				<div><input type="text" id="userId" name="userId" placeholder="아이디를 입력하세요" autocomplete="off" required="required"></div>
			</div>
			<div class="item_box">
				<div style="margin-top: 20px;"><input type="password" id="pwd" name="pwd" placeholder="비밀번호를 입력하세요" autocomplete="off" required="required"></div>
			</div>
			<div class="wrap_btn" >
				<button type="submit" class="submit_box" style="width: 100%; font-size: 20px; border-radius: 10px;">로그인</button>
				<span class="line_or">
					<span class="lineL"></span>
					<span class="txt_or">또는</span>
					<span class="lineR"></span>
					<c:if test="${userId eq null }">
						<a href="https://kauth.kakao.com/oauth/authorize?client_id=c6a565a9fd74e9db2346c1c630dd5faf&redirect_uri=http://localhost:8090/member/kakaologin&response_type=code">
							<img alt="" src="/resources/image/kakao_login_large_wide.png" style="width: 100%; padding-top: 10px;">
						</a>
					</c:if>
				</span>
			</div>
		</form>
		
	</div>
</div>


<jsp:include page="../common/footer.jsp" />