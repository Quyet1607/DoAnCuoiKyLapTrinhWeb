package com.example;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.model.pcsv;
import com.model.pcsvDB;

/**
 * Servlet implementation class ThempcsvServlet
 */
public class ThempcsvServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ThempcsvServlet() {
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
		String mahd1 = request.getParameter("mahd");
		int mahd = Integer.parseInt(mahd1);
		String masv = request.getParameter("masv");
		String makhoa = request.getParameter("makhoa");
		
		pcsv pcsv = new pcsv(mahd, masv);
		pcsvDB.insertPCSV(pcsv);
		HttpSession session = request.getSession();
		session.setAttribute("mahd", mahd);
		session.setAttribute("makhoa", makhoa);
		request.getRequestDispatcher("ThemSVHD.jsp").forward(request, response);	
	}

}
