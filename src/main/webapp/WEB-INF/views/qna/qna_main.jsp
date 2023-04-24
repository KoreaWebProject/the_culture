<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>The Culture</title>
		
		<style>
			a{text-decoration: none;}
		</style>
		
		<script>
			function search() {
				//조회 카테고리 검색
				let search = document.getElementById("search").value;
				//검색어 조회
				let search_text = document.getElementById("search_text").value.trim();
				
				//카테고리가 전체보기(all)로 지정되어 있지 않은 경우라면 반드시 검색어가 입력되어 있어야 한다
				//유효성 체크
				if(search != 'all' && search_text == ""){
					alert("검색어를 입력하세요");
					return;
				}
				
				//검색 카테고리, 검색어, 페이지 정보를 qna_main.do에게 전달
				location.href="qna_main.do?search="+search+"&search_text="+encodeURIComponent(search_text);
			}
		</script>
		
	</head>
	<body>
		<h1>문의하기</h1>
		<c:if test="${empty login.user_id}">
			<a href="#" onclick="location.href='login_form.do'">로그인</a>
		</c:if>
		<c:if test="${not empty login.user_id}">
			<span>${login.user_name}님</span>
			<a href="#" onclick="location.href='logout.do'">로그아웃</a>
		</c:if>
		<div>
			<c:if test="${not empty login.user_id and login.user_role_id == 0}">
				<input type="hidden" name="user_id" value="${login.user_id}">
				<input type="button" value="문의하기" onClick="location.href='qna_reg.do'">
			</c:if>
		</div>
		<div>
			<div>
				<div>NO</div>
				<div>제목</div>
				<div>이름</div>
				<div>진행상황</div>
				<div>등록일</div>
			</div>
			
			<c:forEach var="vo" items="${ list }">
				<div>${vo.qna_id}</div>
				<div>
					<c:if test="${ vo.qna_remove_lev ne 1 }">
						<div>
							<!-- 링크를 누르면 qna_id를 가지고 페이지를 넘어가기 -->
							<a href="qna_view.do?qna_id=${vo.qna_id}&page=${param.page}&search=${param.search}&search_text=${param.search_text}">${vo.qna_title}</a>
							<div>${vo.user_id}</div>
							<div>
								<c:if test="${ vo.qna_status eq 0 }">처리중</c:if>
								<c:if test="${ vo.qna_status ne 0 }">답변완료</c:if>
							</div>
							<div>${vo.qna_regdate}</div>
						</div>
					</c:if>
					<c:if test="${ vo.qna_remove_lev eq 1 }">
						<font color="gray">삭제된글입니다</font>
					</c:if>
				</div>
			</c:forEach>
			
			<!-- 페이지 선택 -->
			<div>
				${ pageMenu }
			</div>

			<div>
				<!-- 조회 카테고리 -->
				<select id="search">
					<option value="all">전체보기</option>
					<option value="subject">제목</option>
					<option value="name">이름</option>
					<option value="content">내용</option>
					<option value="name_subject_content">이름+제목+내용</option>
				</select>
						
				<!-- 검색어 입력 창 -->
				<input id="search_text">
				<input type="button" value="검색" onClick="search();">
			</div>
		</div>
	</body>
</html>