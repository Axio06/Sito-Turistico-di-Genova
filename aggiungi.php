<?php
session_start();
if (!isset($_SESSION['user_id']) || !isset($_SESSION['role']) || $_SESSION['role'] !== 'admin') {
    header('Location: index.php');
    exit();
}
$success = $error = '';
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $conn = new mysqli('localhost', 'root', '', 'genovapernoi');
    if ($conn->connect_error) { die('Connessione fallita: ' . $conn->connect_error); }

    $nome = $conn->real_escape_string($_POST['nome']);
    $descrizione = $conn->real_escape_string($_POST['descrizione']);
    $durata = $conn->real_escape_string($_POST['durata']);
    $difficolta = $conn->real_escape_string($_POST['difficolta']);

    $sql = "INSERT INTO itinerario (nome, descrizione, durata, difficolta) VALUES ('$nome', '$descrizione', '$durata', '$difficolta')";
    if ($conn->query($sql)) {
        $idItinerario = $conn->insert_id;

        if (isset($_POST['tappa']) && is_array($_POST['tappa'])) {
            foreach ($_POST['tappa'] as $ordine => $tappa) {
                $titolo = $conn->real_escape_string($tappa['titolo']);
                $descr = $conn->real_escape_string($tappa['descrizione']);
                $img = $conn->real_escape_string($tappa['immagine']);
                $maps = $conn->real_escape_string($tappa['link_maps']);
                $iframe = $conn->real_escape_string($tappa['iframe_maps']);
                $tempo = $conn->real_escape_string($tappa['tempoStimato']);

                $sqlTappa = "INSERT INTO tappa (IDItinerario, ordine, titolo, descrizione, immagine, link_maps, iframe_maps, tempoStimato)
                             VALUES ($idItinerario, " . ($ordine + 1) . ", '$titolo', '$descr', '$img', '$maps', '$iframe', '$tempo')";
                $conn->query($sqlTappa);
            }
        }

        $success = 'Itinerario aggiunto con successo!';
    } else {
        $error = 'Errore: ' . $conn->error;
    }
    $conn->close();
}
?>

<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <title>Aggiungi Itinerario</title>
    <link rel="stylesheet" href="style.css">
    <script>
    function aggiungiTappa() {
        const tappeDiv = document.getElementById('tappe');
        const idx = tappeDiv.children.length;
        const html = `<div class='tappa-form' style='margin-bottom:24px;padding:16px;border:1px solid #ccc;border-radius:8px;'>
            <h4>Tappa ${idx+1}</h4>
            <label>Titolo: <input type='text' name='tappa[${idx}][titolo]' required></label><br>
            <label>Descrizione: <textarea name='tappa[${idx}][descrizione]' required></textarea></label><br>
            <label>Immagine (URL): <input type='text' name='tappa[${idx}][immagine]'></label><br>
            <label>Link Google Maps: <input type='text' name='tappa[${idx}][link_maps]'></label><br>
            <label>Iframe Maps: <input type='text' name='tappa[${idx}][iframe_maps]'></label><br>
            <label>Tempo stimato: <input type='text' name='tappa[${idx}][tempoStimato]'></label><br>
        </div>`;
        tappeDiv.insertAdjacentHTML('beforeend', html);
    }
    </script>
</head>
<body>
<header>
    <h1>GenovaPerNoi</h1>
    <nav>
        <ul style="display:flex;justify-content:center;align-items:center;gap:24px;list-style:none;">
            <li><a href="index.php">Home</a></li>
            <li><a href="itinerario.php?nome=centro storico">Centro Storico</a></li>
            <li><a href="itinerario_2.php?nome=panorami sul mare">Panorami sul Mare</a></li>
            <li><a href="itinerario_4.php?nome=resistenza">Storia</a></li>
            <li><a href="itinerario_1.php?nome=palazzi dei rolli">Palazzo dei Rolli</a></li>
            <li><a href="itinerario_3.php?nome=passeggiata per nervi">Passeggiata per Nervi</a></li>
            <li style="margin-left:auto;">
                <a href="logout.php" class="scopri-btn">Logout</a>
                <a href="profilo.php" class="scopri-btn">Profilo</a>
                <a href="aggiungi.php" class="scopri-btn active">Aggiungi</a>
                <a href="elimina_itinerario.php" class="scopri-btn">Elimina</a>
            </li>
        </ul>
    </nav>
</header>

<main style="max-width:900px;margin:40px auto;background:#fff;padding:32px;border-radius:10px;box-shadow:0 4px 24px rgba(0,83,119,0.13);">
    <h2>Aggiungi un nuovo itinerario</h2>
    <?php if ($success) echo "<div style='color:green;'>$success</div>"; ?>
    <?php if ($error) echo "<div style='color:red;'>$error</div>"; ?>

    <form method="post">
        <label>Nome itinerario:<br><input type="text" name="nome" required></label><br><br>
        <label>Descrizione:<br><textarea name="descrizione" required></textarea></label><br><br>
        <label>Durata:<br><textarea name="durata" required></textarea></label><br><br>
        <label>Difficoltà:<br><textarea name="difficolta" required></textarea></label><br><br>

        <h3>Tappe dell'itinerario</h3>
        <div id="tappe"></div>
        <button type="button" onclick="aggiungiTappa()">Aggiungi Tappa</button><br><br>
        <button type="submit">Salva Itinerario</button>
    </form>

    <p style="margin-top:30px;"><a href="index.php" class="scopri-btn">&larr; Torna alla home</a></p>
</main>
</body>
</html>
