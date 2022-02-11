<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<ul style="margin-left: 0px;">
	<c:forEach items="${projectList }" var="projectList">
		<li style="  margin-right: 17px;">
			<div>
				<a href="/project/reg.do?pbIdx=${projectList.pbIdx }">
					<p class="categoryImg" style="height:220px;">
						<img src="${path}/${projectList.pbImage }" alt="" >
					</p>
					<div class="comProductInfo">
						<p style="font-weight:bold">${projectList.pbSubject }</p>
						<span>${projectList.pbWork }</span>
					</div>					
					<dl>
						<dt>${projectList.pbSkill }</dt>
						<dd>${projectList.pbStartDT } ~ ${projectList.pbEndDT }</dd>
					</dl>
				</a>
			</div>
			<span class="number">1</span>
		</li>
	</c:forEach>
</ul>