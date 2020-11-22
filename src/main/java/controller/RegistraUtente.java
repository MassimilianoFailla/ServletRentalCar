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
 * Servlet implementation class RegistraUtente
 */
@WebServlet("/RegistraUtente")
public class RegistraUtente extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private UtenteDao utenteDao = UtenteDaoImplement.getInstance();

    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegistraUtente() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // richiamo la lista degli utenti che voglio visualizzare all'itnerno del db
        List<Utente> listaUtenti = utenteDao.trovaUtenti();
        request.setAttribute("listaUtenti", listaUtenti);

        // richiamo il file jsp di registrazione utente
        request.getRequestDispatcher("registrazioneUtente.jsp").forward(request, response);
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        // parametri che passo alla post
        String utenteId = request.getParameter("id");
        String nome = request.getParameter("nome");
        String cognome = request.getParameter("cognome");
        String dataNascita = request.getParameter("dataNascita");
        String codiceFiscale = request.getParameter("codiceFiscale");
        String email = request.getParameter("email");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String role = request.getParameter("role");

        Utente utente = new Utente(nome, cognome, dataNascita, codiceFiscale, email, username, password, role);
        if (utenteId == null || utenteId == "")
            utenteDao.salvaUtente(utente);
        else {
            int id = Integer.parseInt(utenteId);
            utente.setId(id);
            utenteDao.aggiornaUtente(utente);
        }

        // serve a richiamare la servlet che voglio io
        response.sendRedirect(request.getContextPath() + "/RegistraUtente");
    }

}
