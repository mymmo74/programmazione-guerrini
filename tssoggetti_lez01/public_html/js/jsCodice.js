/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
//assegno una funzione
var arrAlunni = [];

function aggAlunno() {
    let txNome = document.getElementById("in_nome").value;
    let txCognome = document.getElementById("in_cognome").value;
    let flVoto = document.getElementById("in_voto").value;


    let oggAlunno = {
        nome: txNome,
        cognome: txCognome,
        voto: (flVoto*1),
        promosso: function (minimo) {
          if (this.voto >= minimo) {
                return "Promosso";
            } else {
                return "Bocciato";

            }
        },
        visHtmlbr: function () { return "Alunno: " + this.nome + " " + this.cognome + " votazione: " + this.voto + " </br>";},
        visHtmltab: function () {return " <tr> <td style= 'border: dotted 1px'> " + this.nome + " </td>  <td style= 'border: dotted 1px'> " + this.cognome + " </td>  <td style= 'border: dotted 1px'> " + this.voto + " </td> ";},
        aumentaVoto: function (valore,massimo) {
            this.voto += valore;
            if (this.voto > massimo) {
                this.voto = massimo;
            }
        }

    };
    let tx = oggAlunno.constructor.propertyName;
                        
                     
    arrAlunni.push(oggAlunno);

    //arrAlunni.push({nome: txNome,cognome: txCognome,voto: flVoto});

    visArray(arrAlunni);
}

function visArray(arArray) {
    let txVisualizza = "<table style='border: dotted 1px'> ";
    for (var i = 0; i < arArray.length; i++) {
        var appOggetto = arArray[i];
        txVisualizza += appOggetto.visHtmltab();
    }
    txVisualizza += " </table>";
    document.getElementById("div_array").innerHTML = txVisualizza;

}

function addVoti() {
    
    if (arrAlunni.length > 0) {
        for (var i = 0; i < arrAlunni.length; i++) {
            arrAlunni[i].aumentaVoto(3*1,10*1);
        }
    }
    
    visArray(arrAlunni);
}