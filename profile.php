<?php
session_start();
$mysqli = new mysqli("localhost", "username", "password", "database_name");

// Periksa koneksi
if ($mysqli->connect_error) {
    die("Connection failed: " . $mysqli->connect_error);
}

// Ambil data user (contoh: user ID disimpan dalam session)
$user_id = 1; // Ubah sesuai login user
$sql = "SELECT * FROM users WHERE id = ?";
$stmt = $mysqli->prepare($sql);
$stmt->bind_param("i", $user_id);
$stmt->execute();
$result = $stmt->get_result();
$user = $result->fetch_assoc();

// Proses form jika ada data dikirim
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Update password jika diisi
    if (!empty($_POST["password"])) {
        $new_password = md5($_POST["password"]); // Enkripsi dengan MD5
        $update_password = "UPDATE users SET password = ? WHERE id = ?";
        $stmt = $mysqli->prepare($update_password);
        $stmt->bind_param("si", $new_password, $user_id);
        $stmt->execute();
    }

    // Upload foto jika ada file
    if (!empty($_FILES["profile_pic"]["name"])) {
        $target_dir = "uploads/";
        $target_file = $target_dir . basename($_FILES["profile_pic"]["name"]);
        move_uploaded_file($_FILES["profile_pic"]["tmp_name"], $target_file);

        $update_pic = "UPDATE users SET profile_pic = ? WHERE id = ?";
        $stmt = $mysqli->prepare($update_pic);
        $stmt->bind_param("si", $target_file, $user_id);
        $stmt->execute();
    }

    // Refresh halaman setelah update
    header("Location: profile.php");
    exit();
}
?>
    <main>
        <section class="profile">
            <h2>Profil</h2>
            <form method="POST" enctype="multipart/form-data">
                <div>
                    <label for="password">Ganti Password</label>
                    <input type="password" name="password" id="password" placeholder="Masukkan password baru">
                </div>
                <div>
                    <label for="profile_pic">Ganti Foto Profil</label>
                    <input type="file" name="profile_pic" id="profile_pic">
                </div>
                <div>
                    <label>Foto Saat Ini</label><br>
                    <img src="<?= htmlspecialchars($user["profile_pic"]) ?>" alt="Foto Profil" style="width: 150px; height: 150px; border-radius: 50%;">
                </div>
                <button type="submit">Simpan</button>
            </form>
        </section>
    </main>
</body>
</html>
