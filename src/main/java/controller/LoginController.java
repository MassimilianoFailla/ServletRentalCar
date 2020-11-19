package controller;

import dao.UtenteDao;
import dao.implement.UtenteDaoImplement;
import domain.Utente;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;


/**
 * Servlet implementation class LoginController
 */

@WebServlet("/LoginController")
public class LoginController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private UtenteDao utenteDao = UtenteDaoImplement.getInstance();


    public LoginController() {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        response.sendRedirect("login.jsp");

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            authenticate(request, response);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    private void authenticate(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        // ricavo le password ed username al login
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // setto la sessione
        HttpSession session = request.getSession();

        // effettuo il controllo password/username + relativo tipologia di utente
        if (utenteDao.validate(username, password)) {
            Utente utente = utenteDao.trovaPerPassword(password);
            int idUtente = utente.getId();
            String role = utente.getRole();
            if (role.equals("SuperUser")) {
                RequestDispatcher dispatcher = request.getRequestDispatcher("/SuperUser");
                session.setAttribute("idUtente", idUtente);
                dispatcher.forward(request, response);

            } else if (role.equals("Customer")) {
                RequestDispatcher dispatcher = request.getRequestDispatcher("/CustomerUser");
                session.setAttribute("idUtente", idUtente);
                dispatcher.forward(request, response);

            }
        } else {
            RequestDispatcher dispatcher = request.getRequestDispatcher("errorlogin.jsp");
            dispatcher.forward(request, response);
        }
    }
}