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

/**
 * Servlet implementation class HomeController
 */

//@WebServlet(name = "Home", urlPatterns = { "/" })
@WebServlet("/HomeController")
public class HomeController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private UtenteDao utenteDao = UtenteDaoImplement.getInstance();

    public HomeController() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // TODO Auto-generated method stub

        // qui dentro richiamo la lista di utenti che voglio visualizzare all'interno del db
        List<Utente> listaUtenti = utenteDao.trovaUtenti();
        request.setAttribute("listaUtenti", listaUtenti);

        // qui richiamo la get per il file jsp di registrazione utente
        request.getRequestDispatcher("registrazioneUtente.jsp").forward(request, response);
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // TODO Auto-generated method stub
        doGet(request, response);
    }

}
