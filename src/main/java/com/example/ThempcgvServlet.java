package com.example;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.model.pcgv;
import com.model.pcgvDB;

/**
 * Servlet implementation class ThempcgvServlet
 */
public class ThempcgvServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ThempcgvServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String makhoa = request.getParameter("makhoa");
		int mahd = Integer.parseInt(request.getParameter("mahd"));
		String magv = request.getParameter("magv");
		
		pcgv pcgv = new com.model.pcgv(mahd, magv);
		pcgvDB.insertPCGV(pcgv);
		HttpSession session = request.getSession();
		session.setAttribute("mahd", mahd);
		session.setAttribute("makhoa", makhoa);
		request.getRequestDispatcher("ThemGVHD.jsp").forward(request, response);
	}

}
