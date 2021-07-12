function eliminaProdotto(id){
    let xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            alert("Prodotto eliminato con successo!");
            location.reload();
        }
    };
    let url = "AdminServlet/eliminaProdotto?id="+id;
    xhttp.open("GET", url, true);
    xhttp.send();
}

function eliminaCategoria(categoria){
    let xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            alert("Categoria eliminata con successo!");
            location.reload();
        }
    };
    let url = "AdminServlet/eliminaCategoria?nomeCategoria="+categoria;
    xhttp.open("GET", url, true);
    xhttp.send();
}

function modificaProdotto(id){

}

function aggiungiCategoria(){

}

function aggiungiProdotto(){
    window.location.href = "aggiuntaProdotto.jsp";
}

table_prodotti = null;
function loadTableProdotti(jsonProdotti){
    if(table_prodotti != null) return;
    table_prodotti = $('#tabella_prodotti').DataTable({
        "dom": '<"toolbar">frtip',
        "scrollY": "70vh",
        "scrollCollapse": true,
        'language': {
            "decimal": "",
            "emptyTable": "Nessun prodotto presente",
            "info": " _TOTAL_ prodotti",
            "infoEmpty": "Mostrando da 0 a 0 di 0 prodotti",
            "infoFiltered": "(filtrato da _MAX_ prodotti totali)",
            "infoPostFix": "",
            "thousands": ",",
            "lengthMenu": "Mostra _MENU_ prodotti",
            "loadingRecords": "Caricando...",
            "processing": "Processando...",
            "search": "Cerca:",
            "zeroRecords": "Nessun prodotto trovato!",
            "paginate": {
                "first": "Prima",
                "last": "Ultima",
                "next": "Prossima",
                "previous": "Precedente"
            },
            "aria": {
                "sortAscending": ": attiva per ordinare le colonne in ordine crescente",
                "sortDescending": ": attiva per ordinare le colonne in ordine decrescente"
            }
        },
        "data": jsonProdotti.prodotti,
        "columns": [
            {"data": "id"},
            {"data": "marca"},
            {"data": "modello"},
            {"data": "categoria"},
            {"data": "prezzo"},
            {"data": "<button class=\"btn\"><i class=\"fa fa-trash-alt\"></i></button>"},
            {"data": "<button class=\"btn\"><i class=\"fas fa-pen\"></i></button>"}
        ],
        columnDefs: [
            {
                "targets": -2,
                "data": null,
                "defaultContent": '<button id="cancella" style="background-color: #900C3F; border: none; color: white; padding: 12px 16px; font-size: 16px; cursor: pointer;"><i id="elimina_icon" class="fas fa-trash-alt"></i></button>'
            },
            {
                "targets": -1,
                "data": null,
                "defaultContent": '<button id="modifica" style="background-color: #900C3F; border: none; color: white; padding: 12px 16px; font-size: 16px; cursor: pointer;"><i id="modifica_icon" class="fas fa-pen"></i></button>'
            }
        ]
    });
    $("#datagrid_visualizzaprodotti div.toolbar").html('<button onclick="aggiungiProdotto()" style="font-size: 15px; color: white; background-color: #900C3F; border: none; cursor: pointer"><i style="padding: 10px" class="fas fa-plus"></i></button>');



    $('#tabella_prodotti tbody').on('click', 'tr', function (e) {
        if(e.target.getAttribute("id")=="modifica"||e.target.getAttribute("id")=="modifica_icon"){
            if (e.target.nodeName == 'BUTTON' || e.target.nodeName == 'I') {
                let id_prodotto = table_prodotti.row( this ).data().id;
                modificaProdotto(id_prodotto);
            }
        }else{
            if(e.target.getAttribute("id")=="cancella"||e.target.getAttribute("id")=="elimina_icon"){
                if (e.target.nodeName == 'BUTTON' || e.target.nodeName == 'I') {
                    let id_prodotto = table_prodotti.row( this ).data().id;
                    eliminaProdotto(id_prodotto);
                }
            }
        }

    });
}

table_categorie = null;
function loadTableCategorie(jsonCategorie){

    jsonCategorie = jsonCategorie.categorie;
    jsonCategorie_provv = new Array();
    for(i=0; i<jsonCategorie.length; i++){
        jsonCategorie_provv.push(new Array(jsonCategorie[i]));
    }
    jsonCategorie = jsonCategorie_provv;
    if(table_categorie != null) return;
    table_categorie = $('#tabella_categorie').DataTable({
        "dom": '<"toolbar">frtip',
        "scrollY": "70vh",
        "scrollCollapse": true,
        'language': {
            "decimal": "",
            "emptyTable": "Nessuna categoria presente",
            "info": " _TOTAL_ prodotti",
            "infoEmpty": "Mostrando da 0 a 0 di 0 categorie",
            "infoFiltered": "(filtrato da _MAX_ categorie totali)",
            "infoPostFix": "",
            "thousands": ",",
            "lengthMenu": "Mostra _MENU_ categorie",
            "loadingRecords": "Caricando...",
            "processing": "Processando...",
            "search": "Cerca:",
            "zeroRecords": "Nessuna categoria trovato!",
            "paginate": {
                "first": "Prima",
                "last": "Ultima",
                "next": "Prossima",
                "previous": "Precedente"
            },
            "aria": {
                "sortAscending": ": attiva per ordinare le colonne in ordine crescente",
                "sortDescending": ": attiva per ordinare le colonne in ordine decrescente"
            }
        },
        "data": jsonCategorie,
        "columns": [
            {"title": "Nome"},
            {"data": "<button class=\"btn\"><i class=\"fa fa-trash-alt\"></i></button>"}
        ],
        columnDefs: [
            {
                "targets": -1,
                "data": null,
                "defaultContent": '<button id="cancella" style="background-color: #900C3F; border: none; color: white; padding: 12px 16px; font-size: 16px; cursor: pointer;"><i id="elimina_icon" class="fas fa-trash-alt"></i></button>'
            }
        ]
    });
    $("#tabella_categorie div.toolbar").html('<button onclick="aggiungiCategoria()" style="font-size: 15px; color: white; background-color: #900C3F; border: none; cursor: pointer"><i style="padding: 10px" class="fas fa-plus"></i></button>');

    $('#tabella_categorie tbody').on('click', 'tr', function (e) {
        if(e.target.getAttribute("id")=="cancella"||e.target.getAttribute("id")=="elimina_icon"){
            if (e.target.nodeName == 'BUTTON' || e.target.nodeName == 'I') {
                let categoria = table_categorie.row( this ).data();
                eliminaCategoria(categoria);
            }
        }
    });
}


function show(element){
    $("#datagrid_visualizzaprodotti").removeClass("show");
    $("#datagrid_visualizzacategorie").removeClass("show");
    //$("").removeClass("show");
    //$("").removeClass("show");
    if(element=="prodotti"){
        let xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
                loadTableProdotti(JSON.parse(this.response));
            }
        };
        let url = "AdminServlet/mostraProdotti";
        xhttp.open("GET", url, true);
        xhttp.send();
        $("#datagrid_visualizzaprodotti").addClass("show");
        return;
    }

    if(element=="categorie"){
        let xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
                loadTableCategorie(JSON.parse(this.response));
            }
        };
        let url = "AdminServlet/mostraCategorie";
        xhttp.open("GET", url, true);
        xhttp.send();
        $("#datagrid_visualizzacategorie").addClass("show");
        return;
    }
}