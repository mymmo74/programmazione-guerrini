/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

//prima parte definizione anagrafica con classi e sottoClassi

class Anagrafica {
    constructor(nome, code, telefono, sex) {
        this.nome = nome.toUpperCase();
        this.code = code * 1;
        this.telefono = telefono;
        let s = sex;
        s = s.substr(0, 1).toUpperCase();
        this.sex = s;
    }
    saluta() {
        let ris = "";
        let fraseSex = "";
        // salve sono ......., sono un uomo/donna e il mio telefono è.....
        if (this.sex === "M")
            fraseSex = "un uomo";
        else
            fraseSex = "una donna";
        ris = "Salve sono" + " " + this.nome + ", sono" + " " + fraseSex + " e il mio telefono è" + " " + this.telefono;

        return ris;
    }

}

class Giocatore extends Anagrafica {
    constructor(nome, code, telefono, sex, peso, ruolo) {
        super(nome, code, telefono, sex);
        this.peso = peso;
        this.ruolo = ruolo;
    }
    saluta() {
        let ris = "";
        let fraseSex = "";
        // salve sono ......., sono un uomo/donna e il mio telefono è.....
        if (this.sex === "M")
            fraseSex = "un giocatore uomo";
        else
            fraseSex = "un giocatore donna";
        ris = "Salve sono" + " " + this.nome + ", sono" + " " + fraseSex + " e il mio ruolo è" + " " + this.ruolo;

        return ris;
    }

}

class Arbitro extends Anagrafica {
    constructor(nome, code, telefono, sex, categoria) {
        super(nome, code, telefono, sex);
        this.categoria = categoria;
    }

//    ogni oggetto può implementare il metodo ereditato, modificandolo opportunatamente e lasciando lo stesso nome di metodo
    saluta() {
        let ris = "";
        let fraseSex = "";
        // salve sono ......., sono un uomo/donna e il mio telefono è.....
        if (this.sex === "M")
            fraseSex = "un arbitro uomo";
        else
            fraseSex = "un arbitro donna";
        ris = "Salve sono" + " " + this.nome + ", sono" + " " + fraseSex + " e la mia categoria è" + " " + this.categoria;

        return ris;
    }

}

class Team {
    constructor(nome, citta, colori, categoria) {
        this.nome = nome;
        this.citta = citta;
        this.logo = "";
        this.colori = colori;
        this.categoria = categoria;
        this.el_gioc = [];
    }

    elencoGiocBR() {
        let ris = "";
        for (let i = 0; i < this.el_gioc.length; i++) {

            ris += this.el_gioc[i].code + " - " + this.el_gioc[i].nome + " - " + this.el_gioc[i].ruolo + "<br/>";
        }
        return ris;
    }
    visTeam() {
        let ris = "";
        //Squadra milan ivrea di prima categoria 
        ris = "Squadra " + this.nome + " con sede a " + this.citta + " di " + this.categoria + "categoria";
        let el = this.elencoGiocBR();

        return ris + "<br/>" + el;
    }

    compraGiocatore(objGiocatore) {
        // all'elenco dei giocatori della squadra aggiungo il giocatore che mi hai passato
        this.el_gioc.push(objGiocatore);

    }

    vendiGiocatore(codice) {
        for (let i = 0; i < this.el_gioc.length; i++) {

            let cod = this.el_gioc(i).codice;
            if (codice === cod) //è quello da togliere
            {
                // togliere elemento da array
                this.el_gioc.splice(i, 1);
                break;
            }
        }

    }
}

class Campionato {
    constructor(stagione) {
        this.stagione = stagione;
        this.el_partite = [];
    }
    aggiungiPartita(objPartita) {
        this.el_partite.push(objPartita);
    }
    visPartite() {
        let ris = "";
        let elp = "";
        let i = 0;
        this.el_partite.forEach(
                function (myp) {
                    elp += "<option value='" + i + "'>" + myp.data + " - " + myp.sq1 + " vs " + myp.sq2 + " ris. "+ myp.pt1+ " - " + myp.pt2 + "</option>";
                    i++;
                }
        );
        ris = "<select size='10' id='s_partite'>" + elp + "</select>";
        return ris;
    }

}
class Lega {
    constructor(nome, descrizione) {
        this.nome = nome;
        this.descrizione = descrizione;
        this.el_squadre = [];
        this.el_arbitri = [];
        this.el_campionati = [];
    }

    aggiungiCampionato(objCampionato) {
        this.el_campionati.push(objCampionato);

    }
    aggiungiSquadra(objSquadra) {
        this.el_squadre.push(objSquadra);

    }

    aggiungiArbitro(objArbitro) {
        this.el_arbitri.push(objArbitro);
    }

    visLega() {
        let ris = "";
        /*lega IF
         * campionato a squadre...
         * milan
         * inter
         * juventus
         */

        ris += this.nome + "<br/>" + this.descrizione + "<br/>";
        let els = "";

        for (let i = 0; i < this.el_squadre.length; i++) {
            els += this.el_squadre[i].nome + "<br/>";

        }
        els = "";
        //  è un metodo che fa la stessa cosa delle righe 147-->152
        this.el_squadre.forEach(
                function (mysq) {
                    els += mysq.nome;
                }
        );

        // elenco arbitri
        let ela = "";
        this.el_arbitri.forEach(
                function (mysq) {
                    ela += mysq.nome;
                }
        );
        return ris + "<br/>" + els + "<br/>" + ela;

    }
}

class Partita {
    constructor(data, luogo, sq1, sq2, arbitro) {
        this.data = data;
        this.luogo = luogo;
        this.sq1 = sq1;
        this.sq2 = sq2;
        this.arbitro = arbitro;
        this.pt1="-";
        this.pt2="-";
        this.risultato = "da giocare";
    }
    dammiRisultato(){
        //esempio ha vinto Mastini 30 pt contro 12 di Sirbons
        let ris="";
        
        if (this.pt1>this.pt2)
            ris="Ha vinto "+ this.sq1 + " " +this.pt1+ "punti contro"+this.pt2+" di "+ this.sq2;
        else
            ris="Ha vinto "+ this.sq2 + " " +this.pt2+ "punti contro"+this.pt1+" di "+ this.sq1;
        return ris;
    }

}

//
//const donna = new Anagrafica("Rossana Massone", "0574", "3311222090", "F");
//alert(donna.saluta() + ", codice ref " + donna.code);
//
//var giocatore = new Giocatore("Cristian Fiorino", "0574", "34821455475", "M", 95, "linebacker");
//alert(giocatore.saluta());
//
//var arbr = new Arbitro("Mimmo Garrone", "0555", "3389412721", "M", "senior");
//alert(arbr.saluta());
//
//var sq = new Team("Mastini", "Ivrea", "grigio bianco", "seconda divisione");
//sq.compraGiocatore(giocatore);
//
//gioc = new Giocatore("Will Smith", "0575", "34821545475", "M", 115, "linebacker");
//sq.compraGiocatore(gioc);
//gioc = new Giocatore("Emmit Smith", "0576", "3482845475", "M", 125, "linebacker");
//sq.compraGiocatore(gioc);
//gioc = new Giocatore("Marcus Welby", "0577", "34871545475", "M", 135, "linebacker");
//sq.compraGiocatore(gioc);
//alert(sq.visTeam());
//
//const lega = new Lega("IFL", "campionato italiano di footbal americano con tre divisioni");
//lega.aggiungiSquadra(sq);
//lega.aggiungiArbitro(arbr);
//alert(lega.visLega());
//var camp = new Campionato("stagione 2019");
//
//var part;
//part = new Partita("2019-02-02", "Cagliari", "Sirbons", "Mastini", "0555");
//camp.aggiungiPartita(part);
//
//part = new Partita("2019-02-09", "Ivrea", "Mastini", "Sirbons", "0555");
//camp.aggiungiPartita(part);
//
//part = new Partita("2019-04-02", "Sondrio", "Pizzoccheri", "Mastini", "0555");
//camp.aggiungiPartita(part);
//
//part = new Partita("2019-04-09", "Ivrea", "Mastini", "Pizzoccheri", "0555");
//camp.aggiungiPartita(part);
//
//lega.aggiungiCampionato(camp);
//lega.el_campionati[0].aggiungiPartita(part);
//document.write(lega.el_campionati[0].visPartite());