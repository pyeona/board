<%--
  Created by IntelliJ IDEA.
  User: 박연아
  Date: 2016-07-12
  Time: 오후 7:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<html>
<head>
    <title>yunaboard</title>
</head>
<body>
<%
    Class.forName("com.mysql.jdbc.Driver");
    String url = "jdbc:mysql://localhost:3306/jdbctest";
    String id = "root";
    String pass = "0726";
    int total = 0;  //게시글 갯수

    try{
        Connection conn = DriverManager.getConnection(url,id,pass);
        Statement stmt = conn.createStatement();

        String count = "select count(num) from board2";
        ResultSet rs = stmt.executeQuery(count);

        if(rs.next()){
            total = rs.getInt(1);
        }
        rs.close();
        out.println("총: " +total +" 개");

        String list = "select num, title, name, date, hit from board2 order by num desc";
        rs = stmt.executeQuery(list);
%>
<table width="100%" cellpadding="0" cellspacing="0" border="0">
    <tr height="5"><td width="5"></td></tr>
    <tr style="text-align:center;">
        <td width="73">번호</td>
        <td width="379">제목</td>
        <td width="73">작성자</td>
        <td width="164">작성일</td>
        <td width="58">조회수</td>
    </tr>
    <%if (total==0){%>
    <tr align="center" bgcolor="#ffffff" height="30">
        <td colspan="6">등록된 글이 없습니다.</td>
    </tr>
    <%} else {
        while (rs.next()) {
            int index = rs.getInt(1);
            String title = rs.getString(2);
            String name = rs.getString(3);
            String date = rs.getString(4);
            int hit = rs.getInt(5);
    %>
    <tr height="25" align="center">

        <%--<td>&nbsp;</td>--%>
        <td><%=index %></td>
        <%--주소뒤에 ?를 붙이고 변수명=변수값 -> 주소에 해당 데이터가 넘어감.--%>
        <td align="left"><a href="view.jsp?index=<%=index%>"><%=title%></td>
        <td align="center"><%=name%></td>
        <td align="center"><%=date%></td>
        <td align="center"><%=hit%></td>
        <td>&nbsp;</td>
    </tr>
    <tr height="1" bgcolor="#D2D2D2"><td colspan="6"></td></tr>

    <%
                }
            }
            rs.close();
            stmt.close();
            conn.close();
        } catch(SQLException e){
            out.println( e.toString() );
        }%>

    <tr height="1" bgcolor="#82B5DF"><td colspan="6" width="752"></td></tr>
</table>

<table width="100%" cellpadding="0" cellspacing="0" border="0">
    <tr><td colspan="4" height="5"></td></tr>
    <tr align="center">
        <td><input type=button value="글쓰기" onclick="window.location='write.jsp'"></td>
    </tr>
</table>
</body>
</html>