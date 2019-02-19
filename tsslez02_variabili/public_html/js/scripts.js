/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
//variabili globali
var num1;
var num2;
var risultato;
//inizializziamo la variabile
var totale = 0;
var okDati;

function isVuota(testo) {

    // la IF, se vi è solo una istruzione nel ramo THEN e uno nel ramo ELSE, si può omettere le parentesi {}
    if (testo.length === 0)
        return true;
    else
        return false;

}

function checkDati() {
    //verifico num1 e num2
    //ritorno true se presenti solo numeri
    //altrimenti ritorno false

    if (isNaN(num1) || isNaN(num2) || isVuota(num1) || isVuota(num2)) {
        return false;
    } else {
        return true;
    }
}

function faseInput() {
    num1 = document.getElementById("in_num1").value;
    num2 = document.getElementById("in_num2").value;

    okDati = checkDati();


    //verifico okDati e poi vedo se trasformare in numeri

    if (okDati == true) {
        //in num1 e num2 c'è ancora in testo, devo trasformarlo in numero
        num1 = parseFloat(num1);
        num2 = parseFloat(num2);
    } else {
        alert("attenzione dati non corretti");
    }


}

function faseOutput() {
    document.getElementById("div_ris").innerHTML = risultato;
    document.getElementById("div_totale").innerHTML = totale;

}

function somma() {

    faseInput();

    if (okDati) {
        risultato = num1 + num2;
        totale = totale + risultato;

        faseOutput();
    }

}


function calcola(op) {
    faseInput();

    if (okDati) {
        if (op == "+")
            risultato = num1 + num2;
        if (op == "-")
            risultato = num1 - num2;
        if (op == "*")
            risultato = num1 * num2;
        if (op == "/")
            risultato = num1 / num2;

        totale = totale + risultato;

        faseOutput();
    }
}
