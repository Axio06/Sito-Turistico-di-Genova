<?php
session_start();
if (!isset($_SESSION['user_id']) || !isset($_SESSION['role']) || $_SESSION['role'] !== 'admin') {
    header('Location: index.php');
    exit();
}
$conn = new mysqli('localhost', 'root', '', 'genovapernoi');
if ($conn->connect_error) {
    die("Connessione fallita: " . $conn->connect_error);
}
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['itinerario_id'])) {
    $id_itinerario = intval($_POST['itinerario_id']);
    $stmt_tappe = $conn->prepare("DELETE FROM tappa WHERE IDItinerario = ?");
    $stmt_tappe->bind_param("i", $id_itinerario);
    $stmt_tappe->execute();
    $stmt_it = $conn->prepare("DELETE FROM itinerario WHERE id = ?");
    $stmt_it->bind_param("i", $id_itinerario);
    $stmt_it->execute();
    $messaggio = "Itinerario eliminato con successo!";
}
$result = $conn->query("SELECT id, nome FROM itinerario ORDER BY nome ASC");
?>
<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <title>Elimina Itinerario</title>
    <link rel="stylesheet" href="style.css">
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
                <a href="aggiungi.php" class="scopri-btn">Aggiungi</a>
                <a href="elimina_itinerario.php" class="scopri-btn">Elimina</a>
            </li>
        </ul>
    </nav>
</header>
<main style="max-width:900px;margin:40px auto;background:#fff;padding:32px;border-radius:10px;box-shadow:0 4px 24px rgba(0,83,119,0.13);">
    <h2>Elimina un Itinerario</h2>
    <?php if (isset($messaggio)) : ?>
        <div style="color:green;"><?= htmlspecialchars($messaggio) ?></div>
    <?php endif; ?>
    <form method="POST" action="elimina_itinerario.php">
        <label for="itinerario_id">Seleziona itinerario da eliminare:</label>
        <select name="itinerario_id" id="itinerario_id" required>
            <option value="">-- Scegli --</option>
            <?php while ($row = $result->fetch_assoc()): ?>
                <option value="<?= $row['id'] ?>"><?= htmlspecialchars($row['nome']) ?></option>
            <?php endwhile; ?>
        </select>
        <button type="submit" onclick="return confirm('Sei sicuro di voler eliminare questo itinerario? Verranno eliminate anche le tappe collegate.')">
            Elimina
        </button>
    </form>
    <br>
    <a href="index.php">Torna alla home</a>
</main>
</body>
</html>
