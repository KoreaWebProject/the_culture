<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>The Culture</title>
	</head>
	<body>
		<!-- 목록으로 돌아가기 버튼 -->
		<div>
			<input type="button" value="목록으로" onClick="location.href='qna_main.do?page=${param.page}&search=${ param.search }&search_text=${ param.search_text }'">
		</div>
		<!-- 문의 수정 기능 추가? -->
		
		<!-- 선택한 문의 내용 상세보기 -->
		<h1>문의 상세 보기</h1>
		<!-- 현재 접속자와 해당 게시글의 작성자가 동일하면 삭제할 수 있도록 -->
		<div>
			<c:if test="${(login.user_id == vo.user_id and login.user_role_id == 0) or login.user_role_id == 2}">
				<input type="button" value="삭제하기" onClick="location.href='qna_del.do?qna_id=${vo.qna_id}'">
			</c:if>
		</div>
		<div>
			<div>제목</div>
			<div>${ vo.qna_title }</div>
		</div>
		<div>
			<div>아이디 : </div>
			<div>${ vo.user_id }</div>
		</div>
		<div>
			<div>내용 : </div>
			<div>${ vo.qna_contents }</div>
		</div>
		<div>
			<div>등록일 : </div>
			<div>${ vo.qna_regdate }</div>
		</div>
		<div>
			<div>수정일 : </div>
			<div>${ vo.qna_update }</div>
		</div>
		<div>
			<div>처리상태 : </div>
			<div>
				<c:if test="${ vo.qna_status eq 0 }">
					<div>처리중</div>
				</c:if>
				<c:if test="${ vo.qna_status eq 1 }">
					<div>답변완료</div>
				</c:if>
			</div>
		</div>
		
		<!-- 현 접속자가 관리자일 경우 답글 달기 기능 및 답글 삭제 활성화 -->
		<div>
			<hr>
			<h1>여긴 답글!</h1>
			
			<div>
				<c:if test="${login.user_role_id == 2}">
					<input type="button" value="답글달기" onClick="location.href='qna_reple_reg.do?qna_id=${ vo.qna_id }&page=${param.page}&search=${ param.search }&search_text=${ param.search_text }'">
					<input type="button" value="완료하기" onClick="location.href='qna_clear.do?qna_id=${vo.qna_id}'">
				</c:if>
			</div>
				<div>
					<c:forEach var="list" items="${ list }">
						<c:if test="${ list.qna_re_remove_lev eq 0 and login.user_role_id == 2}">
							<div>
								<input type="button" value="답글삭제" onClick="location.href='qna_reple_del.do?qna_re_ref=${ list.qna_re_ref }'">
							</div>
						</c:if>
						<div>
							<c:if test="${ list.qna_re_remove_lev eq 0}">
								<div>
									${ list.qna_id }에 대한 답변입니다
								</div>
								<div>
									${ list.qna_re_contents }
								</div>
								<div>등록일</div>
								<div>
									${ list.qna_re_regdate }
								</div>
								<div>수정일</div>
								<div>
									${ list.qna_re_update }
								</div>
								<div><hr></div>
							</c:if>
							<c:if test="${ list.qna_re_remove_lev eq 1}">
								삭제된 답글입니다
							</c:if>
						</div>
					</c:forEach>
				</div>
		</div>
	</body>
</html>