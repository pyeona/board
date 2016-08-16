<%--
  Created by IntelliJ IDEA.
  User: 박연아
  Date: 2016-08-08
  Time: 오후 4:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<html>
<head>
    <title>modify</title>
</head>
<body>
<script language = "javascript">

function updateCheck()
{
    var form = document.modifyform;

    if( !form.password.value ) {
        alert( "비밀번호를 입력해주요" );
        form.password.focus();
        return;
    }

    if( !form.title.value ) {
        alert( "제목을 입력해주요" );
        form.title.focus();
        return;
    }

    if( !form.memo.value ) {
        alert( "내용을 적어주요" );
        form.memo.focus();
        return;
    }
    form.submit();
}
</script>

<%
    request.setCharacterEncoding("utf-8");

    Class.forName("com.mysql.jdbc.Driver");
    int index = Integer.parseInt(request.getParameter("index"));


    try{
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jdbctest","root","0726");
        Statement stmt = conn.createStatement();

        String sql = "select title, name, password, memo from board2 where num="+index+";";
        ResultSet rs = stmt.executeQuery(sql);
        if(rs.next()) {
            String title = rs.getString(1);
            String name = rs.getString(2);
            String password = rs.getString(3);
            String memo = rs.getString(4);

%>

<table>
    <form name=modifyform method=post action="update.jsp?index=<%=index%>">
    <tr>
        <td>
            <table width="100%" cellpadding="0" cellspacing="0" border="0">
                   <tr style="text-align: center"><td>수정</td></tr>
            </table>
            <table>
                <tr>
                    <td>&nbsp;</td>
                    <td align="center">제목</td>
                    <td><input name="title" type=text size="50" maxlength="100" value="<%=title%>"></td>
                    <td>&nbsp;</td>
                </tr>
                <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
                <tr>
                    <td>&nbsp;</td>
                    <td align="center">이름</td>
                    <td><%=name%><input type="hidden" name="name" size="50" maxlength="50" value="<%=name%>"></td>
                    <td>&nbsp;</td>
                </tr>
                <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
                <tr>
                    <td>&nbsp;</td>
                    <td align="center">비밀번호</td>
                    <td><input type="password" name="password" size="50" maxlength="50"></td>
                    <td>&nbsp;</td>
                </tr>
                <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
                <tr>
                    <td>&nbsp;</td>
                    <td align="center">내용</td>
                    <td><textarea name="memo" cols="50" rows="13"><%=memo%></textarea></td>
                    <td>&nbsp;</td>
                </tr>
                <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
                <tr height="1" bgcolor="#82B5DF"><td colspan="4"></td></tr>
                <tr align="center">
                    <td>&nbsp;</td>
                    <td colspan="2"><input type=button value="수정" onclick="javascript:updateCheck();">
                       <input type=button value="취소" onclick="javascript:history.back(-1)"></td>
                    <td>&nbsp;</td>
                </tr>
             <%
                 rs.close();
                 stmt.close();
                 conn.close();
                 } else {
                 }
                 } catch (SQLException e){
                     System.out.print( e.toString() );
                 }
             %>

            </table>
        </td>
    </tr>
        </form>
</table>
</body>
</html>
