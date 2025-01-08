<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profile Management</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 600px;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .container h1 {
            text-align: center;
            margin-bottom: 20px;
        }
        form {
            display: flex;
            flex-direction: column;
        }
        label {
            margin-bottom: 5px;
            font-weight: bold;
        }
        input[type="text"], input[type="file"], input[type="password"], button {
            margin-bottom: 15px;
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ddd;
            border-radius: 5px;
            width: 100%;
        }
        button {
            background-color: #007bff;
            color: white;
            border: none;
            cursor: pointer;
        }
        button:hover {
            background-color: #0056b3;
        }
        .profile-picture {
            text-align: center;
            margin-bottom: 20px;
        }
        .profile-picture img {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            object-fit: cover;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Profil</h1>
        <div class="profile-picture">
            <img src="default-profile.jpg" alt="Foto Profil" id="profile-pic">
        </div>
        <form action="update_profile.php" method="POST" enctype="multipart/form-data">
            <label for="password">Ganti Password</label>
            <input type="password" name="password" id="password" placeholder="Masukkan Password Baru">

            <label for="photo">Foto Profil</label>
            <input type="file" name="photo" id="photo">

            <button type="submit">Simpan</button>
        </form>
    </div>

    <?php
    // PHP Script: update_profile.php
    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
        $conn = new mysqli("localhost", "root", "", "my_database");

        if ($conn->connect_error) {
            die("Koneksi gagal: " . $conn->connect_error);
        }

        $userId = 1; // Contoh user ID (sebaiknya didapatkan dari sesi login)
        $password = $_POST['password'];
        $photo = $_FILES['photo'];

        if (!empty($password)) {
            $hashedPassword = md5($password); // Enkripsi MD5
            $conn->query("UPDATE users SET password='$hashedPassword' WHERE id=$userId");
        }

        if (!empty($photo['name'])) {
            $targetDir = "uploads/";
            $targetFile = $targetDir . basename($photo['name']);
            move_uploaded_file($photo['tmp_name'], $targetFile);
            $conn->query("UPDATE users SET photo='$targetFile' WHERE id=$userId");
        }

        echo "<script>alert('Profil berhasil diperbarui!'); window.location.href='profile_page.php';</script>";
        $conn->close();
    }
    ?>
</body>
</html>
