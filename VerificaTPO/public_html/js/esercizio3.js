/* 
 * Pier Domenico Garrone
 * 31-01-2019
 */

//PARTE 1
var pav;
function Pavimento(larghezza, lunghezza, nome, costoMQ) {
    this.larghezza = larghezza;
    this.lunghezza = lunghezza;
    this.nome = nome;
    this.costoMQ = costoMQ;
    this.prezzoFinale = function () {
        let prezzo = 0;

        prezzo = (this.larghezza * this.lunghezza) * this.costoMQ;

        return prezzo;
    };
    this.rigaPreventivo = function () {
        let ris = "";

        // Legno pino:
        // dimensioni 4 X 5 
        // Costo al mq 30 euro
        // Costo totale: 600 euro
        ris = this.nome + ":<br/>dimensioni " + this.larghezza + " x " + this.lunghezza;
        ris += "<br/>Costo al mq " + this.costoMQ + " euro<br/>";
        ris += "Costo totale: " + this.prezzoFinale() + " euro";
        return ris;
    };
}

function creaPavimento() {
    //fase input
    let larghezza = document.getElementById("inLarg").value * 1;
    let lunghezza = document.getElementById("inLung").value * 1;
    let nome = document.getElementById("inNome").value;
    let costoMQ = document.getElementById("inCosto").value * 1;

    //elaborazione
    pav = new Pavimento(larghezza, lunghezza, nome, costoMQ);

    //fase output
    let ris = pav.rigaPreventivo();
    document.getElementById("spPav").innerHTML = ris;

}

//PARTE 2
var cli;
function Cliente(nome) {
    this.nome = nome;
    this.el_preventivi = [];
    this.aggiungiPreventivo = function (objPavimento) {
        this.el_preventivi.push(objPavimento);
    };
    this.getTotalePreventivo = function () {
        let totale = 0;
        for (i = 0; i < this.el_preventivi.length; i++) {
            //Calcolare totale di tutti i preventivi presenti
            totale += this.el_preventivi[i].prezzoFinale();
        }
        return totale;
    };
    this.rigaPr = function () {
        let ris = "";

        for (i = 0; i < this.el_preventivi.length; i++) {
            // Legno pino - 4x5 - costo 600 euro
            ris += this.el_preventivi[i].nome + " - " + this.el_preventivi[i].larghezza + "x" + this.el_preventivi[i].lunghezza;
            ris += " - costo " + this.el_preventivi[i].prezzoFinale() + " euro <br/>";
        }

        return ris;
    };
}

function creaCliente() {
    //fase input
    let nome = document.getElementById("inCliente").value;
    cli = new Cliente(nome);
    
    //fase output
    document.getElementById("spPrev").innerHTML ="";

}

function addPrev() {
    //fase input
    cli.aggiungiPreventivo(pav);

    //calcolo totale
    let tot = 0;
    let righePrev = "";
    let visFinale = "";
    tot = cli.getTotalePreventivo();
    righePrev = cli.rigaPr();
    visFinale = "Preventivo: " + cli.nome + "<br/>";
    visFinale += "Totale: " + cli.getTotalePreventivo() + " euro <br/>";
    visFinale += "Preventivi:<br/>";
    visFinale += cli.rigaPr();

    document.getElementById("spPrev").innerHTML = visFinale;
}
