<?php
session_start();
$conn = new mysqli("localhost", "root", "", "genovapernoi");
if ($conn->connect_error) {
    die('Connessione fallita: ' . $conn->connect_error);
}

// Gestione acquisto
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['itinerario_id'])) {
    if (!isset($_SESSION['user_id'])) {
        $_SESSION['message'] = "Devi accedere per acquistare un itinerario.";
        header("Location: login.php");
        exit();
    }

    $itinerario_id = $_POST['itinerario_id'];
    $user_id = $_SESSION['user_id'];

    $stmt = $conn->prepare("SELECT ID FROM itinerario WHERE ID = ?");
    $stmt->bind_param("i", $itinerario_id);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows === 0) {
        $_SESSION['message'] = "L'itinerario selezionato non esiste.";
    } else {
        $stmt = $conn->prepare("SELECT id FROM acquisti WHERE user_id = ? AND itinerario_id = ?");
        $stmt->bind_param("ii", $user_id, $itinerario_id);
        $stmt->execute();
        $result = $stmt->get_result();

        if ($result->num_rows > 0) {
            $_SESSION['message'] = "Hai già acquistato questo itinerario.";
        } else {
            $stmt = $conn->prepare("INSERT INTO acquisti (user_id, itinerario_id, data_acquisto) VALUES (?, ?, NOW())");
            $stmt->bind_param("ii", $user_id, $itinerario_id);
            if ($stmt->execute()) {
                $_SESSION['message'] = "Acquisto completato con successo!";
            } else {
                $_SESSION['message'] = "Errore nell'acquisto. Riprova.";
            }
        }
    }
    $stmt->close();
}

// Recupera itinerari e acquisti
$itinerari = $conn->query("SELECT * FROM itinerario");
$acquisti = [];

if (isset($_SESSION['user_id'])) {
    $stmt = $conn->prepare("SELECT itinerario_id FROM acquisti WHERE user_id = ?");
    $stmt->bind_param("i", $_SESSION['user_id']);
    $stmt->execute();
    $result = $stmt->get_result();
    while ($row = $result->fetch_assoc()) {
        $acquisti[] = $row['itinerario_id'];
    }
    $stmt->close();
}

$conn->close();
?>

<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <title>Acquista Itinerari</title>
    <link rel="stylesheet" href="itinerario_style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        body { background: #f4f8fb; font-family: sans-serif; }
        .itinerari-acquistati {
            max-width: 1000px;
            margin: 48px auto;
            background: #fff;
            border-radius: 16px;
            box-shadow: 0 4px 24px rgba(0,83,119,0.08);
            padding: 32px;
        }
        .itinerari-acquistati h3 {
            margin-bottom: 24px;
            color: #005377;
            text-align: center;
        }
        .grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 24px;
        }
        .itinerario-card {
            border: 1px solid #ddd;
            border-radius: 12px;
            padding: 16px;
            background: #fafafa;
            text-align: center;
        }
        .itinerario-card img {
            width: 100%;
            height: 160px;
            object-fit: cover;
            border-radius: 8px;
        }
        .itinerario-card h3 {
            color: #0077a6;
            margin: 12px 0 6px;
        }
        .itinerario-card p {
            margin: 6px 0;
        }
        .scopri-btn {
            background: #0077a6;
            color: #fff;
            padding: 8px 16px;
            border-radius: 8px;
            text-decoration: none;
            display: inline-block;
            margin-top: 10px;
        }
        .scopri-btn:hover {
            background: #005377;
        }
        .itinerario-actions {
            margin-top: 12px;
        }
        .active { background: #005377; }
    </style>
</head>
<body>
<header>
    <h1 style="text-align:center;">GenovaPerNoi</h1>
    <nav>
        <ul style="display:flex;justify-content:center;align-items:center;gap:24px;list-style:none;padding:0;">
            <li><a href="index.php">Home</a></li>
            <li><a href="immagini.php">Immagini</a></li>
            <li style="margin-left:auto;">
                <?php if (!isset($_SESSION['user_id'])): ?>
                    <a href="login.php" class="scopri-btn">Accedi</a>
                <?php else: ?>
                    <a href="logout.php" class="scopri-btn">Logout</a>
                    <a href="profilo.php" class="scopri-btn active">Profilo</a>
                    <?php if (isset($_SESSION['role']) && $_SESSION['role'] === 'admin'): ?>
                        <a href="aggiungi.php" class="scopri-btn">Aggiungi</a>
                        <a href="elimina_itinerario.php" class="scopri-btn">Elimina</a>
                    <?php endif; ?>
                <?php endif; ?>
            </li>
        </ul>
    </nav>
</header>

<main>
    <div class="itinerari-acquistati">
        <?php if (isset($_SESSION['message'])): ?>
            <p style="color: green; text-align:center;"><?= htmlspecialchars($_SESSION['message']) ?></p>
            <?php unset($_SESSION['message']); ?>
        <?php endif; ?>

        <h3>Acquista Itinerari</h3>
        <div class="grid">
            <?php if ($itinerari && $itinerari->num_rows > 0): ?>
                <?php while($itinerario = $itinerari->fetch_assoc()): ?>
                    <div class="itinerario-card">
                        <img src="<?= htmlspecialchars($itinerario['immagine']) ?>" alt="<?= htmlspecialchars($itinerario['nome']) ?>">
                        <h3><?= htmlspecialchars($itinerario['nome']) ?></h3>
                        <p><?= htmlspecialchars($itinerario['descrizione']) ?></p>
                        <p><strong>Prezzo:</strong> <?= number_format($itinerario['prezzo'], 2) ?> €</p>
                        <a href="itinerario.php?nome=<?= urlencode($itinerario['nome']) ?>" class="scopri-btn">Scopri</a>
                        <div class="itinerario-actions">
                            <?php if (in_array($itinerario['ID'], $acquisti)): ?>
                                <p style="color: green;">✅ Già acquistato</p>
                            <?php elseif (isset($_SESSION['user_id'])): ?>
                                <form action="acquista.php" method="POST" onsubmit="return confirm('Confermi di voler acquistare <?= addslashes(htmlspecialchars($itinerario['nome'])) ?>?')">
                                    <input type="hidden" name="itinerario_id" value="<?= $itinerario['ID'] ?>">
                                    <button type="submit" class="scopri-btn">Acquista ora</button>
                                </form>
                            <?php else: ?>
                                <p><a href="login.php">Accedi</a> per acquistare</p>
                            <?php endif; ?>
                        </div>
                    </div>
                <?php endwhile; ?>
            <?php else: ?>
                <p>Nessun itinerario disponibile.</p>
            <?php endif; ?>
        </div>
    </div>
</main>

<footer>
    <p style="margin-top:48px; text-align:center;">&copy; 2025 Genova per Noi - Tutti i diritti riservati</p>
</footer>
</body>
</html>
