function calcolaPotenza() {
    let num1 = document.getElementById("in_val1").value;
    let num2 = document.getElementById("in_val2").value;
    
    let ris=0;
    ris=potenza(num1,num2);
    
    document.getElementById("div_risultato").innerHTML="Il risultato di "+num1+" elevato a "+ num2+" è "+ris;
}

function calcolaSomma() {
    let num1 = document.getElementById("in_val1").value;
    let num2 = document.getElementById("in_val2").value;
    
    let ris=0;
    ris=somma(num1*1,num2*1);
    
    document.getElementById("div_risultato").innerHTML="Il risultato di "+num1+" sommato a "+ num2+" è "+ris;
}

