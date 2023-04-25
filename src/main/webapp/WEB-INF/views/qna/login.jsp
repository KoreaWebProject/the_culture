<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
		function login( f ) {
			f.action = 'login.do';
			f.method = 'get';
			f.submit();
			
		}
	
	</script>
</head>
<body>
	<form>
	<table>
		<tr>
		<th>id</th>
		<td><input name="id"></td>
		</tr>

		<tr>
		<th>pw</th>
		<td><input name="pw"></td>
		</tr>

		<tr>
			<td colspan="2"><input type="button" value="확인" onclick="login(this.form);"></td>
		</tr>

	</table>
	</form>
</body>
</html>