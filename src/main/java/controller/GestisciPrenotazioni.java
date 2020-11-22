package controller;

import dao.PrenotazioneDao;
import dao.implement.PrenotazioneDaoImplement;
import domain.Prenotazione;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/GestisciPrenotazioni")
public class GestisciPrenotazioni extends HttpServlet {


    private PrenotazioneDao prenotazioneDao = PrenotazioneDaoImplement.getInstance();

    public GestisciPrenotazioni() {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        List<Prenotazione> listaPrenotazione = prenotazioneDao.trovaPrenotazioni();
        request.setAttribute("listaPrenotazioni", listaPrenotazione);

        // richiamo il file jsp di registrazione utente
        request.getRequestDispatcher("gestisciPrenotazioni.jsp").forward(request, response);

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.sendRedirect(request.getContextPath() + "/SuperUser");
        response.sendRedirect(request.getContextPath() + "gestisciPrenotazioni.jsp");

    }


}