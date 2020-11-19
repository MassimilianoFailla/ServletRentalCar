package controller;

import dao.MezzoDao;
import dao.implement.MezzoDaoImplement;
import domain.Mezzo;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/RegistraMezzo")
public class RegistraMezzo extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private MezzoDao mezzoDao = MezzoDaoImplement.getInstance();

    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegistraMezzo() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // richiamo la lista dei mezzi che voglio visualizzare all'interno del db
        List<Mezzo> listaMezzi = mezzoDao.trovaMezzi();
        request.setAttribute("listaMezzi", listaMezzi);

        // richiamo il file jsp di registrazione utente
        request.getRequestDispatcher("registrazioneMezzo.jsp").forward(request, response);
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     * response)
     */

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        // parametri che passo alla post
        String mezzoId = request.getParameter("id");
        String casaCostruttire = request.getParameter("casaCostruttrice");
        String modello = request.getParameter("modello");
        String annoImmatricolazione = request.getParameter("annoImmatricolazione");
        String targa = request.getParameter("targa");
        String tipologia = request.getParameter("tipologia");

        Mezzo mezzo = new Mezzo(casaCostruttire, modello, annoImmatricolazione, targa, tipologia);
        if (mezzoId == null || mezzoId == "")
            mezzoDao.salvaMezzo(mezzo);
        else {
            int id = Integer.parseInt(mezzoId);
            mezzo.setId(id);
            mezzoDao.aggiornaMezzo(mezzo);
        }

        // serve a richiamare la servlet che voglio io
        response.sendRedirect(request.getContextPath() + "/RegistraMezzo");
    }

}
