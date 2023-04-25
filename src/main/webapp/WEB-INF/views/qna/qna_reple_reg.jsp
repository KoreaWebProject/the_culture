<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>The Culture</title>
		
		<script>
			function send(f){
				
				let qna_re_contents = f.qna_re_contents.value.trim();
				let qna_id = f.qna_id.value.trim();
				
				//유효성 체크
				if(qna_re_contents == ''){
					alert("내용을 입력하시오");
					return;
				}
				
				f.action = "qna_reple.do";
				f.method = "post";
				f.submit();
			}
		</script>
	</head>
	<body>
		<form>
			<div>답변달기</div>
			<div>
				<input type="hidden" name="qna_id" value="${ reVo.qna_id }">
				<%-- <input type="hidden" name="page" value="${ param.page }">
				<input type="hidden" name="search" value="${ param.search }">
				<input type="hidden" name="search_text" value="${ param.search_text }"> --%>
			</div>
			<div>
				<div>내용</div>
				<div>
					<textarea rows="10" cols="50" name="qna_re_contents" style="resize:none;" wrap="on"></textarea>
				</div>
			</div>
			
			<div>
				<input type="button" value="작성완료" onClick="send(this.form);">		
				<input type="button" value="목록으로" onClick="location.href='qna_main.do'">
			</div>	
		</form>
	</body>
</html>