/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


// mi serve un array per i caricare le valutazioni
var ar_valutazioni = [];



// un metodo per aggiungere le valutazioni all'array
function addValutazione() {
    // recupero le informazioni
    let voto = document.getElementById("in_voto").value;

    // inserisco le informazioni nell'array
    ar_valutazioni.push(voto*1);

    document.getElementById("in_voto").value = "";

}

function getMedia() {

    let somma=0;
    
    for (i = 0; i < ar_valutazioni.length; i++) {
        // In questo modo tutte le linee vengono generate con uno span con un id univoco, quindi possono essere gestiti anche singolarmenti
        somma+= ar_valutazioni[i];

        
    }
    document.getElementById("div_media").innerHTML= somma/ar_valutazioni.length;
}