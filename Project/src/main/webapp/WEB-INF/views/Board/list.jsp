<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript">
	function changePaging(page){	
		$.ajax({
	        url: "board_ajax.do",
	        type: "POST",
	        data: {
	        	"nowPage" : page
	        	,"op" : "${title}"
	        	,"searchText" : $("#searchText").val()
	        	,"searchOption" : $("#searchOption").val()
	        },
	        success: function(data){
	        	$('#GridList').empty();
	            $('#GridList').html(data);
	        },
	        error: function(){
	            
	        }
	    });
	}
	
	
</script>

<div class="ds_mall" style = " width:1200px; margin:0 auto;">
	<div class="ds_sub_area" style="width:1200px;">
		<div class="titleArea">
			<c:choose>
				<c:when test="${title == 'notice' }">
					<h2>공지사항</h2> <span style="color:#999; float:left; height:32px; line-height:50px;"></span>
					<ul class="pageArea">
						<li class="firstArea"><a href="/" title="홈"></a></li>
						<li class="nowArea">공지사항</li>
					</ul>
				</c:when>
				<c:when test="${title == 'qna' }">
					<h2>질문과답변</h2> <span style="color:#999; float:left; height:32px; line-height:50px;"></span>
					<ul class="pageArea">
						<li class="firstArea"><a href="/" title="홈"></a></li>
						<li class="nowArea">질문과답변</li>
					</ul>
				</c:when>
			</c:choose>
		</div>
	</div>
	
	<div class="searchInput" style="float: right;">
		<div class="searchTotal">
			<select class="searchSelect" id="searchOption" name="searchOption">
				<option value="1"  selected="">제목</option>
				<option value="2">내용</option>
				<option value="3">작성자</option>
			</select>
			<input type="text" class="ipText" id="searchText" name="searchText" placeholder="검색어를 입력해주세요.">
			<a href="javascript:return false;" id="btnSearchTotal" class="btnSearchTotal" style="width: 60px; cursor: pointer;" onclick="changePaging(1);">검색</a>
		</div>
	</div>
	
	<div class="searchConditionArea floatBox">
		<!-- start detail -->
		<div id="GridList" style="float: none !important;">
			<div class="searchDetail">
				<!-- start condition option -->
				<div class="conditionOption">
					<div class="totalArea">
						<span class="tot">총 <span class="num">${ListCnt }</span></span> 
						<span class="pageNum">페이지 번호 <span><strong class="num">1</strong>
						<span class="slash">/<span class="totNum">${paging.lastPage }</span></span></span></span>
					</div>
				</div>
				<!-- end condition option -->
				<!-- start list 1 -->
				<div class="listDetailType01">
					<table style="border-collapse: collapse;">
						<colgroup>
							<col style="width: 70px;">
							<col style="width: 80px;">
							<col style="width: auto;">
							<col style="width: 160px;">
							<col style="width: 160px;">
						</colgroup>
						<thead>
							<tr>
								<th></th>
								<th>번호</th>
								<th>제목</th>
								<th>등록일</th>
								<th>작성자</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${BoradList }" var="BoradList">
								<tr>
									<td>
										<c:choose>
											<c:when test="${BoradList.qbState == '완료'}">
												<span style="background:#2fcb12; padding: 7px 10px; color: white;">${BoradList.qbState }</span>
											</c:when>
											<c:when test="${BoradList.qbState == '대기'}">
												<span style="background:#ccc; padding: 7px 10px; color: white;">${BoradList.qbState }</span>
											</c:when>
											<c:otherwise>
												<span><span style="background:black; padding: 7px 10px; color: white;">공지</span></span>
											</c:otherwise>
										</c:choose>
									</td>
									<td>${BoradList.qbNo }</td>
									<td style="text-align:left;"><a href="/board/view.do?op=${title }&qbIdx=${BoradList.qbIdx }" >${BoradList.qbSubject }</a></td>
									<td>${BoradList.qbRegDT }</td>
									<td>${BoradList.qbOwner }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<!-- end list 1 -->
				<div class="choiceBtn">
					<c:choose>
						<c:when test="${title == 'qna' }">
							<div class="regNewItem" id="regNewItem" style="margin-right:5px;">
								<a href="/board/reg.do?op=${title}">등록</a>
							</div>
						</c:when>
						<c:when test="${memberInfo.mbID == 'admin' }">
							<div class="regNewItem" id="regNewItem" style="margin-right:5px;">
								<a href="/board/reg.do?op=${title}">등록</a>
							</div>
						</c:when>
					</c:choose>
				</div>							
				<!-- start paging -->
				
				<div class="paging_wrap" style="margin-bottom:60px;">												
					<div id="pagination" class="paging">
						<a href = 'javascript:return false;' class="goFirst" alt="처음으로" onclick='changePaging(1)'></a> <!-- javascript:return false; -->
						<c:choose>
							<c:when test="${paging.startPage != 1 }">
								<a href="javascript:return false;" class="goPrev" title="이전페이지" onclick='changePaging(${paging.startPage - 1 })'></a>
							</c:when>
							<c:otherwise>
								<a href="javascript:return false;" class="goPrev" title="이전페이지" onclick='changePaging(${paging.startPage})'></a>
							</c:otherwise>
						</c:choose>
						<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
							<c:choose>
								<c:when test="${p == paging.nowPage }">
									<a class="pageNum on"><span>${p }</span></a>
								</c:when>
								<c:when test="${p != paging.nowPage }">
									<a class="pageNum" href="javascript:return false;" onclick='changePaging(${p})'><span>${p }</span></a>
								</c:when>
							</c:choose>
						</c:forEach>
						<c:choose>
							<c:when test="${paging.endPage != paging.lastPage}">
								<a class="goNext" title="다음페이지" href="javascript:return false;" onclick='changePaging(${paging.endPage+1 })'></a>
							</c:when>
							<c:otherwise>
								<a class="goNext" title="다음페이지" href="javascript:return false;" onclick='changePaging(${paging.endPage})'></a>
							</c:otherwise>
						</c:choose>
						<a class="goLast"   title="끝으로" href="javascript:return false;" onclick='changePaging(${paging.lastPage })'></a>
					</div>
				</div>
				<!-- end paging -->
			</div>
		</div>
	</div>
</div>