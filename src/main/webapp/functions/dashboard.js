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

function modificaProdotto(id){

}

function loadTable(jsonProdotti){
    table = $('#tabella_prodotti').DataTable({
        "dom": '<"toolbar">frtip',
        "scrollY": "70vh",
        "scrollCollapse": true,
        'language': {
            "decimal": "",
            "emptyTable": "Nessun prodotto presente",
            "info": "Mostrando da _START_ a _END_ di _TOTAL_ prodotti",
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
                "defaultContent": '<button id="cancella" style="background-color: DodgerBlue; border: none; color: white; padding: 12px 16px; font-size: 16px; cursor: pointer;"><i id="elimina_icon" class="fas fa-trash-alt"></i></button>'
            },
            {
                "targets": -1,
                "data": null,
                "defaultContent": '<button id="modifica" style="background-color: DodgerBlue; border: none; color: white; padding: 12px 16px; font-size: 16px; cursor: pointer;"><i id="modifica_icon" class="fas fa-pen"></i></button>'
            }
        ]
    });
    $("#datagrid_visualizzaprodotti div.toolbar").html('<button onclick="aggiungiProdotto()" style="font-size: 15px; color: white; background-color: #0d6efd; border: none; cursor: pointer"><i style="padding: 10px" class="fas fa-plus"></i></button>');



    $('#tabella_prodotti tbody').on('click', 'tr', function (e) {
        if(e.target.getAttribute("id")=="modifica"||e.target.getAttribute("id")=="modifica_icon"){
            if (e.target.nodeName == 'BUTTON' || e.target.nodeName == 'I') {
                let id_prodotto = table.row( this ).data().id;
            }
        }else{
            if(e.target.getAttribute("id")=="cancella"||e.target.getAttribute("id")=="elimina_icon"){
                if (e.target.nodeName == 'BUTTON' || e.target.nodeName == 'I') {
                    let id_prodotto = table.row( this ).data().id;
                }
            }
        }

    });
}

$( document ).ready(function() {
    let xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            loadTable(JSON.parse(this.response));
        }
    };
    let url = "AdminServlet/mostraProdotti";
    xhttp.open("GET", url, true);
    xhttp.send();
});