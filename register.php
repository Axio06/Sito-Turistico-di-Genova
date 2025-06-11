<?php
session_start();
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $conn = new mysqli('localhost', 'root', '', 'genovapernoi');
    
    $nome = $_POST['nome'];
    $cognome = $_POST['cognome'];
    $email = $_POST['email'];
    $password = password_hash($_POST['password'], PASSWORD_BCRYPT);
    $data_nascita = $_POST['datanascita'];
    $tariffa = $_POST['tariffa'];

    $stmt = $conn->prepare("INSERT INTO utente (nome, cognome, email, password, dataNascita, tariffa) VALUES (?, ?, ?, ?, ?, ?)");
    $stmt->bind_param("sssssi", $nome, $cognome, $email, $password, $data_nascita, $tariffa);
    
    if ($stmt->execute()) {
        header("Location: login.php");
        exit();
    } else {
        $errore = "Errore durante la registrazione: " . $stmt->error;
    }
}
?>
<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registrati - Genova per Noi</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <div class="login-container">
        <h2>Registrati</h2>
        <?php if (isset($errore)) { echo '<div class="errore-login">'.$errore.'</div>'; } ?>
        <form method="post" class="login-form">
            <label for="nome">Nome</label>
            <input type="text" name="nome" id="nome" required>

            <label for="cognome">Cognome</label>
            <input type="text" name="cognome" id="cognome" required>

            <label for="email">Email</label>
            <input type="email" name="email" id="email" required>

            <label for="password">Password</label>
            <input type="password" name="password" id="password" required>

            <label for="datanascita">Data di Nascita</label>
            <input type="date" name="datanascita" id="datanascita" required>

            <label for="tariffa">Tipo di Tariffa</label>
            <select name="tariffa" id="tariffa" required>
                <option value="1">Base</option>
                <option value="2">Intermedia</option>
                <option value="3">Piena</option>
            </select>

            <button type="submit">Registrati</button>
        </form>
        <p class="login-link">Hai già un account? <a href="login.php">Accedi</a></p>
        <p class="login-link"><a href="index.php">Torna alla Home</a></p>
    </div>
</body>
</html>
