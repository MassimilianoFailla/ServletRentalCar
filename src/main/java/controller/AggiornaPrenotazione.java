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

@WebServlet("/AggiornaPrenotazione")
public class AggiornaPrenotazione extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public AggiornaPrenotazione() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        String prenotazioneId = request.getParameter("id");

        if (prenotazioneId == "" || prenotazioneId == null)
            request.getRequestDispatcher("/RegistraPrenotazione").forward(request, response);
        else {
            int id = Integer.parseInt(prenotazioneId);
            PrenotazioneDao prenotazioneDao = PrenotazioneDaoImplement.getInstance();
            Prenotazione prenotazione = prenotazioneDao.trovaById(id);
            request.setAttribute("prenotazione", prenotazione);

            List<Prenotazione> listaPrenotazioni = prenotazioneDao.trovaPrenotazioni();
            request.setAttribute("listaPrenotazioni", listaPrenotazioni);

            request.getRequestDispatcher("registrazionePrenotazione.jsp").forward(request, response);

        }
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     *      response)
     */

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String prenotazioneId = request.getParameter("id");

        if (prenotazioneId == "" || prenotazioneId == null)
            request.getRequestDispatcher("/RegistraPrenotazione").forward(request, response);
        else {
            int id = Integer.parseInt(prenotazioneId);
            PrenotazioneDao prenotazioneDao = PrenotazioneDaoImplement.getInstance();
            Prenotazione prenotazione = prenotazioneDao.trovaById(id);
            request.setAttribute("prenotazione", prenotazione);
            request.getRequestDispatcher("/RegistraPrenotazione").forward(request, response);
        }
    }

}