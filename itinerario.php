<?php
session_start();

if (!isset($_SESSION['user_id'])) {
    header("Location: index.php");
}
else{
$mysqli = new mysqli('localhost', 'root', '', 'genovapernoi');
$nome = isset($_GET['nome']) ? $mysqli->real_escape_string($_GET['nome']) : '';
$query = "SELECT * FROM itinerario WHERE LOWER(nome) = LOWER('$nome') LIMIT 1";
$result = $mysqli->query($query);
$itinerario = $result->fetch_assoc();

$idItinerario = $itinerario ? $itinerario['ID'] : 0;
$conn = new mysqli('localhost', 'root', '', 'genovapernoi');
if ($conn->connect_error) { die('Connessione fallita: ' . $conn->connect_error); }
$sql = "SELECT * FROM tappa WHERE IDItinerario = $idItinerario ORDER BY ordine ASC";
$result = $conn->query($sql);
}
?>
<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <title>Dettaglio Itinerario</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
<header>
    <h1>Genova per Noi</h1>
    <nav>
        <ul id="main-nav">
            <li><a href="index.php">Home</a></li>
            <li><a href="immagini.php">Immagini</a></li>
            <li style="margin-left:auto;">
                <?php if(!isset($_SESSION['user_id'])): ?>
                    <a href="login.php" class="scopri-btn">Accedi</a>
                <?php else: ?>
                    <a href="logout.php" class="scopri-btn">Logout</a>
                <?php endif; ?>
            </li>
        </ul>
    </nav>
</header>
<div id="google_translate_element"></div>

<script type="text/javascript">
    function googleTranslateElementInit() {
        new google.translate.TranslateElement(
            { pageLanguage: 'it' },
            'google_translate_element'
        );
    }
</script>

<script type="text/javascript" src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>

<main style="max-width:900px;margin:40px auto;background:#fff;padding:32px;border-radius:10px;box-shadow:0 4px 24px rgba(0,83,119,0.13);">
    <?php if($itinerario): ?>
        <h2 style="color:#005377;font-size:2.2rem;text-align:center;margin-bottom:30px;">
            <?= htmlspecialchars($itinerario['nome']) ?>: Itinerario consigliato
        </h2>
        <div class="itinerario-list">
            <?php while($row = $result->fetch_assoc()): ?>
            <div class="tappa">
            <?php if($row['iframe_maps']): ?>
                    <iframe src="<?= htmlspecialchars($row['iframe_maps']) ?>" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                <?php endif; ?>
                <h3><?= $row['ordine'] ?> - <?= htmlspecialchars($row['titolo']) ?></h3>
                <img src="<?= htmlspecialchars($row['immagine']) ?>" alt="<?= htmlspecialchars($row['titolo']) ?>" style="width:100%;max-width:600px;border-radius:10px;margin:15px 0;">
                <p><?= htmlspecialchars($row['descrizione']) ?>
                <?php if($row['link_maps']): ?>
                    <a href="<?= htmlspecialchars($row['link_maps']) ?>" target="_blank"> clicca qui per vedere</a>
                <?php endif; ?></p>
                <?php if($row['tempoStimato']): ?>
                    <p><strong>Tempo di visita:</strong> <?= htmlspecialchars($row['tempoStimato']) ?></p>
                <?php endif; ?>
            </div>
            <?php endwhile; ?>
        </div>
    <?php else: ?>
        <h2>Itinerario non trovato</h2>
    <?php endif; ?>
    <p style="margin-top:30px;"><a href="index.php" class="scopri-btn">&larr; Torna alla home</a></p>
</main>
<?php $conn->close(); ?>
</body>
</html>