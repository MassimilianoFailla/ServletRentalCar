package controller;

import dao.MezzoDao;
import dao.PrenotazioneDao;
import dao.implement.MezzoDaoImplement;
import dao.implement.PrenotazioneDaoImplement;
import domain.Mezzo;
import domain.Prenotazione;
import domain.Utente;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

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
        // con l'apposito filtraggio
        if (request.getParameter("filtro") == null) {
            List<Mezzo> listaMezzi = mezzoDao.trovaMezzi();
            request.setAttribute("listaMezzi", listaMezzi);
        } else {
            String selezione = request.getParameter("selezione");
            String filtro = request.getParameter("filtro");
            if (filtro.equals("")) {
                List<Mezzo> listaMezzi = mezzoDao.trovaMezzi();
                request.setAttribute("listaMezzi", listaMezzi);
            } else {
                if (selezione.equals("modello")) {
                    System.out.println(filtro);
                    List<Mezzo> listaMezzi = mezzoDao.trovaPerModello(filtro);
                    request.setAttribute("listaMezzi", listaMezzi);
                }
                if (selezione.equals("annoImmatricolazione")) {
                    System.out.println(filtro);
                    List<Mezzo> listaMezzi = mezzoDao.trovaPerAnnoImmatricolazione(filtro);
                    request.setAttribute("listaMezzi", listaMezzi);
                }
                if (selezione.equals("casaCostruttrice")) {
                    System.out.println(filtro);
                    List<Mezzo> listaMezzi = mezzoDao.trovaPerCasaCostruttrice(filtro);
                    request.setAttribute("listaMezzi", listaMezzi);
                }
            }
        }

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
        String dataInizio = request.getParameter("inizioPrenotazione");
        String dataFine = request.getParameter("finePrenotazione");
        String targa = request.getParameter("targa");

        HttpSession currentSession = request.getSession();

        int idUserInt = (int) currentSession.getAttribute("idUtente");
        Utente utente = new Utente();
        utente.setId(idUserInt);

        Mezzo mezzo = mezzoDao.trovaPerTarga(targa);
        Prenotazione prenotazione = new Prenotazione(dataInizio, dataFine, utente, mezzo);

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

