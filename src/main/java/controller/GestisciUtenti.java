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

@WebServlet("/GestisciUtenti")
public class GestisciUtenti extends HttpServlet {

    private UtenteDao utenteDao = UtenteDaoImplement.getInstance();

    public GestisciUtenti() {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        List<Utente> listaUtenti = utenteDao.trovaUtenti();
        request.setAttribute("listaUtenti", listaUtenti);

        // richiamo il file jsp di registrazione utente
        request.getRequestDispatcher("gestisciUtenti.jsp").forward(request, response);

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.sendRedirect(request.getContextPath() + "/SuperUser");
        response.sendRedirect(request.getContextPath() + "gestisciUtenti.jsp");

    }


}