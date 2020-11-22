package dao;

import domain.Mezzo;

import java.util.List;

public interface MezzoDao {

    int salvaMezzo(Mezzo Mezzo);

    void aggiornaMezzo(Mezzo Mezzo);

    void cancellaMezzo(int id);

    Mezzo trovaById(int id);

    Mezzo trovaPerTarga(String targa);

    List<Mezzo> trovaMezzi();

    //metodi da implementare nel filtraggio

    List<Mezzo> trovaPerModello(String modello);

    List<Mezzo> trovaPerCasaCostruttrice(String casaCostruttrice);

    List<Mezzo> trovaPerAnnoImmatricolazione(String annoImmatricolazione);
}