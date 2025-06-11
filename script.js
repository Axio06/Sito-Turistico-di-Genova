
// (nessun codice necessario per il menu)

function loadPercorso(nome) {
    fetch('get_itinerario.php?nome=' + encodeURIComponent(nome))
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                document.getElementById('contenuto-percorso').innerHTML =
                    '<h2>' + data.nome + '</h2>' +
                    '<p><strong>Durata:</strong> ' + data.durata + ' ore</p>' +
                    '<p><strong>Difficoltà:</strong> ' + data.difficolta + '</p>' +
                    '<p>' + data.descrizione + '</p>';
            } else {
                document.getElementById('contenuto-percorso').innerHTML =
                    '<p>Itinerario non trovato.</p>';
            }
        })
        .catch(() => {
            document.getElementById('contenuto-percorso').innerHTML =
                '<p>Errore nel caricamento dell\'itinerario.</p>';
        });
}

