//declaration de la map et des fonds de map
const map = L.map('mapid', {center: [47.471427, -0.551610], zoom: 14});
let baselayers = {
    Street: L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png'),
    Plan: L.tileLayer('https://{s}.tile.opentopomap.org/{z}/{x}/{y}.png')
    };

function loadMap(){
    
// Initialisation de la carte
   

    L.control.scale().addTo(map);

// Définition des fonds de carte
    
// Ajout du fond de carte par défaut
    baselayers.Street.addTo(map);
}

function loadLayer(){
    var overlayMaps = {
        "Tram Roseraie<->Ardenne": TramARD,
        "Tram Ardenne<->Roseraie": TramROS,
        "Bus" : Bus,
        "Arrêt Bus" : ArretsBus
    };
    
    L.control.layers(baselayers, overlayMaps).addTo(map);
}

function loadArretTramROS(){
    const xmlhr = new XMLHttpRequest();
    xmlhr.open("GET", "https://data.angers.fr/api/records/1.0/search/?dataset=bus-tram-topologie-dessertes&q=&rows=26&facet=codeparcours&facet=mnemoligne&facet=nomligne&facet=dest&facet=mnemoarret&facet=nomarret&facet=numarret&refine.mnemoligne=A&refine.codeparcours=ARD+Voie+2+-%3E+ARO+Voie+2+par+HDV&exclude.nomarret=RELEVE+CTT+voie+1", true);
    xmlhr.onreadystatechange = function () {
        if (xmlhr.readyState == 4) {
            if (xmlhr.status == 200) {
                try {
                    let responseText = xmlhr.responseText;
                    arretTramROSJSON = JSON.parse(responseText);
                    //incrementation des arret de tram dans une variable de type Map
                    for(var i=0; i<arretTramROSJSON.records.length; i++){
                        id = arretTramROSJSON.records[i].fields.nomarret;
                        arretTramROSMap[id] = arretTramROSJSON.records[i];
                    }

                    for (let id in arretTramROSMap){
                        
                        const record = arretTramROSMap[id];

                        let latitude = record.fields.coordonnees[0];
                        let longitude = record.fields.coordonnees[1];
                        let ligne = record.fields.mnemoligne;
                        let arret = record.fields.nomarret;
                        let dest = record.fields.dest; 
                        //ajout du marqueur
                        L.marker([latitude, longitude], {icon: iconTramStation}).bindPopup("<p><b>"+arret+"</b><div>Ligne : "+ligne +"</div></br><div>Destination : "+dest+"</div></p>").addTo(map);
                    }

                } catch (e) {
                    alert('Error chargement des données');
                    console.log(e);
                }
            } else {
                alert('Error chargement des données');
                console.log(xmlhr.statusText);
            }
        }
    }  
    xmlhr.send();
}

function loadArretTramARD(){
    const xmlhr = new XMLHttpRequest();
    xmlhr.open("GET", "https://data.angers.fr/api/records/1.0/search/?dataset=bus-tram-topologie-dessertes&q=&rows=26&facet=codeparcours&facet=mnemoligne&facet=nomligne&facet=dest&facet=mnemoarret&facet=nomarret&facet=numarret&refine.mnemoligne=A&refine.codeparcours=ARO+Voie+1+-%3E+ARD+Voie+1+par+HDV&exclude.nomarret=RELEVE+CTT+Voie+2", true);
    xmlhr.onreadystatechange = function () {
        if (xmlhr.readyState == 4) {
            if (xmlhr.status == 200) {
                try {
                    let responseText = xmlhr.responseText;
                    arretTramARDJSON = JSON.parse(responseText);
                    //incrementation des arret de tram dans une variable de type Map
                    for(var i=0; i<arretTramARDJSON.records.length; i++){
                        id = arretTramARDJSON.records[i].fields.nomarret;
                        arretTramARDMap[id] = arretTramARDJSON.records[i];
                    }

                    for (let id in arretTramARDMap){
                        
                        const record = arretTramARDMap[id];

                        let latitude = record.fields.coordonnees[0];
                        let longitude = record.fields.coordonnees[1];
                        let ligne = record.fields.mnemoligne;
                        let arret = record.fields.nomarret;
                        let dest = record.fields.dest; 
                        //ajout du marqueur
                        L.marker([latitude, longitude], {icon: iconTramStation}).bindPopup("<p><b>"+arret+"</b><div>Ligne : "+ligne +"</div></br><div>Destination : "+dest+"</div></p>").addTo(map);
                    }

                } catch (e) {
                    alert('Error chargement des données');
                    console.log(e);
                }
            } else {
                alert('Error chargement des données');
                console.log(xmlhr.statusText);
            }
        }
    }  
    xmlhr.send();
}

function loadTram(){
    const xmlhr = new XMLHttpRequest();
    xmlhr.open("GET", "https://data.angers.fr/api/records/1.0/search/?dataset=bus-tram-position-tr&q=&rows=20&facet=novh&facet=mnemoligne&facet=nomligne&facet=dest&refine.mnemoligne=A", true);
    xmlhr.onreadystatechange = function () {
        if (xmlhr.readyState == 4) {
            if (xmlhr.status == 200) {
                try {
                    let responseText = xmlhr.responseText;
                    tramJSON = JSON.parse(responseText);
                    //incrementation des trams dans une variable Map
                    for(var i=0; i<tramJSON.records.length; i++){
                        id = tramJSON.records[i].fields.sv;
                        tramMap[id] = tramJSON.records[i];
                    }
                    //on supprime les anciens marqueur dans les Layers
                    TramARD.clearLayers();
                    TramROS.clearLayers();

                    for (let id in tramMap) {
                        // Récupération de la feature
                            const record = tramMap[id];
                        // Ajout du marqueur avec la popup
                            
                            let latitude = record.fields.coordonnees[0];
                            let longitude = record.fields.coordonnees[1];
                            let ligne = record.fields.mnemoligne;
                            let arret = record.fields.nomarret;
                            let dest = record.fields.dest;
                            let harret = record.fields.harret;
                            let retard = Math.trunc(record.fields.ecart / 60);
                            let note = 0;

                            //ajout des marqueurs dans les Layers en fonction de leur destination pour les differencier
                            if (dest == "ANGERS ROSERAIE") {
                                markerTramROS = L.marker([latitude, longitude], { icon: iconTramROS }).bindPopup("<p><b>Ligne : " + ligne + "</b></br><div>Destination : " + dest + "</div><div>Prochain arret :" + arret + "</div><div>Arriv�e prochain arret :" + harret + "</div><div>Retard : " + retard + " min</div>").addTo(TramROS);
                            } else if (dest == "AVRILLE ARDENNE") {
                                markerTramARD = L.marker([latitude, longitude], { icon: iconTramARD }).bindPopup("<p><b>Ligne : " + ligne + "</b></br><div>Destination : " + dest + "</div><div>Prochain arret :" + arret + "</div><div>Arriv�e prochain arret :" + harret + "</div><div>Retard : " + retard + " min</div>").addTo(TramARD);
                            }

                    }
                    

                } catch (e) {
                    alert('Error chargement des données');
                    console.log(e);
                }
            } else {
                alert('Error chargement des données');
                console.log(xmlhr.statusText);
            }
        }
    }  
    xmlhr.send();
   
}

function loadArretBus(){
    const xmlhr = new XMLHttpRequest();
    xmlhr.open("GET", "https://data.angers.fr/api/records/1.0/search/?dataset=bus-tram-topologie-dessertes&q=&rows=9999&facet=codeparcours&facet=mnemoligne&facet=nomligne&facet=dest&facet=mnemoarret&facet=nomarret&facet=numarret&exclude.mnemoligne=A", true);
    xmlhr.onreadystatechange = function () {
        if (xmlhr.readyState == 4) {
            if (xmlhr.status == 200) {
                try {
                    let responseText = xmlhr.responseText;
                    arretBusJSON = JSON.parse(responseText);
                    for(var i=0; i<arretBusJSON.records.length; i++){
                        id = i;
                        arretBusMap[id] = arretBusJSON.records[i];
                    }

                    for (let id in arretBusMap){
                        
                        const record = arretBusMap[id];

                        let latitude = record.fields.coordonnees[0];
                        let longitude = record.fields.coordonnees[1];
                        let ligne = record.fields.mnemoligne;
                        let arret = record.fields.nomarret;
                        let dest = record.fields.dest; 

                        let arretBus = L.marker([latitude, longitude], {icon: iconBusStation}).bindPopup("<p><b>"+arret+"</b><div>Ligne : "+ligne +"</div></br><div>Destination : "+dest+"</div></p>");
                        
                        ArretsBus.addLayer(arretBus);
                    }

                } catch (e) {
                    alert('Error chargement des données');
                    console.log(e);
                }
            } else {
                alert('Error chargement des données');
                console.log(xmlhr.statusText);
            }
        }
    }  
    xmlhr.send();
}

function loadBus(){
    const xmlhr = new XMLHttpRequest();
    xmlhr.open("GET", "https://data.angers.fr/api/records/1.0/search/?dataset=bus-tram-position-tr&q=&rows=500&facet=novh&facet=mnemoligne&facet=nomligne&facet=dest&exclude.mnemoligne=A", true);
    xmlhr.onreadystatechange = function () {
        if (xmlhr.readyState == 4) {
            if (xmlhr.status == 200) {
                try {
                    let responseText = xmlhr.responseText;
                    BusJSON = JSON.parse(responseText);
                    for(var i=0; i<BusJSON.records.length; i++){
                        id = BusJSON.records[i].fields.sv;
                        busMap[id] = BusJSON.records[i];
                    }
                    
                    Bus.clearLayers();

                    for (let id in busMap) {
                        // Récupération de la feature
                            const record = busMap[id];
                        // Ajout du marqueur avec la popup
                            let latitude = record.fields.coordonnees[0];
                            let longitude = record.fields.coordonnees[1];
                            let ligne = record.fields.mnemoligne;
                            let arret = record.fields.nomarret;
                            let dest = record.fields.dest;
                            let harret = record.fields.harret;
                            let retard = Math.trunc(record.fields.ecart/60);
                            L.marker([latitude, longitude], {icon: iconBus})
                            .bindTooltip(ligne, 
                                {
                                    permanent: true, 
                                    direction: 'center',
                                    className: "my-labels"
                                }
                            )//ajout d'un label au marqueur pour voir le numero de la ligne
                            .bindPopup("<p><b>Ligne : "+ligne +"</b></br><div>Destination : "+dest+"</div><div>Prochain arret :"+arret+"</div><div>Arrivée prochain arret :"+harret+"</div><div>Retard : "+retard+" min</div>").addTo(Bus);

                    }
                    

                } catch (e) {
                    alert('Error chargement des données');
                    console.log(e);
                }
            } else {
                alert('Error chargement des données');
                console.log(xmlhr.statusText);
            }
        }
    }  
    xmlhr.send();
}



//definition d'un layer de type cluster pour les arret bus

var ArretsBus = L.markerClusterGroup();

let tramJSON;
let BusJSON;
let arretJSON;
loadMap();//on charge la map
//on declare les varibles Map dont on a besoin dans les fonctions
let tramMap = new Map();
let busMap = new Map();
let arretTramROSMap = new Map();
let arretTramARDMap = new Map();
let arretBusMap = new Map();

let iconTramStation = L.icon({
    iconUrl: 'img/TramStation.png',
    iconSize: [20, 20]
});
let iconBusStation = L.icon({
    iconUrl: 'img/arret_bus.png',
    iconSize: [20, 20]
});


loadArretTramROS();
loadArretTramARD();
loadArretBus();


map.addLayer(ArretsBus);

let iconTramARD = L.icon({
    iconUrl: 'img/tramARD.png',
    iconSize: [30, 30]
});
let iconTramROS = L.icon({
    iconUrl: 'img/tramROS.png',
    iconSize: [30, 30]
});
let iconBus = L.icon({
    iconUrl: 'img/bus.png',
    iconSize: [30, 30]
})

//on declare les 2 layers dont on a besoin dans la fonction loadTram()
var TramROS = L.layerGroup([]);
var TramARD = L.layerGroup([]);
var Bus = L.layerGroup([]);
loadTram();
loadBus();
TramROS.addTo(map);
TramARD.addTo(map);
Bus.addTo(map);
loadLayer();


//on rappelle la fonction pour charger les tram toutes les 25 secondes en ayant supprimer les layers avant puis en les rajoutant apres
setInterval(function () {
    map.removeLayer(TramROS);
    map.removeLayer(TramARD);
    map.removeLayer(Bus);
    loadTram();
    loadBus();
    TramROS.addTo(map);
    TramARD.addTo(map);
    Bus.addTo(map);
}, 25000);

var onClick = 0;
var change = document.getElementById('mapid');
 function changeView(){ //bandeau de notation, commentaires et alerte a droite
	onClick ++;
	if (onClick%2 == 1){
		change.style.cssText = 'width:100%';
	}else{
		change.style.cssText = 'width:85%';
	}
} 
	