package controller;

import dao.MezzoDao;
import dao.implement.MezzoDaoImplement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/CancellaMezzo")
public class CancellaMezzo extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public CancellaMezzo() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // TODO Auto-generated method stub

        String mezzoId = request.getParameter("id");

        if (mezzoId == "" || mezzoId == null)
            request.getRequestDispatcher("/HomeController").forward(request, response);
        else {
            int id = Integer.parseInt(mezzoId);
            MezzoDao mezzoDao = MezzoDaoImplement.getInstance();
            mezzoDao.cancellaMezzo(id);
            response.sendRedirect(request.getContextPath() + "/HomeController");
        }
    }
}