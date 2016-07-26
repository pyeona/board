<%--
  Created by IntelliJ IDEA.
  User: 박연아
  Date: 2016-07-12
  Time: 오후 7:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<html>
<head>
    <title>yunaboard</title>
</head>
<body>
<script language = "javascript">

function writeCheck()
{
    var form = document.writeform;
    if( !form.title.value )
    {
        alert( "제목이 뭐죠" );
        form.title.focus();
        return;
    }

    if( !form.name.value )
    {
        alert( "이름!!" );
        form.name.focus();
        return;
    }

    if( !form.password.value )
    {
        alert( "비번!!" );
        form.password.focus();
        return;
    }

    if( !form.memo.value )
    {
        alert( "...?" );
        form.memo.focus();
        return;
    }

    form.submit();
}
</script>
<table>
    <form name=writeform method=post action="insert.jsp">
    <tr>
        <td>
            <table width="100%" cellpadding="0" cellspacing="0" border="0">
                    <td align="center">글쓰기</td>
                </tr>
            </table>
            <table>
                <tr>
                    <td>&nbsp;</td>
                    <td align="center">제목</td>
                    <td><input name="title" size="50" maxlength="100"></td>
                    <td>&nbsp;</td>
                </tr>
                <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
                <tr>
                    <td>&nbsp;</td>
                    <td align="center">이름</td>
                    <td><input name="name" size="50" maxlength="50"></td>
                    <td>&nbsp;</td>
                </tr>
                <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
                <tr>
                    <td>&nbsp;</td>
                    <td align="center">비밀번호</td>
                    <td><input name="password" size="50" maxlength="50"></td>
                    <td>&nbsp;</td>
                </tr>
                <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
                <tr>
                    <td>&nbsp;</td>
                    <td align="center">내용</td>
                    <td><textarea name="memo" cols="50" rows="13"></textarea></td>
                    <td>&nbsp;</td>
                </tr>
                <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
                <tr height="1" bgcolor="#82B5DF"><td colspan="4"></td></tr>
                <tr align="center">
                    <td>&nbsp;</td>
                    <td colspan="2"><input type=button value="등록" OnClick="javascript:writeCheck();">
                        <input type=button value="취소" OnClick="javascript:history.back(-1)">
                    <td>&nbsp;</td>
                </tr>
            </table>
    </form>
    </td>
    </tr>
</table>
</body>
</html>


