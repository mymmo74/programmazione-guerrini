/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
//variabili globali
var num1 = 0;
var num2 = 0;
var risultato;
//inizializziamo la variabile
var operazione = "";
var visore = "";
var okDati;
var operatore = "";

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
    tasto = document.getElementById("in_num1").value;
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
    document.getElementById("div_visore").innerHTML = visore;
    document.getElementById("div_ris").innerHTML = operazione;
    //document.getElementById("div_totale").innerHTML = totale;

}

function scriviNumeri(op) {

    if (op === "0") {
        visore = visore + op;
    }
    if (op === "1") {
        visore = visore + op;
    }
    if (op === "2") {
        visore = visore + op;
    }
    if (op === "3") {
        visore = visore + op;
    }
    if (op === "4") {
        visore = visore + op;
    }
    if (op === "5") {
        visore = visore + op;
    }
    if (op === "6") {
        visore = visore + op;
    }
    if (op === "7") {
        visore = visore + op;
    }
    if (op === "8") {
        visore = visore + op;
    }
    if (op === "9") {
        visore = visore + op;
    }
    //valuto se è il punto decimale
    if (op === ".") {
        visore = visore + op;
    }
    faseOutput();
}
function calcola(op) {
    //faseInput();

    okDati = isVuota(document.getElementById("div_visore").innerHTML);
    if (!okDati) {

        if (op === "+") {
            visore = parseFloat(document.getElementById("div_visore").innerHTML);
            operazione = operazione + visore + " +<br/>";
            num1 = visore;
            if (num2 === 0) {
                num2 = num1;
                num1 = 0;
            } else {
                num2 = num2 + num1;
                num1 = 0;
            }
            visore = "";
            operatore = "+";
        }

        if (op === "-") {
            visore = parseFloat(document.getElementById("div_visore").innerHTML);
            operazione = operazione + visore + " -<br/>";
            num1 = visore;
            if (num2 === 0) {
                num2 = num1;
                num1 = 0;
            } else {
                num2 = num2 - num1;
                num1 = 0;
            }
            visore = "";
            operatore = "-";
        }

        if (op === "*") {
            visore = parseFloat(document.getElementById("div_visore").innerHTML);
            operazione = operazione + visore + " *<br/>";
            num1 = visore;
            if (num2 === 0) {
                num2 = num1;
                num1 = 0;
            } else {
                num2 = num2 * num1;
                num1 = 0;
            }
            visore = "";
            operatore = "*";
        }

        if (op === "/") {
            visore = parseFloat(document.getElementById("div_visore").innerHTML);
            operazione = operazione + visore + " /<br/>";
            num1 = visore;
            if (num2 === 0) {
                num2 = num1;
                num1 = 0;
            } else {
                num2 = num2 / num1;
                num1 = 0;
            }
            visore = "";
            operatore = "/";
        }

        if (op === "=") {
            num1 = parseFloat(document.getElementById("div_visore").innerHTML);
            switch (operatore) {
                case "+":
                    visore = num1 + num2;
                    break;
                case "-":
                    visore = num2 - num1;
                    break;
                case "*":
                    visore = num2 * num1;
                    break;
                case "/":
                    visore = num2 / num1;
                    break;
            }

            operazione = operazione + num1 + " =<br/>" + visore + "<br/>";
            num2 = 0, num1 = 0;
            //visore = "";
        }

    }
    if (op === "C") {
        visore = "";
        operatore = "";
        operazione = "";
        num1 = 0, num2 = 0;
    }
    faseOutput();
}
