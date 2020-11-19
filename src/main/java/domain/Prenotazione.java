package domain;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "Prenotazione")
public class Prenotazione implements Serializable{

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;

    @Column(name = "inizioPrenotazione")
    private String inizioPrenotazione;

    @Column(name = "finePrenotazione")
    private String finePrenotazione;

    @ManyToOne(fetch = FetchType.LAZY, cascade=CascadeType.ALL)
    @JoinColumn(name = "idUtente", referencedColumnName = "id")
    private Utente utente;

    @Column(insertable=false, updatable=false)
    private int idUtente;

    @ManyToOne(fetch = FetchType.LAZY, cascade=CascadeType.ALL)
    @JoinColumn(name = "targa", referencedColumnName = "targa")
    private Mezzo mezzo;


    @Column(insertable=false, updatable=false, length = 100)
    private String targa;

    public Prenotazione(){

    }

    public Prenotazione(String inizioPrenotazione, String finePrenotazione, int idUtente, String targa) {
        this.inizioPrenotazione = inizioPrenotazione;
        this.finePrenotazione = finePrenotazione;
        this.idUtente = idUtente;
        this.targa = targa;
    }

    public int getId() {

        return id;
    }

    public void setId(int id) {

        this.id = id;
    }

    public void setInizioPrenotazione(String inizioPrenotazione) {

        this.inizioPrenotazione = inizioPrenotazione;
    }

    public void setFinePrenotazione(String finePrenotazione) {

        this.finePrenotazione = finePrenotazione;
    }

    public String getInizioPrenotazione() {

        return inizioPrenotazione;
    }

    public String getFinePrenotazione() {

        return finePrenotazione;
    }

    public Utente getUtente() {
        return utente;
    }

    public void setUtente(Utente utente) {
        this.utente = utente;
    }

    public Mezzo getMezzo() {
        return mezzo;
    }

    public void setMezzo(Mezzo mezzo) {
        this.mezzo = mezzo;
    }

    public int getIdUtente() {
        return idUtente;
    }

    public void setIdUtente(int idUtente) {
        this.idUtente = idUtente;
    }

    public String getTarga() {
        return targa;
    }

    public void setTarga(String targa) {
        this.targa = targa;
    }

    public String toString() {
        return "Prenotazione -> Data Inizio: " +inizioPrenotazione+" - Data Fine: "+finePrenotazione
                +"\nTarga Mezzo Prenotato: "+ targa+"\nId Utente: "+idUtente+" ;";
    }
}