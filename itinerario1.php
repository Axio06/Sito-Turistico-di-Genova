
<?php
session_start();
$mysqli = new mysqli('localhost', 'root', '', 'genovapernoi');
$nome = isset($_GET['nome']) ? $mysqli->real_escape_string($_GET['nome']) : '';
$query = "SELECT * FROM itinerario WHERE LOWER(nome) = LOWER('$nome') LIMIT 1";
$result = $mysqli->query($query);
$itinerario = $result->fetch_assoc();
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
            <li><a href="index.php" class="active">Home</a></li>
            <li><a href="itinerario.php?nome=centro storico">Centro Storico</a></li>
            <li><a href="itinerario_2.php?nome=panorami sul mare">Panorami sul Mare</a></li>
            <li><a href="itinerario_4.php?nome=resistenza">Storia</a></li>
            <li><a href="itinerario_1.php?nome=palazzi dei rolli">Palazzo dei Rolli</a></li>
            <li><a href="itinerario_3.php?nome=passeggiata per nervi">Passeggiata per Nervi</a></li>
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
<?php
$conn = new mysqli('localhost', 'root', '', 'genovapernoi');
if ($conn->connect_error) { die('Connessione fallita: ' . $conn->connect_error); }
$sql = "SELECT * FROM tappa WHERE IDItinerario = 2 ORDER BY ordine ASC";
$result = $conn->query($sql);
?>
<main style="max-width:900px;margin:40px auto;background:#fff;padding:32px;border-radius:10px;box-shadow:0 4px 24px rgba(0,83,119,0.13);">
    <h2 style="color:#005377;font-size:2.2rem;text-align:center;margin-bottom:30px;">Genova Centro Storico: Itinerario consigliato</h2>
    <div class="itinerario-list">
        <?php while($row = $result->fetch_assoc()): ?>
        <div class="tappa">
            <h3><?= $row['ordine'] ?> - <?= htmlspecialchars($row['titolo']) ?></h3>
            <img src="<?= htmlspecialchars($row['immagine']) ?>" alt="<?= htmlspecialchars($row['titolo']) ?>" style="width:100%;max-width:600px;border-radius:10px;margin:15px 0;">
            <p><?= htmlspecialchars($row['descrizione']) ?>
            <?php if($row['link_maps']): ?>
                <a href="<?= htmlspecialchars($row['link_maps']) ?>" target="_blank">Vedi su Maps</a>
            <?php endif; ?></p>
            <?php if($row['iframe_maps']): ?>
                <iframe src="<?= htmlspecialchars($row['iframe_maps']) ?>" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
            <?php endif; ?>
            <?php if($row['tempoStimato']): ?>
                <p><strong>Tempo di visita:</strong> <?= htmlspecialchars($row['tempoStimato']) ?></p>
            <?php endif; ?>
        </div>
        <?php endwhile; ?>
    </div>
    <p style="margin-top:30px;"><a href="index.php" class="scopri-btn">&larr; Torna alla home</a></p>
</main>
<?php $conn->close(); ?>
</body>
</html>