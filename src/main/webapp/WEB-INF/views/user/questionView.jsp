<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="my"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<c:url var="R" value="/" />

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>Question View</title>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<!-- Bootstrap core CSS -->
<link href="${R}res/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom fonts for this template -->
<link href="${R}res/font-awesome/font-awesome.min.css" rel="stylesheet">
<link href="${R}res/devicons/devicons.min.css" rel="stylesheet">
<link href="${R}res/icons/simple-line-icons.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="${R}res/css/resume.min.css" rel="stylesheet">

</head>

<body id="page-top">
	<!-- 메뉴바 -->
	<tiles:insertAttribute name="menu" />
	<div class="container pull-left" style="padding-top: 10%;">

		<h3>${ question.title }</h3>
		<span class="fa fa-user-circle"></span> 글쓴이: ${ question.student.user.name }
		<span class="fa fa-clock-o"></span>
		<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss"
			value="${ question.date }" />

		<hr />

		<div class="text-center">
			<div>${ question.content }</div>
		</div>

		<hr />

		<div class="pull-right">
			<a class="btn btn-primary btn-sm"
				href="${R}user/questionEdit?id=${ question.id }&${ pagination.queryString }">수정</a>
			<a class="btn btn-danger btn-sm"
				href="${R}user/questionDelete?id=${ question.id }&${ pagination.queryString }"
				data-confirm-delete>글 삭제</a> <a class="btn btn-success btn-sm"
				href="${R}user/questionList?${ pagination.queryString }">목록으로</a>

		</div>

		<br /> <br />

		<h5>댓글 목록</h5>

		<hr />

		<!-- 여기부터 댓글 -->
		<c:forEach var="questioncomment" items="${ questioncommentList }">
			<div class="text-left">
				<span>${ questioncomment.user.name }</span>
				<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss"
					value="${ questioncomment.date }" />
				<a class="btn btn-light btn-sm"
					href="${R}user/questionCommentDelete?id=${ questioncomment.id }&${ pagination.queryString }"
					data-confirm-delete>댓글 삭제 </a>

				<div>${ questioncomment.content }</div>
			</div>
		</c:forEach>

		<br />
		<form:form method="post" modelAttribute="questioncomment">
			<form:textarea path="content" name="content" class="form-control"
				rows="5" id="comment"></form:textarea>

			<div class="text-right">
				<button class="btn btn-success btn-sm" type=submit>댓글 쓰기</button>
			</div>
		</form:form>
		<br />
	</div>

	<!-- Bootstrap core JavaScript -->
	<script src="${R}res/js/jquery.min.js"></script>
	<script src="${R}res/js/bootstrap.bundle.min.js"></script>

	<!-- Plugin JavaScript -->
	<script src="${R}res/js/jquery.easing.min.js"></script>

	<!-- Custom scripts for this template -->
	<script src="${R}res/js/resume.min.js"></script>
	<script src="${R}res/js/notice.js"></script>

	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"
		integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"
		integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ"
		crossorigin="anonymous"></script>

	<script src="https://use.fontawesome.com/25b35a2279.js"></script>
</body>

</html>