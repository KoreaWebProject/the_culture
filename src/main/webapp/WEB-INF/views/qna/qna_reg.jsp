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
			<table border="1" align="center">
				<caption>문의하기</caption>
				
				<tr>
					<th>작성자</th>
					<td><input name="user_id" size="48"></td><!-- user_id 값을 가져와서 넣기 -->
				</tr>
				
				<tr>
					<th>문의제목</th>
					<td><input name="qna_title" size="48"></td>
				</tr>
				
				<tr>
					<th>내용</th>
					<td>
						<textarea rows="10" cols="50" name="qna_contents" style="resize:none;" wrap="on"></textarea>
					</td>
				</tr>
				
				<!-- <tr>
					<th>비밀번호</th>
					<td><input type="password" name="pwd" size="48"></td>
				</tr> -->

				<tr>
					<td colspan="2" align="center">
						<input type="button" value="작성완료" onClick="send(this.form);">
						<input type="button" value="목록으로" onClick="location.href='qna_main.do'">
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>