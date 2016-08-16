<%--
  Created by IntelliJ IDEA.
  User: 박연아
  Date: 2016-08-09
  Time: 오후 4:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<html>
<head>
    <title>deleteOk</title>
</head>
<body>
<%
    Class.forName("com.mysql.jdbc.Driver");
    try{
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jdbctest","root","0726");
        Statement stmt = conn.createStatement();

        String password ="";
        int index = Integer.parseInt(request.getParameter("index"));
        String pass = request.getParameter("password");

        String sql = "SELECT password FROM board2 WHERE num="+index+";";
        ResultSet rs = stmt.executeQuery(sql);

        if(rs.next()) {
            password = rs.getString(1);
        }
        if(password.equals(pass)) {
            sql ="DELETE FROM board2 WHERE num='"+index+"';";
            stmt.executeUpdate(sql);
%>
<script language=javascript>
    self.window.alert("삭제완료");
    location.href="list.jsp";
</script>
<%
    rs.close();
    stmt.close();
    conn.close();
} else{
%>
<script language=javascript>
    self.window.alert("비밀번호가 맞지 않습니다.");
    location.href="javascript:history.back()";
</script>
<%
        }
    }catch (SQLException e){
        out.println(e.toString());
    }
%>
</body>
</html>
