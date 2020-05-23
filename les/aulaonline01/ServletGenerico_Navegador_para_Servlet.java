// Navegador enviando para o servlet
// http://localhost:8080/DuduServer/generico?DATA=22%20JUNHO


package dudu;

import java.io.IOException;
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
		    System.out.println("Data enviada: " + d);

	}

}
