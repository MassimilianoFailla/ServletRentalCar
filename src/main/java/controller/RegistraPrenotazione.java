package controller;

import dao.MezzoDao;
import dao.PrenotazioneDao;
import dao.implement.MezzoDaoImplement;
import dao.implement.PrenotazioneDaoImplement;
import domain.Mezzo;
import domain.Prenotazione;
import org.hibernate.type.descriptor.java.LocalDateJavaDescriptor;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;
import java.util.Locale;

@WebServlet("/RegistraPrenotazione")
public class RegistraPrenotazione extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private PrenotazioneDao prenotazioneDao = PrenotazioneDaoImplement.getInstance();
    private MezzoDao mezzoDao = MezzoDaoImplement.getInstance();


    /**
     * @see HttpServlet#HttpServlet()
     */

    public RegistraPrenotazione() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // richiamo la lista delle prenotazioni che voglio visualizzare all'itnerno del db
        List<Mezzo> listaMezzi = mezzoDao.trovaMezzi();
        request.setAttribute("listaMezzi", listaMezzi);

        List<Prenotazione> listaPrenotazioni = prenotazioneDao.trovaPrenotazioni();
        request.setAttribute("listaPrenotazioni", listaPrenotazioni);

        // richiamo il file jsp di registrazione utente
        request.getRequestDispatcher("registrazionePrenotazione.jsp").forward(request, response);
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        // parametri che passo alla post
        String prenotazioneId = request.getParameter("id");
        int idUtente = Integer.parseInt(request.getParameter("idUtente"));
        String dataInizio = request.getParameter("inizioPrenotazione");
        String dataFine = request.getParameter("finePrenotazione");
        String targa = request.getParameter("targa");

        HttpSession currentSession = request.getSession();
        int idUserInt = (int) currentSession.getAttribute("idUtente");
        System.out.println(idUserInt);

        Prenotazione prenotazione = new Prenotazione(dataInizio, dataFine, idUtente, targa);

        prenotazioneDao.salvaPrenotazione(prenotazione);
        if (prenotazioneId == null || prenotazioneId == "")
            prenotazioneDao.salvaPrenotazione(prenotazione);
        else {
            int id = Integer.parseInt(prenotazioneId);
            prenotazione.setId(id);
            prenotazioneDao.aggiornaPrenotazione(prenotazione);
        }

        // serve a richiamare la servlet che voglio io
        response.sendRedirect(request.getContextPath() + "/RegistraPrenotazione");
    }

}

