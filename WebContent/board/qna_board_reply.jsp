<%@page import="net.board.db.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% 
	BoardBean board = (BoardBean)request.getAttribute("boarddata");
	String id = (String)session.getAttribute("id");
			
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MVC 게시판</title>
<script type="text/javascript">
	function replyboard() {
		boardform.submit();
	}
</script>
</head>
<body>
<!-- 게시판 답변 -->
<form action="./BoardReplyView.bo" method="post" name="boardform">
<input type="hidden" name="BOARD_NUM" value="<%=board.getBOARD_NUM() %>" />
<input type="hidden" name="BOARD_RE_REF" value="<%=board.getBOARD_RE_REF() %>" />
<input type="hidden" name="BOARD_RE_LEV" value="<%=board.getBOARD_RE_LEV() %>" />
<input type="hidden" name="BOARD_RE_SEQ" value="<%=board.getBOARD_RE_SEQ() %>" />
<input type="hidden" name="BOARD_ID" value="<%=board.getBOARD_ID() %>" />

<table>
		<tr align="center" valign="middle">
			<td colspan="5">MVC게시판</td>
		</tr>
		<tr>
			<td style="font-family: 돋음; font-size: 12" height="16">
				<div align="center">글쓴이</div>
			</td>
			<td>
				<%=id %>
			</td>
		</tr>
		
		<tr>
			<td style="font-family: 돋음; font-size: 12" height="16">
				<div align="center">제 목</div>
			</td>
			<td>
			 	<input type="text" name="BOARD_SUBJECT" size="50" maxlength="100" value="RE: <%=board.getBOARD_SUBJECT() %>" />
			</td>
		</tr>
		
		<tr>
			<td style="font-family: 돋음; font-size: 12" height="16">
				<div align="center">내 용</div>
			</td>
			<td>
				<textarea rows="15" cols="67" name="BOARD_CONTENT"></textarea>
			</td>
		</tr>
		
		<tr>
			<td style="font-family: 돋음; font-size: 12">
				<div align="center">비밀번호</div>
			</td>
			<td>
				<input name="BOARD_PASS" type="password" />
			</td>
		</tr>
		
		<tr bgcolor="#cccccc">
			<td colspan="2" style="height: 1px;">
			</td>
		</tr>
		<tr><td colspan="2">&nbsp;</td></tr>
		
		<tr align="center" valign="middle">
			<td colspan="5">
			<a href="javascript:replyboard()">[등록]</a>&nbsp;&nbsp;
			<a href="javascript:history.go(-1)">[취소]</a>
			</td>
		</tr>
</table>
</form>
</body>
</html>