package dao.implement;

import config.HibernateConfig;
import dao.PrenotazioneDao;
import domain.Prenotazione;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import java.util.List;

public class PrenotazioneDaoImplement implements PrenotazioneDao {

    private static PrenotazioneDaoImplement prenotazioneDaoImplement = null;

    private SessionFactory sessionFactory = HibernateConfig.getSessionFactory();

    public int salvaPrenotazione(Prenotazione prenotazione) {
        Session session = this.sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        int id = (int) session.save(prenotazione);
        transaction.commit();
        session.close();
        return id;
    }

    public void aggiornaPrenotazione(Prenotazione prenotazione) {
        Session session = this.sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        session.update(prenotazione);
        transaction.commit();
        session.close();
    }

    public void cancellaPrenotazione(int id) {
        Session session = this.sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        Prenotazione prenotazione = session.get(Prenotazione.class, id);
        session.delete(prenotazione);
        transaction.commit();
        session.close();
    }

    public Prenotazione trovaPrenotazionePerId(int id) {
        Session session = this.sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
        Query query = session.createQuery(" FROM Prenotazione P WHERE P.id = :id ");
        query.setParameter("id", id);
        Prenotazione prenotazione = (Prenotazione) query.uniqueResult();
        tx.commit();
        session.close();
        return prenotazione;
    }

    @SuppressWarnings({"unchecked", "deprecation"})
    public List<Prenotazione> trovaPrenotazioniPerId(int id) {
        Session session = this.sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
        String hql = "SELECT P.* FROM Prenotazione P, Mezzo M "
                + " WHERE P.mezzo.targa = M.targa AND P.utente.id =  :id";
        Query query = session.createQuery(hql);
        query.setParameter("id", id);
        List<Prenotazione> listaPrenotazioni = query.list();
        tx.commit();
        session.close();
        return listaPrenotazioni;
    }

    @SuppressWarnings({"unchecked", "deprecation"})
    public List<Prenotazione> trovaPrenotazioni() {
        Session session = this.sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
        Query query = session.createQuery(" FROM Prenotazione P ");
        List<Prenotazione> listaPrenotazioni = query.list();
        tx.commit();
        session.close();
        return listaPrenotazioni;
    }

    public static PrenotazioneDao getInstance() {
        if (prenotazioneDaoImplement == null)
            prenotazioneDaoImplement = new PrenotazioneDaoImplement();
        return prenotazioneDaoImplement;

    }

}