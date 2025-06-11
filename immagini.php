<?php
session_start();

if (!isset($_SESSION['user_id']) || ($_SESSION['tariffa'] == 1)) {
    echo "Accesso negato. Solo utenti con tariffa intermedia o piena possono visualizzare le immagini.";
    exit();
}

$conn = new mysqli('localhost', 'root', '', 'genovapernoi');
if ($conn->connect_error) {
    die('Connessione fallita: ' . $conn->connect_error);
}

$result = $conn->query("SELECT nome, descrizione, percorso FROM immagini");
?>

<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <title>Galleria Immagini</title>
    <link rel="stylesheet" href="itinerario_style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        body {
            background: #f4f8fb;
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }
        header {
            background-color: #0077a6;
            color: white;
            padding: 16px 0;
            text-align: center;
        }
        nav ul {
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 24px;
            list-style: none;
            padding: 0;
            margin: 0;
            background-color: #005377;
        }
        nav ul li a {
            color: white;
            text-decoration: none;
            font-weight: bold;
            padding: 12px 18px;
            display: inline-block;
        }
        nav ul li a:hover, .active {
            background-color: #003f5c;
            border-radius: 8px;
        }
        .galleria-container {
            max-width: 900px;
            margin: 48px auto;
            background: #fff;
            border-radius: 16px;
            box-shadow: 0 4px 24px rgba(0,83,119,0.08);
            padding: 32px;
        }
        .galleria-container h3 {
            text-align: center;
            color: #005377;
            margin-bottom: 32px;
        }
        .image-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(240px, 1fr));
            gap: 24px;
        }
        .image-card {
            background: #eef5fa;
            border-radius: 12px;
            padding: 16px;
            text-align: center;
            box-shadow: 0 2px 12px rgba(0,0,0,0.05);
        }
        .image-card img {
            width: 100%;
            height: auto;
            border-radius: 8px;
        }
        .image-card .description {
            margin-top: 12px;
            color: #333;
        }
        footer {
            margin-top: 48px;
            padding: 16px;
            text-align: center;
            background-color: #005377;
            color: white;
        }
    </style>
</head>
<body>

<header>
    <h1>GenovaPerNoi</h1>
</header>

<nav>
    <ul>
        <li><a href="index.php">Home</a></li>
        <li><a href="immagini.php">Immagini</a></li>
        <li><a href="profilo.php">Profilo</a></li>
        <?php if(!isset($_SESSION['user_id'])): ?>
            <a href="login.php" class="scopri-btn">Accedi</a>
        <?php else: ?>
        <a href="logout.php" class="scopri-btn">Logout</a>
        <?php if (isset($_SESSION['role']) && $_SESSION['role'] === 'admin'): ?>
            <li><a href="aggiungi.php" class="scopri-btn">Aggiungi</a></li>
            <li><a href="elimina_itinerario.php" class="scopri-btn">Elimina</a></li>
        <?php endif; ?>
    </ul>
</nav>
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

<main>
    <div class="galleria-container">
        <h3>Galleria Fotografica</h3>
        <div class="image-grid">
            <?php if ($result && $result->num_rows > 0): ?>
                <?php while ($row = $result->fetch_assoc()): ?>
                    <div class="image-card">
                        <img src="<?= htmlspecialchars($row['percorso']) ?>" alt="<?= htmlspecialchars($row['nome']) ?>">
                        <div class="description"><?= htmlspecialchars($row['descrizione']) ?></div>
                    </div>
                <?php endwhile; ?>
            <?php else: ?>
                <p style="text-align: center;">Nessuna immagine disponibile.</p>
            <?php endif; ?>
        </div>
    </div>
</main>

<footer>
    <p>&copy; 2025 Genova per Noi - Tutti i diritti riservati</p>
</footer>

</body>
<?php $conn->close(); ?>
</html>
