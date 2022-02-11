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
			
			CKEDITOR.replace( 'qbContent', { filebrowserImageUploadUrl: '../uploadIMG.jsp', height:400 });
			
			$("#SubmitButton").click(function(){
				var qbSubject = $("#qbSubject").val();
				var qbOwner = $("#qbOwner").val();
				
				if(qbSubject == "" || qbSubject == undefined){
					alert("글제목을 입력하세요.");
					$("#qbSubject").focus();
					return;
				}
				
				if(qbOwner == "" || qbOwner == undefined){
					alert("작성자를 입력하세요.");
					$("#qbOwner").focus();
					return;
				}
	
				$("#regForm").attr("method","post").attr("action","QnaModify").submit();
			});
			
			$("#CancelButton").click(function(){
				location.href="QnA";
			});
			
			
		});
	</script>
	<div class="ds_mall" style = " width:1200px; margin:0 auto;">
		<div class="ds_sub_area" style="width:1200px;">
			<div class="titleArea">
				<c:choose>
					<c:when test="${reply != null}">
						<h2>질문과 답변 답글</h2>
					</c:when>
					<c:when test="${qnaList.qbIdx != null}">
						<h2>질문과 답변 수정</h2>
					</c:when>
					<c:otherwise>
						<h2>질문과 답변 등록</h2>
					</c:otherwise>
				</c:choose>
				<span style="color:#999; float:left; height:32px; line-height:50px;"></span>
			</div>
		</div>
		
		<form id="regForm" enctype="multipart/form-data">
			<input type="hidden" id="qbIdx" name="qbIdx" value="${qnaList.qbIdx }">
			<input type="hidden" id="qbNo" name="qbNo" value="${qnaList.qbNo }">
			<c:if test="${reply != null }">
				<input type="hidden" id="option" name="option" value="${reply }">
			</c:if>
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
							<label>작성자</label><label class="th_input_css"><img src="resources/images/icon_medium_blck1.png" alt="필수항목"></label>
						</th>
						<c:choose>
							<c:when test="${qnaList.qbIdx != null }">
								<td colspan="3"><input name="qbOwner" id="qbOwner" value="${qnaList.qbOwner }" style="width:85%; border:solid 1px #cecece;" readonly></td>
							</c:when>
							<c:when test="${memberInfo.mbNM != null }">
								<td colspan="3"><input name="qbOwner" id="qbOwner" value="${memberInfo.mbNM }" style="width:85%; border:solid 1px #cecece;" readonly></td>
							</c:when>
							<c:otherwise>
								<td colspan="3"><input name="qbOwner" id="qbOwner" value="" style="width:85%; border:solid 1px #cecece;" ></td>
							</c:otherwise>
						</c:choose>
						
					</tr>
					<tr>
						<th scope="row" class="thead">
							<label>글제목</label><label class="th_input_css"><img src="resources/images/icon_medium_blck1.png" alt="필수항목"></label>
						</th>
						<td colspan="3"><input name="qbSubject" id="qbSubject" value="${qnaList.qbSubject }" style="width:85%; border:solid 1px #cecece;" ></td>
					</tr>
					<tr>
						<th>
							<label>내용</label>
						</th>
						<td colspan="3">
							<textarea id="qbContent" name="qbContent" rows="40">${qnaList.qbContent }</textarea>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
		<div class="confirmArea">
			<button type="button" class="regItem btnEndProduct" id="SubmitButton" style="width:130px;">
				<c:choose>
					<c:when test="${reply != null}">
						답글
					</c:when>
					<c:when test="${qnaList.qbIdx != null}">
						수정
					</c:when>
					<c:otherwise>
						등록
					</c:otherwise>
				</c:choose>
			</button>
			<button type="button" class="cancelItem" id="CancelButton">목록으로</button>
		</div>
	</div>
</body>
</html>