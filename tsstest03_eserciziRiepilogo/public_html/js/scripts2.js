
var txtUtente = "";

function loginUser() {
    // acquisisco nome e cognome
    let txtNome = document.getElementById("in_nome").value;
    let txtCognome = document.getElementById("in_cognome").value;

    txtUtente = txtNome + " " + txtCognome;

    // se i dati sono stati inseriti abilito do benvenuto ed abilito div esame
    if (txtUtente > " ") {
        document.getElementById("sp_utente").innerHTML = "Hello " + txtUtente;
        document.title = "Hello " + txtUtente;
        document.getElementById("esame").style.display = "block";
        document.getElementById("login").style.display = "none";
    }
}

function getValutazione() {
    // recupero input
    // acquisisco voto e il voto di riferimento
    let txtVoto = parseInt(document.getElementById("in_voto").value);
    let txtRif = parseInt(document.getElementById("in_riferimento").value);
    let risultato = "";

    // elaboro
    // verifico se esame è stato superato
    if (txtVoto >= txtRif) {
        // Scrivo il giudizio in nero
        risultato = txtUtente + " sei stato PROMOSSO";
        document.getElementById("sp_giudizio").style.color = "black";
    } else {
        // Scrivo il giudizio in rosso
        risultato = txtUtente + " sei stato BOCCIATO";
        document.getElementById("sp_giudizio").style.color = "red";
    }
    
    // ultima fase output
    document.getElementById("sp_giudizio").innerHTML = risultato;
}