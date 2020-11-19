package dao;

import domain.Utente;

import java.util.List;

public interface UtenteDao {

    int salvaUtente(Utente Utente);

    void aggiornaUtente(Utente Utente);

    void cancellaUtente(int id);

    boolean validate(String username, String password);

    Utente trovaById(int id);

    // metodi da implementare per il filtraggio --------

    public List<Utente> trovaPerNome(String nome);

    public List<Utente> trovaPerCognome(String cognome);

    // -------------------------------------------------


    Utente trovaPerPassword(String password);

    List<Utente> trovaUtenti();


}
