<?php 
header("Content-type: application/octet-stream");
header("Content-Disposition: attachment; filename=biaya.xls");//ganti nama sesuai keperluan
header("Pragma: no-cache");
header("Expires: 0");

  session_start();
  error_reporting(0);
  include "../koneksi.php";
?>
