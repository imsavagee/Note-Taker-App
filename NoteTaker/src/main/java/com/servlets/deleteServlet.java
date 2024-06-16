package com.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Note;
import com.helper.FactoryProvider;

public class deleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public deleteServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			int noteID = Integer.parseInt(req.getParameter("note_id").trim());
			Session s=FactoryProvider.getFactory().openSession();
			Transaction t = s.beginTransaction();
			Note note=(Note) s.get(Note.class,noteID);
			s.delete(note);
			t.commit();
			s.close();
			res.sendRedirect("Add_Notes.jsp");
			
		} catch (Exception e) {

		}

	}

}
