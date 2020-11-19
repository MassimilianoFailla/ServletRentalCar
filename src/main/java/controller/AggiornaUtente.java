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
 * Servlet implementation class AggiornaUtente
 */
@WebServlet("/AggiornaUtente")
public class AggiornaUtente extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public AggiornaUtente() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String utenteId = request.getParameter("id");

        if (utenteId == "" || utenteId == null)
            request.getRequestDispatcher("/RegistraUtente").forward(request, response);
        else {
            int id = Integer.parseInt(utenteId);
            UtenteDao utenteDao = UtenteDaoImplement.getInstance();
            Utente utente = utenteDao.trovaById(id);
            request.setAttribute("utente", utente);
            request.getRequestDispatcher("/RegistraUtente").forward(request, response);
        }
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        String utenteId = request.getParameter("id");

        if (utenteId == "" || utenteId == null)
            request.getRequestDispatcher("/RegistraUtente").forward(request, response);
        else {
            int id = Integer.parseInt(utenteId);
            UtenteDao utenteDao = UtenteDaoImplement.getInstance();
            Utente utente = utenteDao.trovaById(id);
            request.setAttribute("utente", utente);

            List<Utente> listaUtenti = utenteDao.trovaUtenti();
            request.setAttribute("listaUtenti", listaUtenti);

            request.getRequestDispatcher("registrazioneUtente.jsp").forward(request, response);

        }
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     *      response)
     */

}