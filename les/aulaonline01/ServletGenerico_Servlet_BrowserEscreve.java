//Servlet manda para o browser
//http://localhost:8080/DuduServer/generico?DATA=22 JUNHO

package dudu;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import javax.servlet.GenericServlet;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;

@WebServlet("/generico")
public class ServletGenerico extends GenericServlet {

	@Override
	public void service(ServletRequest req, ServletResponse res) 
			throws ServletException, IOException {
		
		    String d = req.getParameter("DATA");
		    
		    res.setContentType("text/html");
			    
		    PrintWriter out = res.getWriter();
		    out.println("<h2>Olá Navegador, obrigado por executar o Servlet</h2>");
		    out.print("<h3>Você informou a data: </h3> " + d);
		    out.flush();;
		    

	}

}