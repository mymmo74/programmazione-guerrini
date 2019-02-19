// Passaggio di parametri di un array e di un oggetto HTML (es div, spam, table, ...)
function createOLobj(myArray, myObjTag) {
    let tagLI = "";
    let ris = "";

    // Mi creo la parte interna del TAG di visualizzazioni, i tag LI
    for (i = 0; i < myArray.length; i++) {
        tagLI += "<li>" + myArray[i] + "</li>";
    }

    // Aggiungo i tag <ol> inizio e </ol> in chiusura
    ris = "<ol>" + tagLI + "</ol>";

    myObjTag.innerHTML=ris;
    
    //return ris;
}

function potenza(valore,esponente){
    // creo variabile di ritorno
    let ris=1;
    
    // ris= 2*2*2 caso 2 alla 3
    // ris= 3*3 casp 3 alla 2
    for (i=0; i<esponente; i++){
        ris=ris*valore;
    }
    
    // restituisco il valore di ritorno
    return ris;
}

function createBR(array) {
    let ris = "";

    // Mi creo la parte interna del TAG di visualizzazioni, i tag LI
    for (i = 0; i < array.length; i++) {
        ris += array[i] + "</li>";
    }

    return ris;
}

function createTABLE(array) {
    let tagCella = "";
    let ris = "";

    // Mi creo la parte interna del TAG di visualizzazioni, i tag LI
    for (i = 0; i < array.length; i++) {
        tagCella += "<tr><td>" + array[i] + "</tr></td>";
    }

    // Aggiungo i tag <ol> inizio e </ol> in chiusura
    ris = "<table border='1'>" + tagCella + "</table>";

    return ris;
}

function cubo(valore){
    let risultato=0;
    
    risultato=valore*valore*valore;
    
    return risultato;
    
}

function quadrato(valore){
    let risultato=0;
    
    risultato=valore*valore*valore;
  
    return risultato;
    
}

function createOL(array) {
    let tagLI = "";
    let ris = "";

    // Mi creo la parte interna del TAG di visualizzazioni, i tag LI
    for (i = 0; i < array.length; i++) {
        tagLI += "<li>" + array[i] + "</li>";
    }

    // Aggiungo i tag <ol> inizio e </ol> in chiusura
    ris = "<ol>" + tagLI + "</ol>";

    return ris;
}


function somma(num1,num2){
    let ris=0;
    
    ris=num1+num2;
    
    return ris;
}