package controller;

import java.io.IOException;

import dao.ViagemDao;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Onibus;
import model.Viagem;

public class ViagemServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    public ViagemServlet() {
        super();
    }
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("onibus", null);
		request.setAttribute("viagem", null);
		
		if(request.getParameter("btnSubmitO")!=null) {
			String codigo = request.getParameter("txtCodigo");
			request.setAttribute("onibus", buscarOnibus(codigo));
		}
		if(request.getParameter("btnSubmitV")!=null) {
			String codigo = request.getParameter("txtCodigo");
			request.setAttribute("viagem", buscarViagem(codigo));
		}
		
		RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
		rd.forward(request, response);
		
	}

	private Onibus buscarOnibus(String codigo) {
		ViagemDao d = new ViagemDao();
		return d.buscarOnibus(codigo);
	}
	
	private Viagem buscarViagem(String codigo) {
		ViagemDao d = new ViagemDao();
		return d.buscarViagem(codigo);
	}
}
