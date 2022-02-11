<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="searchDetail">
	<!-- start condition option -->
	<div class="conditionOption">
		<div class="totalArea">
			<span class="tot">총 <span class="num">${QnaListCnt }</span></span> 
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
				<col style="width: auto;">
				<col style="width: 70px;">
				<col style="width: 160px;">
				<col style="width: 160px;">
			</colgroup>
			<thead>
				<tr>
					<th>번호</th>
					<th>글제목</th>
					<th>조회수</th>
					<th>등록일</th>
					<th>작성자</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${QnaList }" var="QnaList">
					<tr>
						<c:choose>
							<c:when test="${QnaList.qbParent != 0 }">
								<td><img src="/resources/images/reply_icon.png" width="16px" /></td>
							</c:when>
							<c:otherwise>
								<td>${QnaList.qbNo }</td>
							</c:otherwise>
						</c:choose>
						<td style="text-align:left;"><a href="/QnaView?pbIdx=${QnaList.qbIdx }" >${QnaList.qbSubject }</a></td>
						<td>${QnaList.qbCnt }</td>
						<td>${QnaList.qbRegDT }</td>
						<td>${QnaList.qbOwner }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<!-- end list 1 -->
	<div class="choiceBtn">
		<div class="regNewItem" id="regNewItem" style="margin-right:5px;">
			<a href="/QnaList_Reg">등록</a>
		</div>
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