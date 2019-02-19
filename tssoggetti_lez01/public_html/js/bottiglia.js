/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
var bot;

function Bottiglia(marca, capacita, qta_corrente) {
    this.marca = marca;
    this.capacita = capacita;
    this.qta_corrente = qta_corrente;
    this.colore = "azure";
    this.bevo = function (quanto) {
        let ris = 0;
        //decremento la quantità bevuta
        //se qta maggiore di quanto ok....
        if (this.qta_corrente - quanto >= 0) {
            this.qta_corrente = this.qta_corrente - quanto;
            ris = quanto;
        } else {
            ris = 0;
        }

        return ris;
    };
    this.riempio = function (quanto){
        let ris=0;
        
        if (this.qta_corrente +quanto*1<=this.capacita){
            this.qta_corrente= this.qta_corrente+quanto*1;
            ris=quanto;
        } else {
            // lo riempirò fino all'orlo salvo in ris quanto ne riempirò
            ris= this.capacita-this.qta_corrente;
            // e poi lo cambio con il massimo
            this.qta_corrente=this.capacita;
        }
        return ris;
    };
    this.stato = function () {
        let ris = "";

        // sono una bottiglia SANTANNA di capacita' 100 e me ne rimangono 60
        ris = "sono una bottiglia " + this.marca + " di capacita' " + this.capacita + " e me ne rimangono " + this.qta_corrente;
        return ris;
    };
}

function disBottiglia(){
    // mi serve la qta corrente
    let qta = bot.qta_corrente;
    let heightMax=document.getElementById("div_box").clientHeight;
    let cap=bot.capacita;
    let newHeight=heightMax*qta/cap;
    
    document.getElementById("div_bot").style.height=newHeight+"px";
}

function creaBottiglia() {
    //Prendo i valori    
    let marca = document.getElementById("in_marca").value;
    let cap = document.getElementById("in_capacita").value;

    bot = new Bottiglia(marca, cap,cap);

    let prn = bot.stato();
    document.getElementById("div_ris").innerHTML = prn;
    disBottiglia();
}

function bevoBottiglia(){
    let qty=document.getElementById("in_bevo").value*1;
    
    bot.bevo(qty);
    let prn=bot.stato();
    document.getElementById("div_ris").innerHTML = prn;
    disBottiglia();
}

function riempioBottiglia(){
    let qty=document.getElementById("in_riempi").value*1;
    
    let ris=bot.riempio(qty);
    let prn= "Sono riuscito a riempire " + ris;
    prn+="<br/>"+bot.stato();
    document.getElementById("div_ris").innerHTML = prn;
    disBottiglia();
}


function setValore() {


    document.getElementById("sp_rangeRiempi").innerHTML = document.getElementById("in_riempi").value;

    document.getElementById("sp_rangeBevi").innerHTML = document.getElementById("in_bevo").value;
}



//dvs=document.getElementById("div_stato");
//var bot=new Bottiglia("santanna",100,100);
//var prn= bot.stato();
//prn= bot.bevo(60);
// prn=bot.stato();
//dvs.innerHTML = prn;
//bot.bevo(60);
// prn=prn + "<br/>"+bot.stato();
//bot.bevo(30);
// prn=prn + "<br/>"+bot.stato();
//dvs.innerHTML = prn;