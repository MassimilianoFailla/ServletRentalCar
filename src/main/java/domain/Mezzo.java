package domain;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;


@Entity
@Table(name = "Mezzo")
public class Mezzo implements Serializable{

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;

    @Column(name = "casaCostruttrice")
    private String casaCostruttrice;

    @Column(name = "modello")
    private String modello;

    @Column(name = "annoImmatricolazione")
    private String annoImmatricolazione;

    @Column(name = "targa")
    private String targa;

    @OneToMany (fetch = FetchType.LAZY, mappedBy = "mezzo", cascade=CascadeType.ALL)
    private List<Prenotazione> listaPrenotazioni;
    public List<Prenotazione> getListaPrenotazioni() {
        return listaPrenotazioni;
    }

    @Column(name = "tipologia")
    private String tipologia;

    public Mezzo() {

    }

    public Mezzo(String casaCostruttrice, String modello, String annoImmatricolazione, String targa, String tipologia) {
        this.casaCostruttrice = casaCostruttrice;
        this.modello = modello;
        this.annoImmatricolazione = annoImmatricolazione;
        this.targa = targa;
        this.tipologia = tipologia;
    }

    public int getId() {

        return id;
    }

    public void setId(int id) {

        this.id = id;
    }

    public String getCasaCostruttrice() {

        return casaCostruttrice;
    }

    public void setCasaCostruttrice(String casaCostruttrice){
        this.casaCostruttrice = casaCostruttrice;
    }

    public String getModello() {

        return modello;
    }

    public void setModello(String modello) {

        this.modello = modello;
    }

    public String getAnnoImmatricolazione() {

        return annoImmatricolazione;
    }

    public void setAnnoImmatricolazione(String annoImmatricolazione) {
        this.annoImmatricolazione = annoImmatricolazione;
    }

    public String getTarga() {

        return targa;
    }

    public void setTarga(String targa) {

        this.targa = targa;
    }

    public String getTipologia() {

        return tipologia;
    }

    public void setTipologia(String tipologia)
    {

        this.tipologia = tipologia;
    }

    public void setListaPrenotazioni(List<Prenotazione> listaPrenotazioni) {
        this.listaPrenotazioni = listaPrenotazioni;
    }



    public String toString() {
        return "Mezzo -> Modello: " + modello + " - Casa Costruttrice: " + casaCostruttrice
                + " - Anno Immatricolazione: " + annoImmatricolazione + " - Targa: " + targa + " - Tipologia Mezzo: "
                + tipologia + ";";
    }
}
