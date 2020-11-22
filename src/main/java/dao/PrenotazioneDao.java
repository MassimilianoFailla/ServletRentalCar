package dao;

import domain.Prenotazione;

import java.util.List;

public interface PrenotazioneDao {
    int salvaPrenotazione(Prenotazione Prenotazione);

    void aggiornaPrenotazione(Prenotazione Prenotazione);

    void cancellaPrenotazione(int id);

    public Prenotazione trovaPrenotazionePerId(int id);

    public List<Prenotazione> trovaPrenotazioniPerId(int id);

    List<Prenotazione> trovaPrenotazioni();

}
