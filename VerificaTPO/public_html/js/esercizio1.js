/* 
 * Pier Domenico Garrone
 * 31-01-2019
 */


//PARTE 1
function insSaluto() {
    //fase input
    let nome = document.getElementById("inNome").value;
    let saluto = "";
    let data = new Date();
    let giorno = data.getDate();
    //la funzione restituisce il numero mese compreso tra 0 e 11
    let mese = data.getMonth() + 1;
    let anno = data.getFullYear();

    // elaborazione
    // Oggi e’ il 31/01/2019 ciao Luca guerrini buona giornata 
    saluto = "Oggi e’ il " + giorno + "/" + mese + "/" + anno + " ciao " + nome + " buona giornata";

    //fase output
    document.getElementById("spMessaggio").innerHTML = saluto;
}

//PARTE 2
function spostaNome() {
    //fase input
    let nome1 = document.getElementById("inNome1").value;
    let nome2 = document.getElementById("inNome2").value;
    let nome3 = document.getElementById("inNome3").value;

    //elaborazione
    document.getElementById("inNome1").value = nome3;
    document.getElementById("inNome2").value = nome1;
    document.getElementById("inNome3").value = nome2;

}

//PARTE 3
var ar_articoli = [];
var ar_costi = [];
function insArticolo() {
    //fase input
    let articolo = "";
    let costo = "";

    //elaborazione
    articolo = document.getElementById("inArticolo").value;
    costo = document.getElementById("inCosto").value * 1;
    //verifico siano inseriti dei valori
    if (articolo !== "" && costo > 0) {
        //inserisco negli array
        ar_articoli.push(articolo);
        ar_costi.push(costo);

        //fase output
        prepOutput();
    } else {
        alert("Non hai inserito tutti i dati!");
    }

}

function prepOutput() {
    let testo = "";

    for (i = 0; i < ar_articoli.length; i++) {
        testo += ar_articoli[i] + " - " + ar_costi[i] + "<br/>";
    }

    //stampo gli articoli finora comprati
    document.getElementById("spCarrello").innerHTML = testo;
    //richiamo funzione per totale e poi lo stampo
    document.getElementById("spTotale").innerHTML = getTot();
    //richiamo funzione per media e poi lo stampo
    document.getElementById("spMedia").innerHTML = getMedia();
    //richiamo funzione per min e poi lo stampo
    document.getElementById("spMin").innerHTML = getMin();
    //richiamo funzione per max e poi lo stampo
    document.getElementById("spMax").innerHTML = getMax();
}

function getTot() {
    let tot = 0;

    for (i = 0; i < ar_costi.length; i++) {
        tot += ar_costi[i];
    }
    
    
    return tot;
}

function getMedia() {
    let media = 0;
    let tot = 0;

    for (i = 0; i < ar_costi.length; i++) {
        tot += ar_costi[i];
    }
    media = tot / ar_costi.length;
    return media;
}

function getMin() {
    let min = 0;

    //parto con il primo valore come min
    min = ar_costi[0];
    for (i = 1; i < ar_costi.length; i++) {
        if (ar_costi[i] < min) {
            min = ar_costi[i];
        }
    }
    return min;
}

function getMax() {
    let max = 0;

    //parto con il primo valore come max
    max = ar_costi[0];
    for (i = 1; i < ar_costi.length; i++) {
        if (ar_costi[i] > max) {
            max = ar_costi[i];
        }
    }

    return max;
}