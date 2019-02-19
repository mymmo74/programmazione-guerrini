/* 
 * Pier Domenico Garrone
 * 31-01-2019
 */

//PARTE 1
var ar_risposte = [];
var ar_punti = [0, 0, 0, 0];
var ar_peso = [10, 10, 20, 30];
var ar_soluzioni = ["LORELLA", "MICHELLE", "RITA", "ETTORE"];

function inviaTest() {
    //fase input
    //carico risposte
    let ris1 = document.getElementById("inDom1").value;
    let ris2 = document.getElementById("inDom2").value;
    let ris3 = document.getElementById("inDom3").value;
    let ris4 = document.getElementById("inDom4").value;

    ar_risposte[0] = ris1.toUpperCase();
    ar_risposte[1] = ris2.toUpperCase();
    ar_risposte[2] = ris3.toUpperCase();
    ar_risposte[3] = ris4.toUpperCase();

    //reset punteggio
    resetPunti();

    //elaborazione
    for (i = 0; i < ar_risposte.length; i++) {
        //valuto risposta 1
        if (ar_risposte[i] === ar_soluzioni[i]) {
            ar_punti[i] = ar_peso[i];
        }
    }

    //fase output
    document.getElementById("spEsito").innerHTML = getEsito();

}

function getEsito() {
    let ris = "";
    let tot = 0;

    //calcolo il punteggio totale
    tot = getTot();

    //Ho fatto almeno 40 punti?
    if (tot >= 40) {
        // ho risposto correttamente ad almeno una di quiz televisivo
        // e una di quiz cultura?
        if ((ar_punti[0] + ar_punti[1] > 0) && (ar_punti[2] + ar_punti[3] > 0)) {
            ris = "PROMOSSO!";
        } else {
            ris = "BOCCIATO!";
        }

    } else {
        ris = "BOCCIATO!";
    }

    return ris;
}

function getTot() {
    let tot = 0;

    for (i = 0; i < ar_punti.length; i++) {
        tot += ar_punti[i];
    }
    return tot;
}

function resetPunti() {
    for (i = 0; i < ar_punti.length; i++) {
        ar_punti[i] = 0;
    }
}

//PARTE 2
var portamonete=0;

function putMoney(){
    //fase input
    let valore=document.getElementById("inValore").value*1;
    
    //elaborazione
    if (valore>0){
        if (isMoneta(valore)){
            portamonete+=valore;
        } else {
            alert("Non esiste la moneta da "+valore+" €");
        }
        
    } else {
        alert("Non hai inserito un valore");
    }
    
    //fase output
    document.getElementById("spTotale").innerHTML="Totale = "+portamonete+" €";
}

function getMoney(){
    //fase input
    let valore=document.getElementById("inValore").value*1;
    //elaborazione
    if (valore>0 && valore<=portamonete){
        if (isMoneta(valore)){
            portamonete-=valore;
        } else {
            alert("Non esiste la moneta da "+valore+" €");
        }
        
    } else {
        alert("Non puoi compiere questa operazione");
    }
    
    //fase output
    document.getElementById("spTotale").innerHTML="Totale = "+portamonete+" €";
}

function isMoneta(moneta){
    let ris=false;
    
    // è da 1 centesimo?
    if (moneta===0.01){
        ris=true;
    }
    // è da 2 centesimi?
    if (moneta===0.02){
        ris=true;
    }
    // è da 5 centesimi?
    if (moneta===0.05){
        ris=true;
    }
    // è da 10 centesimi?
    if (moneta===0.1){
        ris=true;
    }
    // è da 20 centesimi?
    if (moneta===0.2){
        ris=true;
    }
    // è da 50 centesimi?
    if (moneta===0.5){
        ris=true;
    }
    // è da 1 euro?
    if (moneta===1){
        ris=true;
    }
    // è da 2 euro?
    if (moneta===2){
        ris=true;
    }
    
    return ris;
}