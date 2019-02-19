
var txtUtente = "";

function loginUser() {
    let txtNome = document.getElementById("in_nome").value;
    let txtCognome = document.getElementById("in_cognome").value;

    txtUtente = txtNome + " " + txtCognome;
    
    document.getElementById("sp_utente").innerHTML = "Hello " + txtUtente;
    document.title = "Hello " + txtUtente;
}

