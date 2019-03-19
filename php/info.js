/***
 * 
 * @param {type} oggJson
 * @param {type} listaCampi
 * @param {type} idTabella
 * @param {type} classeTabella
 * @param {type} contenitore
 * @returns {undefined}
 */

function creaTabellaDaJson(oggJson, listaCampi, idTabella, classeTabella, contenitore="body") {
    let tabella = document.createElement("table");
    tabella.id = idTabella;
    tabella.className = classeTabella;

    let vCampi=listaCampi.split(",");
    //    riga intestazione
    let thead= document.createElement("thead");
    let riga= document.createElement("tr");
    vCampi.forEach(function (campo, i) {
        let th=document.createElement("th");
        th.innerHTML= campo;
        riga.append(th);
    });
    
    tabella.append(thead);
    thead.append(riga);
    
    let tBody=document.createElement("tbody");
    oggJson.forEach(function (record,i){
        let rigaRecord=document.createElement("tr");
        vCampi.forEach(function (campo, j) {
            let cella= document.createElement("td");
            cella.innerHTML=oggJson[i][campo];
            rigaRecord.appendChild(cella);
            
        });
        tBody.append(rigaRecord);
    })
    
    tabella.append(tBody);
    //    append della tabella al conteni
    //    tore
    document.querySelector(contenitore).append(tabella);
    
}


creaTabellaDaJson(j,"cognome,email,nome","tabAnagrafica", "tabella");



function carica(){
    let x= new XMLHttpRequest();
    
    x.onloadstart=function(e){
        
    };
    
    x.onprogress=function(e){
        
    };
    
    x.onabort=function(e){
        
    };
    
    x.onerror=function(e){
        
    };
    
    x.onload = function (e){
        console.log("load", e.loaded, e.total);
        console.log("dati", x.responseText);
        // parse--> riceve stringa e se corretto e lo fa diventare oggetto JSON
        let oggJson=JSON.parse(x.responseText);
        creaTabellaDaJson(oggJson,"nome, cognome, email", "tabAnagrafica","tabella");
        
    };
    
    x.ontimeout=function(e){
        
    };
    
    x.onloadend=function(e){
        
    };
    
    x.onreadystatechange=function(e){
        
    };
    
    
    x.open("GET","dati.json",true);
    x.send();
}