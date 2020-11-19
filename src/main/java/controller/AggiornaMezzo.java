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

@WebServlet("/AggiornaMezzo")
public class AggiornaMezzo extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public AggiornaMezzo() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        String mezzoId = request.getParameter("id");
        if (mezzoId == "" || mezzoId == null)
            request.getRequestDispatcher("/RegistraMezzo").forward(request, response);
        else {
            int id = Integer.parseInt(mezzoId);
            MezzoDao mezzoDao = MezzoDaoImplement.getInstance();
            Mezzo mezzo = mezzoDao.trovaById(id);
            request.setAttribute("mezzo", mezzo);
            List<Mezzo> listaMezzi = mezzoDao.trovaMezzi();
            request.setAttribute("listaMezzi", listaMezzi);
            request.getRequestDispatcher("registrazioneMezzo.jsp").forward(request, response);
        }
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     * response)
     */

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String mezzoId = request.getParameter("id");
        if (mezzoId == "" || mezzoId == null)
            request.getRequestDispatcher("/RegistraMezzo").forward(request, response);
        else {
            int id = Integer.parseInt(mezzoId);
            MezzoDao mezzoDao = MezzoDaoImplement.getInstance();
            Mezzo mezzo = mezzoDao.trovaById(id);
            request.setAttribute("mezzo", mezzo);
            request.getRequestDispatcher("/RegistraMezzo").forward(request, response);
        }
    }
}