import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created by 박연아 on 2016-07-21.
 */
@WebServlet(name = "writeServlet")
public class writeServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String memo = request.getParameter("memo");
        System.out.println("내용:"+memo);
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        out.println("<html><body>haha</body></html>");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
