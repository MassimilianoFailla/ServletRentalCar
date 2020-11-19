package controller;

import dao.PrenotazioneDao;
import dao.implement.PrenotazioneDaoImplement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/CancellaPrenotazione")
public class CancellaPrenotazione extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public CancellaPrenotazione() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // TODO Auto-generated method stub

        String prenotazioneId = request.getParameter("id");

        if (prenotazioneId == "" || prenotazioneId == null)
            request.getRequestDispatcher("/HomeController").forward(request, response);
        else {
            int id = Integer.parseInt(prenotazioneId);
            PrenotazioneDao prenotazioneDao = PrenotazioneDaoImplement.getInstance();
            prenotazioneDao.cancellaPrenotazione(id);
            response.sendRedirect(request.getContextPath() + "/HomeController");
        }
    }
}
