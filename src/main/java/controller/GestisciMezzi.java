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

@WebServlet("/GestisciMezzi")
public class GestisciMezzi extends HttpServlet {

    private MezzoDao mezzzoDao = MezzoDaoImplement.getInstance();

    public GestisciMezzi() {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        List<Mezzo> listaMezzi = mezzzoDao.trovaMezzi();
        request.setAttribute("listaMezzi", listaMezzi);

        // richiamo il file jsp di registrazione utente
        request.getRequestDispatcher("gestisciMezzi.jsp").forward(request, response);

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.sendRedirect(request.getContextPath() + "/CustomerUser");
        response.sendRedirect(request.getContextPath() + "gestisciMezzi.jsp");

    }


}
