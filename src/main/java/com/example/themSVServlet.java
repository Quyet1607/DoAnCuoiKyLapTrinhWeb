package com.example;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import com.model.SV;
import com.model.SVDB;

/**
 * Servlet implementation class themSVServlet
 */
public class themSVServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public themSVServlet() {
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
		String masv = request.getParameter("MaSV");
		String tensv = request.getParameter("TenSV");
		String ns = request.getParameter("NgaySinh");
		String gt = request.getParameter("GT");
		String quequan = request.getParameter("QueQuan");
		String makhoa = request.getParameter("makhoa");
		String malop = request.getParameter("MaLop");
		String khoahoc1 = request.getParameter("KhoaHoc");
		int khoahoc = Integer.parseInt(khoahoc1);
		
		System.out.println(masv);
		System.out.println(tensv);
		System.out.println(ns);
		System.out.println(gt);
		System.out.println(quequan);
		System.out.println(makhoa);
		System.out.println(malop);
		System.out.println(khoahoc);
		
		SV sv = new SV(masv, tensv, ns, gt, quequan, makhoa, malop, khoahoc);
		SVDB.insertSV(sv);
		request.setAttribute("sv", sv);
		request.getRequestDispatcher("ThemSV.jsp").forward(request, response);
	}

}
