<%@ page import="java.sql.*" %><%--
  Created by IntelliJ IDEA.
  User: 박연아
  Date: 2016-07-12
  Time: 오후 7:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>yuna'board</title>
    <style>

    </style>
</head>
<body>
<table width="100%" cellpadding="0" cellspacing="0" border="0">
    <tr height="5"><td width="5"></td></tr>
    <tr style="text-align:center;">
        <td width="73">번호</td>
        <td width="379">제목</td>
        <td width="73">작성자</td>
        <td width="164">작성일</td>
        <td width="58">조회수</td>
    </tr>


    <tr height="25" align="center"></tr>

    <tr height="1" bgcolor="#D2D2D2"><td colspan="6"></td></tr>

    <tr height="1" bgcolor="#82B5DF"><td colspan="6" width="752"></td></tr>

    <%--<%--%>
        <%--Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jdbctest","root","0726");--%>
        <%--ResultSet rs;--%>
        <%--PreparedStatement ps;--%>
        <%--String sql = "select * from board";--%>
        <%--try {--%>
            <%--ps = con.prepareStatement(sql);--%>
            <%--rs = ps.executeQuery();--%>
            <%--while (rs.next()){--%>
                <%--String title = rs.getString("title");--%>
                <%--String name = rs.getString("name");--%>
                <%--out.println(title+name);--%>
            <%--}--%>
        <%--}catch (SQLException e){--%>
            <%--e.printStackTrace();--%>
        <%--}--%>
    <%--%>--%>

</table>

<table width="100%" cellpadding="0" cellspacing="0" border="0">
    <tr><td colspan="4" height="5"></td></tr>
    <tr align="center">
        <td><input type=button value="글쓰기" OnClick="window.location='write.jsp'"></td>
    </tr>
</table>
</body>
</html>