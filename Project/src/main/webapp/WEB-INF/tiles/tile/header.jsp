<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script>
	$(function(){
		$('.gnb_wrap .sub_menu0 > li').hover(function(){//1depth에 마우스 올렸을 때
			$('.gnb_wrap .sub_menu0 > li').removeClass('on');
			$(this).addClass('on');
			if($(this).find('.sub_depth1').length){//하위 메뉴 있을 때
				$('.gnb_wrap .sub_menu0').addClass('on');
				$('#header_warp > .dim_layer').show();
			}else{
				$('.gnb_wrap .sub_menu0').removeClass('on');
				$('#header_warp > .dim_layer').hide();
			}
		});
		
		$('.gnb_wrap .sub_menu0').mouseleave(function(){//gnb 메뉴에서 마우스 벗어났을 때
			$('.gnb_wrap .sub_menu0, .gnb_wrap .sub_menu0 > li').removeClass('on');
			$('#header_warp > .dim_layer').hide();
		});
		
		$('.gnb_wrap .search').click(function(){//gnb 검색 클릭시
			$('.header_search').addClass('on');
		});
		
		$('.header_search .dim_layer').click(function(){//gnb 검색 dim 클릭 시
			$('.header_search').removeClass('on');
		});
		
		$(function(){//스크롤시 사이드바 고정
			var nav = $('header');
			$(window).scroll(function () {
				if ($(this).scrollTop() > 0) {
					nav.addClass("fixed");
				} else {
					nav.removeClass("fixed");
				}
			});
		});
		
		$('.mo_menu').click(function(){//모바일 네이게이션 여닫기
			$('.mo_nav_wrap').addClass('on');
			$('body').css({'overflow':'hidden','height':'100%'});
		});
		
		$('.mo_nav_close, .mo_nav_wrap .dim_layer').click(function(){//gnb 검색 dim 클릭 시
			$('.mo_nav_wrap').removeClass('on');
			$('body').css({'overflow':'auto','height':'auto'});
		});
		
		$('.mo_nav_cont li .arrow').click(function(){//모바일 네비게이션 메뉴 2depth 여닫기
			$(this).next('.sub_depth1').slideToggle(200);
			$(this).closest('li').toggleClass('active');
		});
		
		$('.gnb_wrap .search').click(function(){
			$('body').css({'overflow-y':'hidden'});
		});
		
		$('.header_search .dim_layer').click(function(){
			$('body').css({'overflow-y':'auto'});
		});
		
		$('.top_search_cont .back_btn').click(function(){
			$('.header_search ').removeClass('on');
			$('body').css({'overflow-y':'auto'});
		});
		
	});
</script>

<header>
	<div class="contents_mot">
		<div class="gnb_wrap">
			<div class="logo_wrap"><a href="/home.do" class="logo">개발자 안혁</a></div>
			<ul class="gnb_menu sub_menu0">
		        <li class='  '>
		            <a href="../intro/resume.do" >소개하기</a>
		        </li>
		        <li class='  '>
		            <a href="../project/list.do" >프로젝트</a>
		        </li>
		        <li class='  active'>
		            <a href="../board/board.do?op=notice" >게시글</a>
					<span class="arrow"></span>
		            <ul class="sub_depth1">
		                <li >
		                	<a href="../board/board.do?op=notice" >공지사항</a>
		                </li>
		                <li >
		                	<a href="../board/board.do?op=qna" >QnA</a>
		                </li>
		            </ul>
		        </li>
		    </ul>
<!-- //sub_menu_box -->
			<div class="icon_wrap">
				<c:choose>
	        		<c:when test="${memberInfo.mbIdx != null}">
	        			<div style="line-height:30px; margin-right:7px;">${memberInfo.mbNM } &nbsp; [${memberInfo.mbID }]</div>
						<a href="/Logout.do" class="logout mo_dn">로그아웃</a>
	        		</c:when>
	        		<c:otherwise>
	        			<a href="../member/login.do" class="login mo_dn">로그인</a>
						<a href="../member/confirm.do" class="mypage mo_dn">마이페이지</a>
	        		</c:otherwise>
	        	</c:choose>
			</div>
		</div>
	</div>
</header>

