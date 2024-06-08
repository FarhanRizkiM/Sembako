<!DOCTYPE html>
<html>

<head>
    <title>Halaman Admin</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>

<body>
    <?php include 'koneksi.php';
    session_start(); ?>
    <?php
    if (!isset($_SESSION['username'])) {
        echo "<script>alert('Anda Belum Login!');
    document.location.href = 'index.php';</script>";
    } else {
    ?>
        <a href="halaman_admin.php"><img style="padding-left: 28%; height: 350px; width: 610px;" src="images/sembako.jpg"></a>
        <div class="navigasi">
            <a href="halaman_pelanggan.php">Home</a>
        </div>
        <div class="profile">
            <center>
                <img src="images/account.png">
                <?php
                $tgl = date("d-m-Y");
                $username = $_SESSION['username'];
                $sql = mysqli_query($koneksi, "select * from customer where username='$username'");
                while ($data = mysqli_fetch_array($sql)) {
                ?>
                    <h2><?php echo $data['nama']; ?></h2>
                    <h3>Customer</h3>
                    <a href="edit_user.php?username=<?php echo $data['username']; ?>" class="btn-edit">Edit</a>
                    <a href="logout.php" class="btn-logout">Logout</a>
                <?php } ?>
                <hr>
                <h3 style="color: green">Tanggal : <?php echo $tgl ?></h3>
        </div>
        <div class="isi">
            <form method="POST">
                <h2>Edit Pengguna</h2>
                <hr>
                <?php
                include 'koneksi.php';
                $username = $_GET['username'];
                $data = mysqli_query($koneksi, "select * from customer where username='$username'");
                while ($d = mysqli_fetch_array($data)) {
                ?>
                    Username
                    <input type="text" name="username" placeholder="Masukkan Username" value="<?php echo $d['username']; ?>" required>
                    Nama Pengguna
                    <input type="text" name="nama" placeholder="Masukkan Nama Pengguna" value="<?php echo $d['nama']; ?>" required>
                    Password
                    <input type="password" name="password" placeholder="Masukkan Password" value="<?php echo $d['password']; ?>" required>
                    Jenis Kelamin<br>
                    <input style="margin-top: 10px;" type="radio" name="jk" value="Laki-laki">Laki-laki<br>
                    <input style="margin-top: 10px; margin-bottom: 10px; " type="radio" name="jk" value="Perempuan">Perempuan<br>
                    Email
                    <input type="email" name="email" placeholder="example@gmail.com" value="<?php echo $d['email']; ?>">
                    Alamat
                    <textarea name="alamat" required><?php echo $d['alamat'] ?></textarea>
                    No Hp
                    <input type="number" name="no_hp" placeholder="08123456789" value="<?php echo $d['no_hp']; ?>">
                    <input type="submit" value="Edit" name="submit">
                <?php } ?>
                <a href="halaman_pelanggan.php">
                    << Kembali</a>
        </div>
    <?php } ?>
    <div class="footer">@Copyright 2020</div>


    <?php
    include 'koneksi.php';
    if (isset($_POST['submit'])) {
        $username = $_POST['username'];
        $nama = $_POST['nama'];
        $password = $_POST['password'];
        $jk = $_POST['jk'];
        $email = $_POST['email'];
        $alamat = $_POST['alamat'];
        $no = $_POST['no_hp'];

        $save = mysqli_query($koneksi, "update customer set username='$username',nama='$nama',password='$password',jk='$jk',email='$email',alamat='$alamat',no_hp='$no' where username='$username'");
        if ($save) {
            echo "<script>alert('Edit Berhasil!'); document.location.href = 'halaman_pelanggan.php';</script>";
        } else {
            echo "Data Gagal Disimpan!!";
        }
    }
    ?>
</body>

</html>