package dao.implement;

import config.HibernateConfig;
import dao.UtenteDao;
import domain.Utente;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import java.util.List;

public class UtenteDaoImplement implements UtenteDao {

    private static UtenteDaoImplement utenteDaoImpl = null;

    public UtenteDaoImplement() {

        sessionFactory = HibernateConfig.getSessionFactory();
    }

    private SessionFactory sessionFactory;


    public int salvaUtente(Utente utente) {
        Session session = this.sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        int id = (int) session.save(utente);
        transaction.commit();
        session.close();
        return id;
    }


    public void aggiornaUtente(Utente utente) {
        Session session = this.sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        session.update(utente);
        transaction.commit();
        session.close();
    }

    public void cancellaUtente(int id) {
        Session session = this.sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        Utente utente = session.get(Utente.class, id);
        session.delete(utente);
        transaction.commit();
        session.close();
    }

    @Override
    public boolean validate(String username, String password) {

        Transaction transaction = null;
        Utente utente = null;
        try (Session session = HibernateConfig.getSessionFactory().openSession()) {
            // start a transaction
            transaction = session.beginTransaction();
            // get an user object
            utente = (Utente) session.createQuery("FROM Utente U WHERE U.username = :username").setParameter("username", username)
                    .uniqueResult();
            if (utente != null && utente.getPassword().equals(password)) {
                return true;
            }
            // commit transaction
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
        return false;
    }

    @SuppressWarnings("unchecked")
    public List<Utente> trovaUtenti() {
        Session session = this.sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
        Query query = session.createQuery(" FROM Utente U ");
        List<Utente> listaUtenti = query.list();
        tx.commit();
        session.close();
        return listaUtenti;
    }



    public Utente trovaById(int id) {

        Session session = this.sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
        Query query = session.createQuery(" FROM Utente U WHERE U.id = :id ");
        query.setParameter("id", id);
        Utente utente = (Utente) query.uniqueResult();
        tx.commit();
        session.close();
        return utente;
    }

    public List<Utente> trovaPerNome(String nome){
        Session session = this.sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
        Query query = session.createQuery(" FROM Utente U WHERE U.nome = :nome ");
        query.setParameter("nome", nome);
        List<Utente> listaUtenti = query.list();
        tx.commit();
        session.close();
        return listaUtenti;
    }

    public List<Utente> trovaPerCognome(String cognome){
        Session session = this.sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
        Query query = session.createQuery(" FROM Utente U WHERE U.cognome = :cognome ");
        query.setParameter("nome", cognome);
        List<Utente> listaUtenti = query.list();
        tx.commit();
        session.close();
        return listaUtenti;
    }

    public List<Utente> trovaPerAnnoNascita(String annoNascita){
        Session session = this.sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
        Query query = session.createQuery(" FROM Utente U WHERE U.annoNascita = :annoNascita ");
        query.setParameter("annoNascita", annoNascita);
        List<Utente> listaUtenti = query.list();
        tx.commit();
        session.close();
        return listaUtenti;
    }

    public Utente trovaPerEmail(String email) {

        Session session = this.sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
        Query query = session.createQuery(" FROM Utente U WHERE U.email = :email ");
        query.setParameter("email", email);
        Utente utente = (Utente) query.uniqueResult();
        tx.commit();
        session.close();
        return utente;
    }




    @SuppressWarnings({"unchecked", "deprecation"})
    public Utente trovaPerPassword(String password) {
        Session session = this.sessionFactory.openSession();
        Utente utente = new Utente();
        List<Utente> listaUtenti = session.createCriteria(Utente.class).list();
        for (Utente ut : listaUtenti) {
            String temp = ut.getPassword();
            if (temp.equals(password)) {
                utente.setId(ut.getId());
                utente.setEmail(ut.getEmail());
                utente.setRole(ut.getRole());

            }
        }
        session.close();
        return utente;
    }

    public static UtenteDao getInstance() {
        if (utenteDaoImpl == null)
            utenteDaoImpl = new UtenteDaoImplement();
        return utenteDaoImpl;
    }
}