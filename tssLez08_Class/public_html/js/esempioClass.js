
var lega;

function init() {
// creo la lega
    lega = new Lega("IFL", "campionato italiano di footbal americano con tre divisioni");

// creo arbitro
    let arbr = new Arbitro("Mimmo Garrone", "0555", "3389412721", "M", "senior");
    lega.aggiungiArbitro(arbr);

// creo squadre e giocatori
    var sq = new Team("Mastini", "Ivrea", "grigio bianco", "seconda divisione");
    var gioc = new Giocatore("Cristian Fiorino", "0574", "34821455475", "M", 95, "linebacker");
    sq.compraGiocatore(gioc);
    gioc = new Giocatore("Will Smith", "0575", "34821545475", "M", 115, "linebacker");
    sq.compraGiocatore(gioc);
    gioc = new Giocatore("Emmit Smith", "0576", "3482845475", "M", 125, "linebacker");
    sq.compraGiocatore(gioc);
    gioc = new Giocatore("Marcus Welby", "0577", "34871545475", "M", 135, "linebacker");
    sq.compraGiocatore(gioc);
    lega.aggiungiSquadra(sq);

// creo altra squadra e giocatori
    var sq = new Team("Sirbons", "Cagliari", "rossi bianco", "seconda divisione");
    var gioc = new Giocatore("Mario Piras", "0674", "34821455475", "M", 95, "linebacker");
    sq.compraGiocatore(gioc);
    gioc = new Giocatore("Giuseppe Piras", "0675", "34821545475", "M", 115, "linebacker");
    sq.compraGiocatore(gioc);
    gioc = new Giocatore("Falcone Falco", "0676", "3482845475", "M", 125, "linebacker");
    sq.compraGiocatore(gioc);
    gioc = new Giocatore("Giulio Giuliano", "0677", "34871545475", "M", 135, "linebacker");
    sq.compraGiocatore(gioc);
    lega.aggiungiSquadra(sq);

// creo altra squadra e giocatori
    var sq = new Team("Lanceri", "Novara", "azzurro", "seconda divisione");
    var gioc = new Giocatore("Bogia Nen", "0774", "34821455475", "M", 95, "linebacker");
    sq.compraGiocatore(gioc);
    gioc = new Giocatore("Giobia nBot", "0775", "34821545475", "M", 115, "linebacker");
    sq.compraGiocatore(gioc);
    gioc = new Giocatore("Cuclu Culci", "0776", "3482845475", "M", 125, "linebacker");
    sq.compraGiocatore(gioc);
    gioc = new Giocatore("Filippo Pavesino", "0777", "34871545475", "M", 135, "linebacker");
    sq.compraGiocatore(gioc);
    lega.aggiungiSquadra(sq);

// creo campionato e partite
    var camp = new Campionato("stagione 2019");
    var part;
    part = new Partita("2019-02-02", "Cagliari", "Sirbons", "Mastini", "0555");
    camp.aggiungiPartita(part);

    part = new Partita("2019-02-09", "Ivrea", "Mastini", "Sirbons", "0555");
    camp.aggiungiPartita(part);

    part = new Partita("2019-03-02", "Novara", "Lanceri", "Mastini", "0555");
    camp.aggiungiPartita(part);

    part = new Partita("2019-03-09", "Ivrea", "Mastini", "Sirbons", "0555");
    camp.aggiungiPartita(part);

    part = new Partita("2019-04-02", "Cagliari", "Sirbons", "Lanceri", "0555");
    camp.aggiungiPartita(part);

    part = new Partita("2019-04-09", "Novara", "Lanceri", "Sirbons", "0555");
    camp.aggiungiPartita(part);
    lega.aggiungiCampionato(camp);

    document.getElementById("d_ris").innerHTML = lega.el_campionati[0].visPartite();

}

function selPartita(){
    let ris=0;
    
    
    return ris;
}

function addRisultato(){
    let pt1=document.getElementById("inpt1").value*1;
    let pt2=document.getElementById("inpt2").value*1;
    let indexP=document.getElementById("s_partite").value;
    
    //nella variabile camp vi è il campionato 0
    let camp=lega.el_campionati[0];
    
    let part=camp.el_partite[indexP];
    part.pt1=pt1;
    part.pt2=pt2;
    document.getElementById("d_ris").innerHTML = lega.el_campionati[0].visPartite();
}






/*
 const donna = new Anagrafica("Rossana Massone", "0574", "3311222090", "F");
 alert(donna.saluta() + ", codice ref " + donna.code);
 
 alert(giocatore.saluta());
 
 alert(arbr.saluta());
 
 alert(sq.visTeam());
 
 alert(lega.visLega());
 
 lega.el_campionati[0].aggiungiPartita(part);
 document.write(lega.el_campionati[0].visPartite());
 */