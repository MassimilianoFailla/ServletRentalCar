package controller;

import dao.UtenteDao;
import dao.implement.UtenteDaoImplement;
import domain.Utente;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/SuperUser")
public class SuperUser extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private UtenteDao utenteDao = UtenteDaoImplement.getInstance();

    /**
     * @see HttpServlet#HttpServlet()
     */
    public SuperUser() {

    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     * response)
     */

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        List<Utente> listaUtenti = utenteDao.trovaUtenti();
        request.setAttribute("listaUtenti", listaUtenti);

        // richiamo il file jsp di registrazione utente
        request.getRequestDispatcher("superuser.jsp").forward(request, response);

    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     * response)
     */

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.sendRedirect(request.getContextPath() + "/SuperUser");

    }
}
