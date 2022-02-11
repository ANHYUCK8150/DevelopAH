<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<script type="text/javascript">

function login(){
	var obj=document.login_form;	
	if(!obj.mbID.value){
			alert("아이디를 입력하세요.");
			obj.mbID.focus();
			return false;
	}
	var pattern = /^[^a-z0-9]|[^a-z0-9_]/;
	if (pattern.test(obj.mbID.value)){
		alert("올바른 아이디를 입력하세요.");
		obj.mbID.focus();
		return false;
	}

	if(obj.mbID.value.length<4){
		alert("아이디는 4자 이상입니다.");
		obj.mbID.focus();
		return false;
	}

	if(!obj.mbPW.value){
			alert("비밀번호를 입력하세요.");
			obj.mbPW.focus();
			return false;
	}

	obj.submit();			
}

$(document).ready(function(){
	
	$("#login_btn").click(function(){
		
		$(this).submit();
		
	});
	
});

</script>
<div class="ds_mall" style="margin-top:20px;">
	<div class="ds_login_article_wrap">
		
		<div class="goodsSearch">
            <div class="titleArea">
                <h2>로그인</h2>
                <ul class="pageArea">
                    <li class="firstArea"><a href="/" title="홈"></a></li>
                    <li class="nowArea">로그인</li>
                </ul>
            </div>
	           
			<form name="login_form" id="login_form" method="post" action="/Login_OK.do" onsubmit="login(); return false;">
	            <section class="join">
	                <div class="joinIp login">
	                    <dl>
	                        <dt>아이디</dt>
	                        <dd><label for="mbID"></label><input type="text" class="input_style valid" title="아이디를 입력하세요." value="" type="text" id="mbID" name="mbID"></dd>
	                    </dl>
	                    <dl class="nextDl">
	                        <dt>비밀번호</dt>
	                        <dd><label for="mbPW"></label><input type="password" class="input_style" maxlength="25" title="비밀번호를 입력하세요." id="mbPW" name="mbPW" ></dd>
	                    </dl>
	                    <div class="confirmArea">
	                        <button type="button"  id="login_btn"    class="loginBtn regItem">로그인</button>
	                    </div>
	                    <div class="loginOption">
	                        <ul>
	                            <li><a href="javascript:return false;">아이디찾기</a></li>
	                            <li><a href="javascript:return false;">비밀번호찾기</a></li>
	                            <li><a href="/member/confirm.do">회원가입</a></li>
	                        </ul>
	                    </div>
	                </div>
	            </section>
	           </form>

	
	       </div>
			
			
	</div>
		
</div>