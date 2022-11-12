<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="../common/header.jsp" />
<jsp:include page="../common/nav.jsp" />

<div id="page_join">
	<div id="main">
		<div class="title">
			<span class="bold">회원 가입</span>
		</div>
		<form action="/member/register" id="join_form" name="joinForm" method="post">
			<table class="join_table">
				<tr>
					<td class="item_th">
						<div><span>이름</span></div>
					</td>
					<td class="item_box">
						<div><input type="text" id="userName" name="userName" placeholder="이름을 입력하세요" autocomplete="off"></div>
					</td>
				</tr>
				<tr>
					<td class="item_th">
						<div><span>아이디</span></div>
					</td>
					<td class="item_box">
						<div><input type="text" id="userId" name="userId"  placeholder="아이디를 입력하세요" autocomplete="off"></div>
					</td>
				</tr>
				<tr>
					<td class="item_th">
						<div><span>비밀번호</span></div>
					</td>
					<td class="item_box">
						<div><input type="password" id="pwd" name="pwd" placeholder="비밀번호를 입력하세요" autocomplete="off"></div>
					</td>
				</tr>
				<tr>
					<td>주소</td>
					<td class="td_addr">
						<input type="text" name="postnum" id="postnum" placeholder="우편번호">
						<input type="button" onclick="execDaumPostcode()" value="우편번호 찾기">
						<input type="text" name="addr" id="addr" placeholder="도로명주소">
					</td>
				</tr>
				<tr>
					<td class="item_th"><div>전화번호</div></td>
					<td class="item_box">
						<div><input type="text" id="phone" name="phone" placeholder="전화번호를 입력하세요" autocomplete="off"></div>
					</td>
				</tr>
				<tr>
					<td class="item_th">이메일</td>
					<td class="item_box">
						<div><input type="text" id="email" name="email" placeholder="이메일을 입력하세요" autocomplete="off"></div>
					</td>
				</tr>
			</table>
			<div class="wrap_btn">
				<button type="submit" class="submit_box">회원가입</button>
			</div>
		</form>
	</div>
</div>

<jsp:include page="../common/footer.jsp" />