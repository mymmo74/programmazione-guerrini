
var ar_alunni = [];


function addNomi() {
    //let ris = "";
    let nome = "";

    // Fase input: prelevo il nome
    nome = document.getElementById("in_nome").value;


    // Fase elaborazione: inserisco il nome nell'array
    ar_alunni.push(nome);

    
    // Fase output: stampo il contenuto dell'array nel DIV
    //ris = createTABLE(ar_alunni);
    //document.getElementById("div_alunni").innerHTML = ris;
    
    // 
    let mytag=document.getElementById("div_alunni");
    createOLobj(ar_alunni,mytag);
}

