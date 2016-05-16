package servletdemo;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class TestServlet
 */
public class TestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		String weburl = request.getParameter("weburl");
        if(weburl!=null&&weburl.equals("http://www.w3csschool.com")){
             request.setAttribute("weburl", "���������W3C���߽̳���");
        }else{
             request.setAttribute("weburl", "���������ַ�����ݿ���δ�м�¼");
        }
        RequestDispatcher dispatcher = request.getRequestDispatcher("result.jsp");
        dispatcher.forward(request, response);
		
	}

}
