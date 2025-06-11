<?php
session_start();
if (!isset($_SESSION['tariffa'])) {
    $_SESSION['tariffa'] = 'intermedia'; // 'base', 'intermedia' o 'piena'
    $_SESSION['password_accesso'] = uniqid('PWD-'); // password univoca
    $_SESSION['data_validita'] = date('Y-m-d');
}
?>
<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>GenovaPerNoi</title>
    <link rel="stylesheet" href="itinerario_style.css">
</head>
<body>
<header>

    <h1>GenovaPerNoi</h1>
    <nav>
        <ul style="display:flex;justify-content:center;align-items:center;gap:24px;list-style:none;">
            <li><a href="index.php">Home</a></li>
            <li><a href="immagini.php">Immagini</a></li>
            <li><a href="acquista.php">Acquista</a></li>
            <li style="margin-left:auto;">
                <?php if(!isset($_SESSION['user_id'])): ?>
                    <a href="login.php" class="scopri-btn">Accedi</a>
                <?php else: ?>
                    <a href="logout.php" class="scopri-btn">Logout</a>
                    <a href="profilo.php" class="scopri-btn">Profilo</a>
                    <?php if(isset($_SESSION['role']) && $_SESSION['role'] === 'admin'): ?>
                        <a href="aggiungi.php" class="scopri-btn">Aggiungi</a>
                        <a href="elimina_itinerario.php" class="scopri-btn">Elimina</a>
                    <?php endif; ?>
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

<section id="hero" class="hero-magazine">
    <div class="hero-content">
        <h2>Genova: scegli il tuo itinerario e vivi la città</h2>
        <p>Scopri percorsi unici tra storia, panorami e cultura.</p>
        <p></p>
        <p></p>
        <p></p>
        <img src="img/genova_header.jpg" alt="Genova Header" style="width:100%; height:auto;">
                    <br></br>
    </div>

</section>

<section id="itinerari" class="itinerari-grid">
    <h2>I nostri itinerari a Genova</h2>
    <div class="grid">
        <?php
        $conn = new mysqli('localhost', 'root', '', 'genovapernoi');
        if ($conn->connect_error) { die('Connessione fallita: ' . $conn->connect_error); }
        $sql = "SELECT * FROM itinerario";
        $result = $conn->query($sql);
        while($row = $result->fetch_assoc()):
        ?>
        <div class="itinerario-card">
            <img src="<?= htmlspecialchars($row['immagine']) ?>" alt="<?= htmlspecialchars($row['nome']) ?>">
            <h3><?= htmlspecialchars($row['nome']) ?></h3>
            <p><?= htmlspecialchars($row['descrizione']) ?></p>
            <a href="itinerario.php?nome=<?= urlencode($row['nome']) ?>" class="scopri-btn">Scopri</a>
            <br>
            <form action="acquista.php" method="POST">
                <input type="hidden" name="itinerario_id" value="<?= $itinerario['ID'] ?>">
                <button type="submit">Acquista</button>
            </form>
        </div>
        <?php endwhile; $conn->close(); ?>
    </div>
</section>


<section id="contenuto-percorso">
    <p>Clicca per comprare il tuo biglietto per muoverti con i mezzi pubblici a Genova.</p>
    <a href="https://www.amt.genova.it/amt/biglietti-e-abbonamenti-2/" class="scopri-btn" style="display:block;margin-top:20px;text-align:center;">Acquista Biglietti AMT</a>
</section>

<footer>
    <p>&copy; 2025 Genova per Noi - Tutti i diritti riservati</p>
</footer>

<script src="script.js"></script>
</body>
</html>
