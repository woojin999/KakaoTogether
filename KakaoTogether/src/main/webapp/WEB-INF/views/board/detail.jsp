<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="../common/header.jsp" />
<jsp:include page="../common/nav.jsp" />

<div id="wrap_content">
	<c:set var = "bvo" value="${bdto.bvo }"/>
	<span id="bnoVal" style="display: none;">${bvo.bno}</span>
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
			<span class="txt_price"><fmt:formatNumber value="${bvo.finalPrice}" pattern="#,###" /><span class="txt_won">원</span></span>
			<span class="txt_state" ><fmt:formatNumber value="${bvo.price }" pattern="#,###" />원 목표</span>
		</div>
		
		
		
		<!---- 댓글 ------>
		<div class="body_cont">
			<div class="cont_box" id="donaZone"></div>
				<div class="body_cont" >  	
				<div class="list_more">
					<button type="button" data-page="1" id="moreBtn" class="link_round">
  						더보기
  					</button>
				</div>
  					
 				</div>
			</div>
			<!--------  -->
		</div>
	
	<!-- 수정하기 btn -->
	 <c:if test="${bvo.mno == ses.mno || bvo.mno == userMno}">
		<div id="btn_update">
			<a href="/board/modify?bno=${bvo.bno }"><span>수 정</span></a>		
		</div>
	</c:if> 
	
	<!-- 응원하기 하단바 -->
	<div class="fund_float">
		
		
		<c:if test="${userId eq null && ses.mno eq null}">
		
		<a href="/member/login">
		<button type="button" class="btn_c chrBtn" id="chrBtn" data-bno="${bvo.bno }">
			<span class="ico_cheer"><img src="/resources/image/ico_cheer.svg"></span>
			<span class="txt_cheer">응원</span>
			<span class="txt_cheer chrnum" id="chrnum" style="font-size: 15px; color: lightgray;">${bvo.cheer}</span>
		</button></a>
		<a class="btn_s" href="/member/login" >
			<span class="ico_share"><img src="/resources/image/ico_share.svg"></span>
			<span class="txt_share">공유</span>
		</a>
		<c:if test="${bvo.state eq 'A'}">
		<a class="btn_d" href="/member/login">
			<span>기부하기</span>
		</a>
		</c:if>
		
		<c:if test="${bvo.state eq 'B'}">
		<a class="btn_d" href="/member/login">
			<span style="color: #444;">기부종료</span>
		</a>
		</c:if>
		
		</c:if>
		
		
		<c:if test="${ses.mno ne null || userId ne null}">
		<a>
		<button type="button" class="btn_c chrBtn" id="chrBtn" data-bno="${bvo.bno }">
			<span class="ico_cheer"><img src="/resources/image/ico_cheer.svg"></span>
			<span class="txt_cheer">응원</span>
			<span class="txt_cheer chrnum" id="chrnum" style="font-size: 15px; color: lightgray;">${bvo.cheer}</span>
		</button></a>
		<a class="btn_s kakaotalk" id="btnKakao" onclick="fn_sendFB('kakaotalk');return false;" target="_self" title="카카오톡 새창열림">
			<span class="ico_share"><img src="/resources/image/ico_share.svg"></span>
			<span class="txt_share">공유</span>
		</a>
		<c:if test="${bvo.state eq 'A'}">
		<a class="btn_d" onclick="donate_open(${3333})">
			<span>기부하기</span>
		</a>
		</c:if>
		
		<c:if test="${bvo.state eq 'B'}">
		<a class="btn_d">
			<span style="color: #444;">기부종료</span>
		</a>
		</c:if>
		</c:if>
		
<!-- 모달 -->
<div id="wrap_donation">
	<form action="/donation/register" method="post" name="donationForm" class="form">
		<input type="hidden" id="bno" name="bno" value="${bvo.bno}">
		<input type="hidden" id="mno" name="mno" value="${ses.mno}${userMno }">
		<input type="hidden" id="donaName" name="donaName" value="${ses.userName}${userNickname }">
		<div class="wrap_fund">
			<div class="list_pay">
				<span class="txt_tit">기부금 결제</span>
				<a class="btn_close" onclick="donate_close()"><img src="/resources/image/btn_close.png"></a>
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
				<input type="hidden" id="donation" name="donation" value="0">
				<div class="reset"></div>
			</div>
			<div class="write_box">
				<span class="txt_tit">응원 댓글 쓰기</span>
				<textarea id="comment" name="comment" placeholder="따뜻한 한마디를 남겨주세요" required="required"></textarea>
				<div class="reset"></div>
			</div>
			<div class="donation_info">
				<span>기부 내역은 마이페이지에서 확인해 주세요</span>
			</div>
		</div>
		<div class="wrap_btn_type">
			<button type="submit" class="btn" id="regBtn"><span>기부하기</span></button>
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


function fn_sendFB(sns) {
	var thisUrl = document.URL;
	var snsTitle = "카카오 같이가치";
	var desc = "${bvo.subTitle}";
	
	
	if( sns == 'kakaotalk' ) {
	    // 사용할 앱의 JavaScript 키 설정
	    Kakao.init('abc6778f0de6df09ed6416d7651ccd5f');
	    
	    // 카카오링크 버튼 생성
	    Kakao.Link.createDefaultButton({
	        container: '#btnKakao', // HTML에서 작성한 ID값
	        objectType: 'feed',
	        content: {
	        title: "${bvo.title}", // 보여질 제목
	        description: desc, // 보여질 설명
	        imageUrl: 'https://ifh.cc/g/4SQoPz.png', // 콘텐츠 URL
	        link: {
	            mobileWebUrl: thisUrl,
	            webUrl: thisUrl
	        }
	        }
	    });
	}
}
</script>
<script>
document.addEventListener('DOMContentLoaded', function(){
	getDonationList(document.getElementById('bnoVal').innerText);
});

</script>

<script src="/resources/js/donation.register.js"></script>
<script src="/resources/js/donation.list.js"></script>
<script src="/resources/js/board.cheerup.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

</div>
</div> 
<jsp:include page="../common/footer.jsp" />