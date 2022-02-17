<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<script>		
		function changePaging(page){
			var listType = "list2";
			if($("#listType1").hasClass("on") === true) {
				listType = "list1";
			}
			
			var selectSkill = new Array();
			
			if($("#ProjectSkill_All").is(":checked")){
				selectSkill.push("ALL");
			}else{
				$("input[name=ProjectSkill]:checked").each(function(){
					var chk = $(this).val();
					selectSkill.push(chk);
				});
			}
			
			var selectWork = new Array();
			
			if($("#ProjectWork_All").is(":checked")){
				selectWork.push("ALL");
			}else{
				$("input[name=ProjectWork]:checked").each(function(){
					var chk = $(this).val();
					selectWork.push(chk);
				});
			}
			
			$.ajax({
	            url: "list_ajax.do",
	            type: "POST",
	            data: {
	            	"nowPage" : page
	            	,"listType" : listType
	            	,"searchSkill" : selectSkill
	            	,"searchWork" : selectWork
	            	,"searchText" : $("#searchText").val()
	            },
	            success: function(data){
	            	$('.fRight').empty();
	                $('.fRight').html(data);
	            },
	            error: function(){
	                
	            }
	        });
		}
		
		$(function(){
			$("#searchProjectList").click(function(){
				var listType = "list2";
				if($("#listType1").hasClass("on") === true) {
					listType = "list1";
				}
				
				var selectSkill = new Array();
				
				if($("#ProjectSkill_All").is(":checked")){
					selectSkill.push("ALL");
				}else{
					$("input[name=ProjectSkill]:checked").each(function(){
						var chk = $(this).val();
						selectSkill.push(chk);
					});
				}
				
				var selectWork = new Array();
				
				if($("#ProjectWork_All").is(":checked")){
					selectWork.push("ALL");
				}else{
					$("input[name=ProjectWork]:checked").each(function(){
						var chk = $(this).val();
						selectWork.push(chk);
					});
				}
				
				$.ajax({
		            url: "list_ajax.do",
		            type: "POST",
		            data: {
		            	"nowPage" : "1"
		            	,"listType" : listType
		            	,"searchSkill" : selectSkill
		            	,"searchWork" : selectWork
		            	,"searchText" : $("#searchText").val()
		            },
		            success: function(data){
		            	$('.fRight').empty();
		                $('.fRight').html(data);
		            },
		            error: function(){
		                
		            }
		        });
				
				
			});
			
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
			
			$("#listType1").trigger("click");
			
			$("#ProjectSkill_All").click(function() {
				if($("#ProjectSkill_All").is(":checked")) $("#ProjectSkill input[name=ProjectSkill]").prop("checked", true);
				else $("#ProjectSkill input[name=ProjectSkill]").prop("checked", false);
			});

			$("#ProjectSkill input[name=ProjectSkill]").click(function() {
				var total = $("#ProjectSkill input[name=ProjectSkill]").length;
				var checked = $("#ProjectSkill input[name=ProjectSkill]:checked").length;
				
				if(checked == 0){
					alert("하나이상 무조건 선택해야합니다.");
					$(this).prop("checked",true);
					return;
				}

				if(total != checked) $("#ProjectSkill_All").prop("checked", false);
				else $("#ProjectSkill_All").prop("checked", true); 
			});
			
			$("#ProjectWork_All").click(function() {
				if($("#ProjectWork_All").is(":checked")) $("#ProjectWork input[name=ProjectWork]").prop("checked", true);
				else $("#ProjectWork input[name=ProjectWork]").prop("checked", false);
			});

			$("#ProjectWork input[name=ProjectWork]").click(function() {
				var total = $("#ProjectWork input[name=ProjectWork]").length;
				var checked = $("#ProjectWork input[name=ProjectWork]:checked").length;
				
				if(checked == 0){
					alert("하나이상 무조건 선택해야합니다.");
					$(this).prop("checked",true);
					return;
				}

				if(total != checked) $("#ProjectWork_All").prop("checked", false);
				else $("#ProjectWork_All").prop("checked", true); 
			});
			
			//초기화 버튼
			$("#searchInit").click(function(){
				$("#ProjectSkill_All").prop("checked", true);
				$("#ProjectSkill input[name=ProjectSkill]").prop("checked", true);
				$("#ProjectWork_All").prop("checked", true);
				$("#ProjectWork input[name=ProjectWork]").prop("checked", true);
				$("#searchText").val("");
			});
			
			$("#deleteItem").off("click");
			$("#deleteItem").on("click",function(){
				var selectList = new Array();
				if($("#listType1").hasClass("on") === true) {
					$("input[name=projectChkBox]:checked").each(function(){
						var chk = $(this).val();
						selectList.push(chk);
					});
				}else{
					$("input[name=boxCheckBox]:checked").each(function(){
						var chk = $(this).val();
						selectList.push(chk);
					});
				}
				
				if(selectList.length < 1){
					alert("삭제할 게시글을 선택하세요.");
					return;
				}
				
				location.href="delete.do?checkList=" + selectList;
			});
			
			$("#searchInit").trigger("click");
			
		});		
		
	</script>
	<div class="ds_mall" style = " width:1200px; margin:0 auto;">
		<div class="ds_sub_area" style="width:1200px;">
			<div class="titleArea">
				<h2>프로젝트</h2> <span style="color:#999; float:left; height:32px; line-height:50px;"></span>
				<ul class="pageArea">
					<li class="firstArea"><a href="/" title="홈"></a></li>
					<li class="nowArea">프로젝트</li>
				</ul>
			</div>
		</div>
		
		<div class="searchConditionArea floatBox">
			<div class="fLeft" style="margin-bottom:35px;">
				<div class="tit">상세검색조건</div>
				<div class="detailCondition">
					<ul>
						<li>
							<strong>기술</strong>
							<ul id="ProjectSkill">
								<li>
									<input type="checkbox" id="ProjectSkill_All" name="ProjectSkill_All" value="ALL">
									<label for="ProjectSkill_All">전체</label>
								</li>
								<c:forEach items="${skillList }" var="skillList">
									<li>
										<input type="checkbox" id="ProjectSkill_${skillList.sklIdx }" name="ProjectSkill" value="${skillList.sklNM }">
										<label for="ProjectSkill_${skillList.sklIdx }">${skillList.sklNM }</label>
									</li>
								</c:forEach>
							</ul>
							<strong>업무</strong>
							<ul id="ProjectWork">
								<li>
									<input type="checkbox" id="ProjectWork_All" name="ProjectWork_All" value="ALL">
									<label for="ProjectWork_All">전체</label>
								</li>
								<li>
									<input type="checkbox" id="ProjectWork_1" name="ProjectWork" value="개발">
									<label for="ProjectWork_1">개발</label>
								</li>
								<li>
									<input type="checkbox" id="ProjectWork_2" name="ProjectWork" value="운영">
									<label for="ProjectWork_2">운영</label>
								</li>
								<li>
									<input type="checkbox" id="ProjectWork_3" name="ProjectWork" value="기획">
									<label for="ProjectWork_3">기획</label>
								</li>
								<li>
									<input type="checkbox" id="ProjectWork_4" name="ProjectWork" value="설계">
									<label for="ProjectWork_4">설계</label>
								</li>
								<li>
									<input type="checkbox" id="ProjectWork_5" name="ProjectWork" value="교육">
									<label for="ProjectWork_5">교육</label>
								</li>
							</ul>
							<strong>프로젝트명</strong>
							<ul id="ProjectNM">
								<li>
									<input type="text" class="ipText" id="searchText" placeholder="검색어를 입력해주세요." style="width:100%; height:32px;">
								</li>
							</ul>
						</li>
					</ul>
					<div class="searchDetailBtnArea">
						<button class="btnInit" id="searchInit">
							<span>초기화</span>
						</button>
						<button class="btnApply" id="searchProjectList">
							<span>적용</span>
						</button>
					</div>
				</div>
			</div>
			<!-- end detail condition -->
			<!-- start detail -->
			<div class="fRight">
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
