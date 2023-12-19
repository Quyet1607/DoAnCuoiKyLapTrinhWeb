package com.example;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.model.HD;
import com.model.HDDB;

/**
 * Servlet implementation class ThemHDServlet
 */
public class ThemHDServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ThemHDServlet() {
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
		int id1 = 0;
		String makhoa = request.getParameter("makhoa");
		String diadiem = request.getParameter("diadiem");
		String thoigian1 = request.getParameter("thoigian1");
		String thoigian2 = request.getParameter("thoigian2");
		int sosv = 0;
		int sogv = 0;
		HD hd = new HD(id1, diadiem, thoigian1 + ' ' + thoigian2, sosv, sogv, makhoa);
		System.out.println(diadiem);
		System.out.println(thoigian1 + ' ' + thoigian2);
		System.out.println(sosv);
		System.out.println(sogv);
		System.out.println(makhoa);
		int id = HDDB.insertHD(hd);
		
		HttpSession session = request.getSession();
		request.setAttribute("hd", hd);
		session.setAttribute("mahd", id);
		session.setAttribute("makhoa", makhoa);
		request.getRequestDispatcher("ThemSVHD.jsp").forward(request, response);
		
	}

}
