<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CHECKOUT SUCCES | TOKO SEMBAKO</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
<?php include 'koneksi.php'; session_start(); ?>
  <?php 
  if(!isset($_SESSION['username'])){
    echo "<script>alert('Anda Belum Login!');
    document.location.href = 'index.php';</script>";
  }
  else{
  ?>
  <a href="halaman_pelanggan.php"><img style="padding-left: 28%; height: 350px; width: 610px;" src="images/sembako.jpg"></a>
  <div class="navigasi">
      <a href="halaman_pelanggan.php">Home</a>
      <a href="keranjang.php">Keranjang</a>
    </div>
    <div class="profile">
    <center>
      <img src="images/account.png">
      <?php
      $username = $_SESSION['username'];
      $tgl = date("d-m-Y");
      $sql = mysqli_query($koneksi,"select * from customer where username='$username'");
      while($data = mysqli_fetch_array($sql)){
      ?>
      <h2><?php echo $data['nama']; ?></h2>
      <h3>Customer</h3>
      <a href="edit_user.php?username=<?php echo $data['username']; ?>" class="btn-edit">Edit</a>
      <a href="logout.php" class="btn-logout">Logout</a>
    <?php } ?>
      <hr>
      <h3 style="color: green">Tanggal : <?php echo $tgl; ?></h3>
    </div>
    <div class="isi">
    <?php 
    $no=1;
    $data = mysqli_query($koneksi,"SELECT * FROM laporan ORDER BY id DESC LIMIT 1") ;
    while ($d = mysqli_fetch_array($data)) {
    ?>
    Transaksi Berhasil, Klik <a href="view-transaction.php?id_beli=<?php echo $d['id_beli']; ?>">Disini</a> Untuk Melihat Data
  <?php } ?>
    </div>
    <div class="footer" style="color: white;">&copyCopyright 2022</div>
  <?php } ?>
    
</body>
</html>