<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="../common/header.jsp" />
<jsp:include page="../common/nav.jsp" />

<div id="wrap_content">
	<c:set var = "bvo" value="${bdto.bvo }"/>
	<!-- Title Content -->
	<div class="wrap_top_summary">
		<div class="cover">
			<div class="front-pack">
				<span class="tit_visual">${bvo.title}</span>
				<span class="txt_sponsor">${bvo.writer}</span>
				<div class="hash_group">
					<a class="topic_hash">${bvo.topic}</a>
					<a class="link_hash">${bvo.keyword1}</a>
					<c:if test="${not empty bvo.keyword2}">
						<a class="link_hash">${bvo.keyword2}</a>
					</c:if>
					<c:if test="${not empty bvo.keyword3}">
						<a class="link_hash">${bvo.keyword3}</a>
					</c:if>
				</div>
			</div>
		</div>
		<div class="cont_visual" style="background-image: url('/upload/${fn:replace(bvo.boardImg,'\\','/')}');">		
		</div>
	</div>
	<!-- Body Content -->
	<div id="body_cont">
		<div class="cont_box">
			<span class="tit_head">${bvo.subTitle}</span>
			<span class="txt_body">${bvo.description}
			</span>
			<c:forEach items="${bdto.fileList }" var="fvo">
			
			<span class="img_body" style="background-image: url('/upload/${fn:replace(fvo.saveDir,'\\','/')}/${fvo.uuid }_${fvo.imageName }');">
			
			</span>
			</c:forEach>
		</div>
		
		<div class="price_box">
			<span class="txt_price">${bvo.finalPrice }<span class="txt_won">원</span></span>
			<span class="txt_state">${bvo.price }원 목표</span>
		</div>
		
		<div class="comments_wrap">
			<div class="num_box">
				<span class="txt_tit">댓글</span>
				<span class="txt_num">3</span>
			</div>
			<c:forEach var="comments" items="${commentsList}">
				<div class="comments_box">
					<span class="txt_info">
						<span>woojin</span>
						<span>3000원</span>
						<span>2022-11-07</span>
					</span>
					<div class="txt_cmt">
						<span>응원해요</span>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	<!-- 수정하기 btn -->
	<%-- <c:if test="${content.writer == loginIdx}"> --%>
		<div id="btn_update">
			<a href="/board/modify?bno=${bvo.bno }"><span>수 정</span></a>		
		</div>
	<%-- </c:if> --%>
	
	<!-- 응원하기 하단바 -->
	<div class="fund_float">
		<a class="btn_c" onclick="cheer(${content.idx}, ${loginIdx})">
			<span class="ico_cheer"><img src="${imgSrc}/ico_cheer.svg"></span>
			<span class="txt_cheer">응원</span>
			<span class="num_active">${cheer}</span>
		</a>
		<a class="btn_s" onclick="share()">
			<span class="ico_share"><img src="${imgSrc}/ico_share.svg"></span>
			<span class="txt_share">공유</span>
		</a>
		<a class="btn_d" onclick="donate_open(${3333})">
			<span>기부하기</span>
		</a>
		
<!-- 모달 -->
<div id="wrap_donation">
	<form action="/donation.action" method="post" name="donationForm" class="form">
		<input type="hidden" name="mIdx" value="${loginIdx}">
		<input type="hidden" name="cIdx" value="${content.idx}">
		<div class="wrap_fund">
			<div class="list_pay">
				<span class="txt_tit">기부금 결제</span>
				<a class="btn_close" onclick="donate_close()"><img src="${imgSrc}/btn_close.png"></a>
				<span class="txt_info">무통장은 3천원, 기타 결제는 1천원부터 가능합니다.</span>
				<ul>
					<li><a onclick="changePrice(1000)"><span>+ 1천원</span></a></li>
					<li><a onclick="changePrice(5000)"><span>+ 5천원</span></a></li>
					<li><a onclick="changePrice(10000)"><span>+ 1만원</span></a></li>
					<li><a onclick="changePrice(50000)"><span>+ 5만원</span></a></li>
					<li><a onclick="changePrice(0)"><span>다시 입력</span></a></li>
				</ul>
				
				<span class="txt_price">원</span>
				<span class="price">0</span>
				<input type="hidden" name="price" value="0">
				<div class="reset"></div>
			</div>
			<div class="write_box">
				<span class="txt_tit">응원 댓글 쓰기</span>
				<textarea id="comment" name="comment" placeholder="따뜻한 한마디를 남겨주세요"></textarea>
				<div class="reset"></div>
			</div>
			<div class="donation_info">
				<span>결제 내역은 마이페이지에서 확인해 주세요</span>
			</div>
		</div>
		<div class="wrap_btn_type">
			<a class="btn" onclick="donate_go()"><span>결제하기</span></a>
		</div>
	</form>
</div>
<div id="black_bg_donation"></div>




<script type="text/javascript">

function donate_open(mIdx){
	if (mIdx != 0){
		$('#wrap_donation').css("display", "block");
	} else {
		alert("로그인 후 이용 가능합니다");
	}
}

function donate_close(){
	$('#black_bg_donation').css("display", "none");
	$('#wrap_donation').css("display", "none");
}
</script>



</div>
</div> 
<jsp:include page="../common/footer.jsp" />