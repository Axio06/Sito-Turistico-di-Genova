<?php
session_start();
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $conn = new mysqli('localhost', 'root', '', 'genovapernoi');
    $email = $_POST['email'];
    $password = $_POST['password'];

    $stmt = $conn->prepare("SELECT ID, password, role FROM utente WHERE email=?");
    $stmt->bind_param("s", $email);
    $stmt->execute();
    $stmt->store_result();
    if ($stmt->num_rows > 0) {
        $stmt->bind_result($userID, $hashedPassword, $role);
        $stmt->fetch();
        if (password_verify($password, $hashedPassword)) {
            $_SESSION['user_id'] = $userID;
            $_SESSION['role'] = $role;
            header("Location: index.php");
            exit();
        }
    } else {
        $errore = "Utente non trovato.";
    }
}
?>
<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Accedi - Genova per Noi</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <div class="login-container">
        <h2>Accedi</h2>
        <?php if (isset($errore)) { echo '<div class="errore-login">'.$errore.'</div>'; } ?>
        <form method="post" class="login-form">
            <label for="email">Email</label>
            <input type="email" name="email" id="email" required>

            <label for="password">Password</label>
            <input type="password" name="password" id="password" required>

            <button type="submit">Accedi</button>
        </form>
        <p class="login-link">Non hai un account? <a href="register.php">Registrati</a></p>
        <p class="login-link"><a href="index.php">Torna alla Home</a></p>
    </div>
</body>
</html>
