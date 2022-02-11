<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<body>
	<script>
		$(function(){
			
			$("#listType1 , #listType2").on("click",function(){
				
				var ClickId = $(this).attr("id");
				if(ClickId == "listType1"){
					$("#listType1").removeClass("on");
					$("#listType2").removeClass("on");
	
					$("#listType1").addClass("on");
					
					
					$(".listDetailType02").css("display" , "none");
					$(".listDetailType01").css("display" , "contents");
	
				}else if(ClickId == "listType2"){
					$("#listType1").removeClass("on");
					$("#listType2").removeClass("on");
	
					$("#listType2").addClass("on");
					
					
					$(".listDetailType01").css("display" , "none");
					$(".listDetailType02").css("display" , "contents");
	
				}
			});
			
			var listType = '<c:out value="${listType}" />';
			
			if(listType == "list1"){
				$("#listType1").trigger("click");
			}else{
				$("#listType2").trigger("click");
			}
			
		});
		</script>
	<div class="searchDetail">
		<!-- start condition option -->
		<div class="conditionOption">
			<div class="totalArea">
				<span class="tot">총 <span class="num">${TotalProjectList }</span></span> 
				<span class="pageNum">페이지 번호 <span><strong class="num">1</strong>
				<span class="slash">/<span class="totNum">${paging.lastPage }</span></span></span></span>
			</div>
			
			<div class="optionType">
				<a class="optionList on" id="listType1" title="리스트로 보기"></a>
				<a class="optionItem" id="listType2" title="상세설명으로 보기"></a>
			</div>
		</div>
		<!-- end condition option -->
		<!-- start list 1 -->
		<div class="listDetailType01">
			<table style="border-collapse: collapse;">
				<colgroup>
					<col style="width: 40px;">
					<col style="width: 80px;">
					<col style="width: auto;">
					<col style="width: 132px;">
					<col style="width: 132px;">
					<col style="width: 163px;">
				</colgroup>
				<thead>
					<tr>
						<th></th>
						<th>순번</th>
						<th>프로젝트명</th>
						<th>기술</th>
						<th>업무</th>
						<th>기간</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${projectList }" var="projectList">
						<tr>
							<td>
								<c:if test="${memberInfo.mbID == 'admin' }">
									<input type="checkbox" id="projectChkBox_${projectList.pbIdx }" name="projectChkBox" value = "${projectList.pbIdx }">
									<label for="projectChkBox_${projectList.pbIdx }">&nbsp;</label>
								</c:if>
							</td>
							<td>${projectList.pno }</td>
							<td style="text-align:left;"><a href="/project/reg.do?pbIdx=${projectList.pbIdx }" >${projectList.pbSubject }</a></td>
							<td>${projectList.pbSkill }</td>
							<td>${projectList.pbWork }</td>
							<td>${projectList.pbStartDT } ~ ${projectList.pbEndDT }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<!-- end list 1 -->
		<!-- start list 2 -->
		<div class="listDetailType02" style="list-style:none;" >
			<ul>
				<c:forEach items="${projectList }" var="projectList">
					<li>
						<div>
							<div class="boxCheck">
								<c:if test="${memberInfo.mbID == 'admin' }">
									<input type="checkbox" id="boxCheck_${projectList.pbIdx }" name="boxCheckBox" value = "${projectList.pbIdx }">
									<label for="boxCheck_${projectList.pbIdx }"></label>
								</c:if>
							</div>
							
							<div class="detailItem">
								<a href="/project/reg.do?pbIdx=${projectList.pbIdx }">
									<div class="detailItemImg">
										<div class="detailImg">
											<img src="${path}/${projectList.pbImage }">
										</div>
										<span class="detailTitle">${projectList.pbSubject } </span>
										<span class="prdNum">${projectList.pbWork }</span>
									</div>
									<div class="detailItemOtherInfo">
										<dl>
											<dt>기간</dt>
											<dd>${projectList.pbStartDT } ~ ${projectList.pbEndDT }</dd>
										</dl>
									</div>
								</a>
							</div>
						</div>
					</li>
				</c:forEach>
			</ul>
		</div>
		<!-- end list 2 -->
		<div class="choiceBtn">
			<c:if test="${memberInfo.mbID == 'admin' }">
				<div class="regNewItem" id="deleteItem" >
					<a href="javascript:return false;">삭제</a>
				</div>
				<div class="regNewItem" id="regNewItem" style="margin-right:5px;">
					<a href="/project/reg.do">등록</a>
				</div>
			</c:if>
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
						<c:otherwise>
							<a class="pageNum on"><span>1</span></a>
						</c:otherwise>
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
</body>