<%--
  Created by IntelliJ IDEA.
  User: 박연아
  Date: 2016-07-12
  Time: 오후 7:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<script language=javascript>
    self.window.alert("저장!");
    location.href="list.jsp";
</script>
<%
    request.setCharacterEncoding("euc-kr"); //받아오는 값들을 한글로 인코딩합니다.

    Class.forName("com.mysql.jdbc.Driver");

    String url = "jdbc:mysql://localhost:3306/jdbctest";
    String id = "root";
    String pass = "0726";


    String name = request.getParameter("name"); //write.jsp에서 name에 입력한 데이터값
    String pw = request.getParameter("password");//write.jsp에서 password에 입력한 데이터값
    String title = request.getParameter("title"); //write.jsp에서 title에 입력한 데이터값
    String memo = request.getParameter("memo"); //write.jsp에서 memo에 입력한 데이터값

    try {
        Connection conn = DriverManager.getConnection(url,id,pass);
        if (conn == null) {
            System.out.println("실패");
        } else {
            System.out.println("성공");
        }

        String sql = "INSERT INTO board  VALUES('"+title +"','" +name+"','"+ pw+"','" +memo+"');";
        PreparedStatement ps = conn.prepareStatement(sql);

//        ps.setString(1, title);
//        ps.setString(2, name);
//        ps.setString(3, pw);
//        ps.setString(4, memo);
        ps.executeUpdate();
        ps.close();
        conn.close();
    } catch(SQLException e) {
        out.println( e.toString() );
    }

%>
</body>
</html>
