<%--
  Created by IntelliJ IDEA.
  User: 박연아
  Date: 2016-07-29
  Time: 오후 3:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<html>
<head>
    <title>view</title>
</head>
<body>
<%
    Class.forName("com.mysql.jdbc.Driver");
    int index = Integer.parseInt(request.getParameter("index"));
    try{
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jdbctest","root","0726");
        Statement stmt = conn.createStatement();

        String sql = "select title, name, memo, date, hit from board2 where num="+index+";";
        ResultSet rs = stmt.executeQuery(sql);
        while (rs.next()){
            String title = rs.getString(1);
            String name = rs.getString(2);
            String memo = rs.getString(3);
            String date = rs.getString(4);
            int hit = rs.getInt(5);
            hit++;
%>

<table>
    <tr>
        <td>
            <table width="100%" cellpadding="0" cellspacing="0" border="0">
                <tr style="text-align:center">
                    <td>내용</td>
                </tr>
            </table>

            <table width="413">

                <tr>
                    <td width="0">&nbsp;</td>
                    <td align="center" width="76">글번호</td>
                    <td width="319"><%=index%></td>
                    <td width="0">&nbsp;</td>
                </tr>
                <tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
                <tr>
                    <td width="0">&nbsp;</td>
                    <td align="center" width="76">조회수</td>
                    <td width="319"><%=hit%></td>
                    <td width="0">&nbsp;</td>
                </tr>
                <tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
                <tr>
                    <td width="0">&nbsp;</td>
                    <td align="center" width="76">이름</td>
                    <td width="319"><%=name%></td>
                    <td width="0">&nbsp;</td>
                </tr>
                <tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
                <tr>
                    <td width="0">&nbsp;</td>
                    <td align="center" width="76">작성일</td>
                    <td width="319"><%=date%></td>
                    <td width="0">&nbsp;</td>
                </tr>
                <tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
                <tr>
                    <td width="0">&nbsp;</td>
                    <td align="center" width="76">제목</td>
                    <td width="319"><%=title%></td>
                    <td width="0">&nbsp;</td>
                </tr>
                <tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
                <tr>
                    <td width="0">&nbsp;</td>
                    <td width="399" colspan="2" height="200"><%=memo%></td>
                </tr>
                <%
                            sql = "UPDATE board2 SET hit="+hit+" where num="+index+";";
                        }
                        stmt.executeUpdate(sql);
                        rs.close();
                        stmt.close();
                        conn.close();
                    } catch(SQLException e){System.out.println("ㅜㅜ");}
                %>
                <tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
                <tr height="1" bgcolor="#82B5DF"><td colspan="4" width="407"></td></tr>
                <tr align="center">
                    <td width="0">&nbsp;</td>
                    <td colspan="2" width="399">
                        <input type=button value="글쓰기" onclick="window.location='write.jsp'">
                        <input type=button value="답글">
                        <input type=button value="목록" onclick="window.location='list.jsp'">
                        <input type=button value="수정" onclick="window.location='modify.jsp?index=<%=index%>'">
                        <input type=button value="삭제" onclick="window.location='delete.jsp?index=<%=index%>'">
                    </td>
                    <td width="0">&nbsp;</td>
                </tr>
            </table>
        </td>
    </tr>
</table>
</body>
</html>
