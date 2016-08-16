<%--
  Created by IntelliJ IDEA.
  User: 박연아
  Date: 2016-08-09
  Time: 오후 4:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<html>
<head>
    <title>delete</title>
</head>
<body>
<script language="JavaScript">
    function deleteCheck() {
        var form = document.deleteform;

        if (!form.password.value){
            alert("비밀번호를 입력하세요");
            form.password.focus();
            return;
        }
        form.submit();
    }
</script>
<%
    Class.forName("com.mysql.jdbc.Driver");
    try{
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jdbctest","root","0726");
        Statement stmt = conn.createStatement();

        int index = Integer.parseInt(request.getParameter("index"));
        String sql = "SELECT password FROM board2 WHERE num="+index+";";
        ResultSet rs = stmt.executeQuery(sql);


%>
<table>
    <form name="deleteform" method="post" action="deleteOk.jsp?index=<%=index%>">
    <tr>
        <td>
            <table width="100%" cellpadding="0" cellspacing="0" border="0">
                <tr style="text-align:center;">
                    <td>삭제</td>
                </tr>
            </table>
            <table>
                <tr>
                    <td>&nbsp;</td>
                    <td align="center">비밀번호</td>
                    <td><input name="password" type="password" size="50" maxlength="100"></td>
                    <td>&nbsp;</td>
                </tr>
                <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
                <tr height="1" bgcolor="#82B5DF"><td colspan="4"></td></tr>
                <tr align="center">
                    <td>&nbsp;</td>
                    <td colspan="2"><input type=button value="삭제" onclick="javascript:deleteCheck();">
                        <input type=button value="취소" onclick="javascript:history.back(-1)">
                    <td>&nbsp;</td>
                </tr>
                <%
                        rs.close();
                        stmt.close();
                        conn.close();
                    }catch (SQLException e){
                        out.println(e.toString());
                    }
                %>
            </table>
        </td>
    </tr>
    </form>
</table>
</body>
</html>
