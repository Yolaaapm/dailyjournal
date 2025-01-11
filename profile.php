<?php
session_start();

include "koneksi.php";  
// Ambil data user dari database
$username = $_SESSION['username'];
$query = mysqli_query($conn, "SELECT * FROM user WHERE username='$username'");
$data = mysqli_fetch_assoc($query);

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    // Menghandle form
    $password_baru = $_POST['password_baru'];
    $foto = $_FILES['foto']['name'];
    $foto_tmp = $_FILES['foto']['tmp_name'];
    $foto_lama = $data['foto']; // Foto lama

    // Jika user mengisi password baru
    if (!empty($password_baru)) {
        $password_enkripsi = md5($password_baru);
        mysqli_query($conn, "UPDATE user SET password='$password_enkripsi' WHERE username='$username'");
    }

    // Jika user mengupload foto baru
    if (!empty($foto)) {
        $target_dir = "img/";
        $target_file = $target_dir . basename($foto);
        move_uploaded_file($foto_tmp, $target_file);

        // Update nama foto di database
        mysqli_query($conn, "UPDATE user SET foto='$foto' WHERE username='$username'");
    }

    header("location:profile.php");
}

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>My Daily Journal | Admin</title>
    <link rel="icon" href="img/logo.png" />
    <link
    rel="stylesheet"
    href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css"
    />
    <link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
    rel="stylesheet"
    integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
    crossorigin="anonymous"
    /> 
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <style>  
        html {
            position: relative;
            min-height: 100%;
        }
        body {
            margin-bottom: 100px; /* Margin bottom by footer height */
        }
        footer {
            position: absolute;
            bottom: 0;
            width: 100%;
            height: 100px; /* Set the fixed height of the footer here */ 
        }
    </style>
</head>
<body>
    <!-- nav begin -->
    <nav class="navbar navbar-expand-sm bg-body-tertiary sticky-top bg-danger-subtle">
    <div class="container">
        <a class="navbar-brand" href=".">My Daily Journal</a>
        <button
        class="navbar-toggler"
        type="button"
        data-bs-toggle="collapse"
        data-bs-target="#navbarSupportedContent"
        aria-controls="navbarSupportedContent"
        aria-expanded="false"
        aria-label="Toggle navigation"
        >
        <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav ms-auto mb-2 mb-lg-0 text-dark">
            <li class="nav-item">
                <a class="nav-link" href="admin.php?page=dashboard">Dashboard</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="admin.php?page=article">Article</a>
            </li> 
            <li class="nav-item">
                <a class="nav-link" href="admin.php?page=gallery">Gallery</a>
            </li> 
            <li class="nav-item">
                <b><a class="nav-link" href="admin.php?page=homepage">Homepage</a></b>
            </li> 
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle text-danger fw-bold" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                    <?= $_SESSION['username']?>
                </a>
                <ul class="dropdown-menu">
                    <li><a class="dropdown-item" href="profile.php">Profile fio</a></li> 
                    <li><a class="dropdown-item" href="logout.php">Logout</a></li> 
                </ul>
            </li> 
        </ul>
        </div>
    </div>
    </nav>
    <!-- nav end -->
    <!-- content begin --><div class="container mt-5">
        <h4 class="lead display-6 pb-2 border-bottom border-danger-subtle">Profile</h4>
        <form method="POST" enctype="multipart/form-data">
            <div class="mb-3">
                <label for="password_baru" class="form-label">Ganti Password</label>
                <input type="password" class="form-control" name="password_baru" placeholder="Masukkan password baru jika ingin mengubah">
            </div>
            <div class="mb-3">
                <label for="foto" class="form-label">Ganti Foto Profil</label>
                <input type="file" class="form-control" name="foto">
            </div>
            <div class="mb-3">
                <label for="foto_lama" class="form-label">Foto Profil Saat Ini</label><br>
                <img src="img/<?= $data['foto']; ?>" alt="Foto Profil" style="max-width: 150px;">
            </div>
            <button class="btn btn-primary" type="submit">Simpan</button>
        </form>
    </div>
    <!-- Akhir Modal Tambah-->
    <!-- content end -->
    <!-- footer begin -->
    <footer class="text-center p-5 bg-danger-subtle">
    <div>
        <a href="https://www.instagram.com/fiolaa09?igsh=d25pMGxtaDQ4Ym8x&utm_source=qr"
        ><i class="bi bi-instagram h2 p-2 text-dark"></i
        ></a>
        <a href="https://twitter.com/udinusofficial"
        ><i class="bi bi-twitter h2 p-2 text-dark"></i
        ></a>
        <a href="https://wa.me/+6285647355825"
        ><i class="bi bi-whatsapp h2 p-2 text-dark"></i
        ></a>
    </div>
    <div>Fiola Putri Monika &copy; 2024</div>
    </footer>
    <!-- footer end -->
    <script
    src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
    crossorigin="anonymous"
    ></script>
</body>
</html>