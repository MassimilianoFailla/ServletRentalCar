package controller;

import dao.UtenteDao;
import dao.implement.UtenteDaoImplement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class CancellaUtente
 */
@WebServlet("/CancellaUtente")
public class CancellaUtente extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public CancellaUtente() {
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

        String utenteId = request.getParameter("id");

        if (utenteId == "" || utenteId == null)
            request.getRequestDispatcher("/HomeController").forward(request, response);
        else {
            int id = Integer.parseInt(utenteId);
            UtenteDao utenteDao = UtenteDaoImplement.getInstance();
            utenteDao.cancellaUtente(id);
            response.sendRedirect(request.getContextPath() + "/HomeController");
        }
    }
}