<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>The Culture</title>
		
		<script>
			function send(f){
				
				let user_id = f.user_id.value.trim();
				let qna_title = f.qna_title.value.trim();
				let qna_contents = f.qna_contents.value.trim();
				
				//유효성 체크
				if(qna_title == '' || qna_contents == ''){
					alert("문의 제목 및 내용을 입력하시오");
					return;
				}
				
				f.action="qna_insert.do";
				f.method = "post";
				f.submit();
			}
		</script>
	</head>
	<body>
		<form>
			<div>문의하기</div>
			
			<div>
				<div>작성자</div>
				<!-- user_id 값을 가져와서 넣기 -->
				<div>
					<input type="hidden" name="user_id" value="${ login.user_name }">
					${ login.user_name }
				</div>
			</div>
			<div>
				<div>문의제목</div>
				<div><input name="qna_title" size="48"></div>
			</div>
			
			<div>
				<div>내용</div>
				<div>
					<textarea rows="10" cols="50" name="qna_contents" style="resize:none;" wrap="on"></textarea>
				</div>
			</div>
				
				<!-- <tr>
					<th>비밀번호</th>
					<td><input type="password" name="pwd" size="48"></td>
				</tr> -->

			<div>
				<input type="button" value="작성완료" onClick="send(this.form);">		
				<input type="button" value="목록으로" onClick="location.href='qna_main.do'">
			</div>	
		</form>
	</body>
</html>