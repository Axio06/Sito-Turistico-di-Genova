<?php
session_start();
if (!isset($_SESSION['user_id'])) {
    header('Location: login.php');
    exit();
}
$conn = new mysqli('localhost', 'root', '', 'genovapernoi');
$user_id = $_SESSION['user_id'];

// Recupera info utente
$sql = "SELECT nome, cognome, email, dataNascita, tariffa, role FROM utente WHERE ID=?";
$stmt = $conn->prepare($sql);
$stmt->bind_param('i', $user_id);
$stmt->execute();
$stmt->bind_result($nome, $cognome, $email, $dataNascita, $tariffa, $role);
$stmt->fetch();
$stmt->close();

// Recupera itinerari acquistati
$sql_itinerari = "
    SELECT itinerario.nome, itinerario.descrizione, itinerario.immagine
    FROM itinerario
    JOIN acquisti ON itinerario.id = acquisti.itinerario_id 
    WHERE acquisti.user_id = ?";
$stmt_itinerari = $conn->prepare($sql_itinerari);
$stmt_itinerari->bind_param('i', $user_id);
$stmt_itinerari->execute();
$result_itinerari = $stmt_itinerari->get_result();

$conn->close();
?>
<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <title>Profilo Utente</title>
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        body { background: #f4f8fb; }
        .profile-card {
            background: #fff;
            max-width: 420px;
            margin: 48px auto 0 auto;
            border-radius: 18px;
            box-shadow: 0 4px 24px rgba(0,83,119,0.13);
            padding: 40px 36px 32px 36px;
            text-align: center;
        }
        .profile-avatar {
            width: 90px;
            height: 90px;
            border-radius: 50%;
            background: #e3eaf1;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 48px;
            color: #005377;
            margin: 0 auto 18px auto;
        }
        .profile-list {
            text-align: left;
            margin: 0;
            padding: 0;
            list-style: none;
        }
        .profile-list li {
            padding: 10px 0;
            border-bottom: 1px solid #f0f0f0;
            display: flex;
            align-items: center;
            gap: 12px;
        }
        .profile-list li:last-child { border-bottom: none; }
        .profile-list strong { min-width: 110px; display: inline-block; color: #005377; }
        .profile-actions {
            margin-top: 32px;
            display: flex;
            gap: 16px;
            justify-content: center;
        }
        .profile-actions a {
            padding: 10px 22px;
            border-radius: 8px;
            background: #005377;
            color: #fff;
            text-decoration: none;
            font-weight: 500;
            transition: background 0.2s;
        }
        .profile-actions a:hover { background: #0077a6; }
        .itinerari-acquistati {
            max-width: 700px;
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
        .itinerario-item {
            border-bottom: 1px solid #ddd;
            padding: 16px 0;
        }
        .itinerario-item:last-child { border-bottom: none; }
        .itinerario-item h4 {
            margin-bottom: 6px;
            color: #0077a6;
        }
    </style>
</head>
<body>
<header>
    <h1>GenovaPerNoi</h1>
    <nav>
        <ul style="display:flex;justify-content:center;align-items:center;gap:24px;list-style:none;">
            <li><a href="index.php">Home</a></li>
            <li><a href="immagini.php">Immagini</a></li>
            <li style="margin-left:auto;">
                <?php if(!isset($_SESSION['user_id'])): ?>
                    <a href="login.php" class="scopri-btn">Accedi</a>
                <?php else: ?>
                    <a href="logout.php" class="scopri-btn">Logout</a>
                    <a href="profilo.php" class="scopri-btn active">Profilo</a>
                    <?php if(isset($_SESSION['role']) && $_SESSION['role'] === 'admin'): ?>
                        <a href="aggiungi.php" class="scopri-btn">Aggiungi</a>
                        <a href="elimina_itinerario.php" class="scopri-btn">Elimina</a>
                    <?php endif; ?>
                <?php endif; ?>
            </li>
        </ul>
    </nav>
</header>
<main>
    <div class="profile-card">
        <div class="profile-avatar"><i class="fa-solid fa-user"></i></div>
        <h2 style="margin-bottom:18px;">Profilo Utente</h2>
        <ul class="profile-list">
            <li><i class="fa-solid fa-id-card"></i> <strong>Nome:</strong> <?php echo htmlspecialchars($nome); ?></li>
            <li><i class="fa-solid fa-id-card"></i> <strong>Cognome:</strong> <?php echo htmlspecialchars($cognome); ?></li>
            <li><i class="fa-solid fa-envelope"></i> <strong>Email:</strong> <?php echo htmlspecialchars($email); ?></li>
            <li><i class="fa-solid fa-cake-candles"></i> <strong>Data di nascita:</strong> <?php echo htmlspecialchars($dataNascita); ?></li>
            <li><i class="fa-solid fa-ticket"></i> <strong>Tariffa:</strong> <?php if($tariffa=3)echo 'piena'; else if($tariffa=2) echo 'intermedia'; else  echo 'base'; ?></li>
            <li><i class="fa-solid fa-user-shield"></i> <strong>Ruolo:</strong> <?php echo htmlspecialchars($role); ?></li>
        </ul>
        <div class="profile-actions">
            <a href="index.php">Torna alla Home</a>
        </div>
    </div>

    <div class="itinerari-acquistati">
        <h3>Itinerari Acquistati</h3>
        <div class="itinerari-grid">
        <?php if ($result_itinerari->num_rows > 0): ?>
            <?php while ($row = $result_itinerari->fetch_assoc()): ?>
                <div class="itinerario-card">
                <img src="<?= htmlspecialchars($row['immagine']) ?>" alt="<?= htmlspecialchars($row['nome']) ?>" class="itinerario-img">
                <h3><?= htmlspecialchars($row['nome']) ?></h3>
                <p><?= htmlspecialchars($row['descrizione']) ?></p>
                <a href="itinerario.php?nome=<?= urlencode($row['nome']) ?>" class="scopri-btn">Scopri</a>
            </div>
        <?php endwhile; ?>
    <?php else: ?>
        <p style="text-align:center;">Non hai ancora acquistato nessun itinerario.</p>
    <?php endif; ?>
    </div>
</div>
</main>
<footer>
    <p style="margin-top:48px;">&copy; 2025 Genova per Noi - Tutti i diritti riservati</p>
</footer>
</body>
</html>
