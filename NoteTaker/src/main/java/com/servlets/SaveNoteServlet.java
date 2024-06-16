package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Note;
import com.helper.FactoryProvider;

@WebServlet("/SaveNoteServlet")
public class SaveNoteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public SaveNoteServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub

		try {
			String title = req.getParameter("title");
			String content = req.getParameter("content");

			Note note = new Note(01, title, content, new Date());
			System.out.println(note.getID() + " : " + note.getTitle());

			Session s = FactoryProvider.getFactory().openSession();
			Transaction tx = s.beginTransaction();
			s.save(note);
			tx.commit();
			s.close();
			res.setContentType("text/html");
			PrintWriter out = res.getWriter();
			out.print("<h1 style='text-align:center;'>Note is added</h1>");
			out.print("<h1 style='text-align:center;'><a href='All_Notes.jsp'>View all notes</a></h1>");

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
