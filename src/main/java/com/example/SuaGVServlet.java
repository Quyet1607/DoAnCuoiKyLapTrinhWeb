package com.example;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.model.GV;
import com.model.GVDB;

public class SuaGVServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SuaGVServlet() {
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
		String magv = request.getParameter("MaGV");
		String tengv = request.getParameter("TenGV");
		String ns = request.getParameter("NgaySinh");
		String gt = request.getParameter("GT");
		String email = request.getParameter("Email");
		String makhoa = request.getParameter("makhoa");
		
		System.out.println(magv);
		System.out.println(tengv);
		System.out.println(ns);
		System.out.println(gt);
		System.out.println(email);
		System.out.println(makhoa);
		
		GV gv = new GV(magv, tengv, ns, gt, email, makhoa);
		GVDB.updateGVByMaGV(magv, gv, makhoa);
		request.setAttribute("makhoa", makhoa);
		request.getRequestDispatcher("GV.jsp").forward(request, response);
	}

}
