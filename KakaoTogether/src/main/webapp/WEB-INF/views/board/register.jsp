<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="../common/header.jsp" />
<jsp:include page="../common/nav.jsp" />

<form action="/board/register" method="post" enctype="multipart/form-data">
<div id="wrap_write">
	<%-- <input type="hidden" name="idx" value="${idx}">
	<input type="hidden" name="mode" value="${mode}">
	<input type="hidden" name="cCate" value="${cate}">
	<input type="hidden" name="writer" value="${writer}"> 
	<input type="hidden" name="tTopic" value="${topic}">
	<input type="hidden" name="sSubtopic" value="${subtopic}"> --%>
	<input type="hidden" name="mno" id="mno" value="${ses.mno }"> 
	<table class="main">
		<tr>
			<td colspan="3">
				<div class="top_title">
					<span class="light">
						글 등록하기
					</span>
				</div>
			</td>
		</tr>
		<tr class="tr_oneLine">
			<th><span>제목</span></th>
			<td colspan="2"><div class="bottom_line"><input  id="title" name="title" placeholder="제목을 입력해주세요" ></div></td>
		</tr>
		<tr class="tr_oneLine">
			<th><span>소제목</span></th>
			<td colspan="2"><div class="bottom_line"><input  id="subTitle" name="subTitle" placeholder="소제목을 입력해주세요" ></div></td>
		</tr>
		<tr class="tr_oneLine">
			<th><span>작성자</span></th>
			<td colspan="2"><div class="bottom_line"><input type="text" id="writer" name="writer" ></div></td>
		</tr>
	
		<tr class="tr_oneLine">
			<th>카테고리 분류</th>
			<td style="width: 60%;">
				<!-- '모금중'일 경우 주제 선택 -->
				<span>모금 대상</span>
				<select id="topic" name="topic" class="subtopic">
					<option value="0">주제 선택</option>
					<option value="kids">어린이</option>
					<option value="olds">어르신</option>
					<option value="accessible">장애인</option>
					<option value="earth">지구촌</option>
					<option value="neighborhood">어려운이웃</option>
				</select>
				<span>&emsp;카테고리</span>
				<select id="state" name="state" class="subtopic">
					<option value="0">주제 선택</option>
					<option value="A">모금진행</option>
					<option value="B">모금후기</option>
				</select>
			</td>
			<td>
			</td>
		</tr>
		<tr>
			<th>본문</th>
			<td colspan="2"><textarea name="description" placeholder="내용을 입력해주세요"></textarea></td>
		</tr>
		<tr class="tr_oneLine" id="price" >
			<th><span>목표 금액</span></th>
			<td colspan="2"><div class="bottom_line"><input type="text" name="price" placeholder="단위를 제외한 숫자를 적어주세요 (ex. 1000000)" autocomplete="off"></div></td>
		</tr>

		<tr id="tag_wrap" >
			<th class="tr_oneLine">태그 설정</th>
			<td colspan="2">
				<div class="input_tag"><input type="text" name="keyword1" placeholder="태그1 (필수)"></div>
				<div class="input_tag"><input type="text" name="keyword2"  placeholder="태그2 (선택)"></div>
				<div class="input_tag"><input type="text" name="keyword3"  placeholder="태그3 (선택)"></div>
			</td>
		</tr>
		
		<tr class="tr_oneLine" id="enddate_wrap">
			<th>종료일</th>
			<td colspan="2"><div class="bottom_line"><input type="text" id="endDate" name="endDate" placeholder="종료일을 입력해주세요 (ex. 2022-11-04)" autocomplete="off"></div></td>
		</tr>
	<tr>
			<th class="tr_oneLine">이미지</th>
			<td colspan="2"><div class="bottom_line"><input type="file" id="files" name="fileAttached" accept=".gif, .jpg, .png, .jpeg, .gif"  multiple></div></td>
		</tr>
	</table>
	
	<div class="wrap_btxn">
		<button type="submit" class="submit_box" id="regBtn"><span>등록하기</span></button>

	</div>
	
</div>
</form>
<jsp:include page="../common/footer.jsp" />