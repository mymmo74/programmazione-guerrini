

var ar_numeri = [45,12,78,123];

// usare sleep(valore in millisecondi)
// provare a vedere https://www.w3schools.com/js/js_timing.asp
// https://www.html.it/articoli/temporizzazioni-in-javascript/
// https://stackoverflow.com/questions/1141302/is-there-a-sleep-function-in-javascript

function getOutput() {

    document.getElementById("div_sort").innerHTML = print_don();
    
}

// funzione per stampare le persone che hanno donato
function print_don() {
    // quando il metodo mi deve ritornare qualcosa per prima cosa inizializzo la variabile e in fondo
    // metto il "return nomevariabile;"
    let text = "";

    //let miosaldo = 0;

    //let maxver = 0;


    for (i = 0; i < ar_numeri.length; i++) {
        // In questo modo tutte le linee vengono generate con uno span con un id univoco, quindi possono essere gestiti anche singolarmenti
        text += "<span id'don" + i + "'>" + ar_numeri[i]+"</span><br/>";

    }


    return text;
}

// ordina
    function ordina(array) {
        let appoggio="";
        
        // algoritmo selection sort
        for (i = 0; i < array.length-1; i++) {
            for (j=i+1; j<array.length; j++){
                if (array[i]>array[j]){
                    appoggio=array[i];
                    array[i]=array[j];
                    array[j]=appoggio;
                    sleep(1000);
                    getOutput;
                }
            }
        }

    }
    
    function sleep(delay) {
        var start = new Date().getTime();
        while (new Date().getTime() < start + delay);
      }