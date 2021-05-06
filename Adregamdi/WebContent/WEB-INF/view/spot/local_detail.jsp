<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 절대 경로 설정 -->
<c:set var="root" value="${pageContext.request.contextPath }/" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지역별 관광지</title>

<!-- Bootstrap CDN -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>

</head>
<body>
	<!-- 상단 메뉴바  -->
	<c:import url="/WEB-INF/view/include/header.jsp"/>
	
	<!-- 지역별로 보여주기 -->
	<div class="wrap_contView padB10">
		<h3>지역</h3>
		<div class="area_List m_none">
			<ul class="clfix">
				<li id="0"> <a href="${root }spot/local_detail?spot_no=0">전체 지역</a> </li>
				<li id="1"> <a href="${root }spot/local_detail?spot_no=1">제주시</a> </li>
				<li id="2"> <a href="${root }spot/local_detail?spot_no=2">서귀포시</a> </li>
			</ul>
		</div>
		
		<div class="text-right">		<!-- model.addAttribute("board_info_idx", board_info_idx);값 받아옴 -->
				<a href="${root }spot/write" class="btn btn-primary">글쓰기</a>
		</div>
	</div>
	
	
	
	<!-- 하단 -->
	<c:import url="/WEB-INF/view/include/footer.jsp"/>
</body>
</html>