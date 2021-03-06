<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JBlog</title>
<Link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/jblog.css">
</head>
<body>
	<div id="container">
		<c:import url="/WEB-INF/views/common/header.jsp"/>
		<div id="wrapper">
			<div id="content">
				<c:set var="count" value="${fn:length(map.postList)}"/>
				<div class="blog-content">
				<c:if test="${map.latePost ne null }">
					<h4>${map.latePost.title }</h4>
					<p>
						${map.latePost.content }
					</p>
				</c:if>
				<c:if test="${map.latePost eq null}">
					<h4 style="color:red;">게시물이 존재하지 않습니다.</h4>
				</c:if>
				</div>
				<ul class="blog-list">
				
				<c:if test="${count > 1}">
				<c:forEach items='${map.postList }' var='vo' varStatus='status'>
					<li><a href="${pageContext.request.contextPath }/${blogVo.id }/${vo.categoryNo }/${vo.no }">${vo.title }</a> <span>${vo.regDate }</span></li>
				</c:forEach>
				</c:if>
				</ul>
			</div>
		</div>

		<div id="extra">
			<div class="blog-logo">
				<img src="${pageContext.request.contextPath}/${blogVo.logo }">
			</div>
		</div>

		<div id="navigation">
		<h2>카테고리</h2>
			<ul>
				<c:forEach items='${map.categoryList }' var='vo' varStatus='status'>
					<li><a href="${pageContext.request.contextPath}/${blogVo.id }/${vo.no }">${vo.name }</a></li>
				</c:forEach>
			</ul>
		</div>
		
		<c:import url="/WEB-INF/views/common/footer.jsp"/>
	</div>
</body>
</html>