<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script type="text/javascript">	
		$(document).ready(function(){
			
			$("#SubmitButton").click(function(){
				location.href="QnaList_Reg?qbIdx=" + $("#qbIdx").val();
			});
			
			$("#CancelButton").click(function(){
				location.href="QnA";
			});
			
			$("#ReplyButton").click(function(){
				location.href="QnaList_Reg?option=reply&qbIdx=" + $("#qbIdx").val();
			});
			
			
		});
	</script>
	<div class="ds_mall" style = " width:1200px; margin:0 auto;">
		<div class="ds_sub_area" style="width:1200px;">
			<div class="titleArea">
				<h2>질문과 답변</h2>
				<span style="color:#999; float:left; height:32px; line-height:50px;"></span>
			</div>
		</div>
		
		<form id="regForm" enctype="multipart/form-data">
			<input type="hidden" id="qbIdx" name="qbIdx" value="${qnaList.qbIdx }">
			<table class="rq_table">
				<colgroup>
					<col style="width:15%;">
					<col style="width:35%;">
					<col style="width:15%;">
					<col style="width:35%;">
				</colgroup>
				<tbody>
					<tr>
						<th scope="row" class="thead">
							<label>글 번호</label>
						</th>
						<td>
							<label>${qnaList.qbNo }</label>
						</td>
						<th scope="row" class="thead">
							<label>작성자</label>
						</th>
						<td>
							<label>${qnaList.qbOwner }</label>
						</td>
					</tr>
					<tr>
						<th scope="row" class="thead">
							<label>글 제목</label>
						</th>
						<td colspan="3">
							<label>${qnaList.qbSubject }</label>
						</td>
					</tr>        
					<tr>
						<th scope="row" class="thead">
							<label>내용</label>
						</th>
						<td colspan="3">
							<div style="min-height:400px;">${qnaList.qbContent }</div>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
		<div class="confirmArea">
			<c:if test="${memberInfo.mbID == 'admin'}">
				<button type="button" class="replyItem btnEndProduct" id="ReplyButton" style="width:130px;">답글</button>
			</c:if>
			<c:if test="${memberInfo.mbID != null && memberInfo.mbNM == qnaList.qbOwner || memberInfo.mbID == 'admin'}">
				<button type="button" class="regItem btnEndProduct" id="SubmitButton" style="width:130px;">수정</button>
			</c:if>
			<button type="button" class="cancelItem" id="CancelButton">목록으로</button>
		</div>
	</div>
</body>
</html>