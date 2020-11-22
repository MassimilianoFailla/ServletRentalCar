package dao.implement;

import config.HibernateConfig;
import dao.MezzoDao;
import domain.Mezzo;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import java.util.List;

public class MezzoDaoImplement implements MezzoDao {
    private static MezzoDaoImplement mezzoDaoImpl = null;

    private SessionFactory sessionFactory = HibernateConfig.getSessionFactory();

    public int salvaMezzo(Mezzo mezzo) {
        Session session = this.sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        int id = (int) session.save(mezzo);
        transaction.commit();
        session.close();

        return id;
    }

    public void aggiornaMezzo(Mezzo mezzo) {
        Session session = this.sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        session.update(mezzo);
        transaction.commit();
        session.close();
    }

    public void cancellaMezzo(int id) {
        Session session = this.sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        Mezzo mezzo = session.get(Mezzo.class, id);
        session.delete(mezzo);
        transaction.commit();
        session.close();
    }

    public Mezzo trovaById(int id) {
        Session session = this.sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
        Query query = session.createQuery(" FROM Mezzo M WHERE M.id = :id ");
        query.setParameter("id", id);
        Mezzo mezzo = (Mezzo) query.uniqueResult();
        tx.commit();
        session.close();
        return mezzo;
    }

    @Override
    public Mezzo trovaPerTarga(String targa) {
        Session session = this.sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
        Query query = session.createQuery(" FROM Mezzo M WHERE M.targa = :targa ");
        query.setParameter("targa", targa);
        Mezzo mezzo = (Mezzo) query.uniqueResult();
        tx.commit();
        session.close();
        return mezzo;
    }

    @SuppressWarnings({"unchecked", "deprecation"})
    public List<Mezzo> trovaMezzi() {
        Session session = this.sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
        Query query = session.createQuery(" FROM Mezzo M ");
        List<Mezzo> listaMezzi = query.list();
        tx.commit();
        session.close();
        return listaMezzi;
    }

    @Override
    public List<Mezzo> trovaPerModello(String modello) {

        Session session = this.sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
        Query query = session.createQuery(" FROM Mezzo M WHERE M.modello = :modello ");
        query.setParameter("modello", modello);
        List<Mezzo> listaMezzi = query.list();
        tx.commit();
        session.close();
        return listaMezzi;
    }

    @Override
    public List<Mezzo> trovaPerCasaCostruttrice(String casaCostruttrice) {
        Session session = this.sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
        Query query = session.createQuery(" FROM Mezzo M WHERE M.casaCostruttrice = :casaCostruttrice ");
        query.setParameter("casaCostruttrice", casaCostruttrice);
        List<Mezzo> listaMezzi = query.list();
        tx.commit();
        session.close();
        return listaMezzi;
    }

    public List<Mezzo> trovaPerAnnoImmatricolazione(String annoImmatricolazione) {
        Session session = this.sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
        Query query = session.createQuery(" FROM Mezzo M WHERE M.annoImmatricolazione = :annoImmatricolazione ");
        query.setParameter("annoImmatricolazione", annoImmatricolazione);
        List<Mezzo> listaMezzi = query.list();
        tx.commit();
        session.close();
        return listaMezzi;

    }

    public static MezzoDao getInstance() {
        if (mezzoDaoImpl == null)
            mezzoDaoImpl = new MezzoDaoImplement();
        return mezzoDaoImpl;
    }

}
