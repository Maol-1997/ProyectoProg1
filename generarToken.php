<?php
include("myconnection.php");
if(!empty($_POST['usuario']) && !empty($_POST['clave'])) { // GENERAR TOKEN
    $time_pre = microtime(true);
    $user = $_POST['usuario']; // usuario
    $pass = hash('sha256', $_POST['usuario'] . $_POST['clave']); // clave
    $token = hash('sha256', $_POST['usuario'] . $_POST['clave'] . date('Y-m-d H:i:s')); // token generado
    $sql = "SELECT * FROM usuario WHERE usuario = '".$user."' AND clave = '".$pass."'";
    $ejecucionSQL = $conexion->prepare($sql);
    $ejecucionSQL->execute();
    $res = $ejecucionSQL->fetchAll();
    $count = $ejecucionSQL->rowCount();
    foreach ($res as $rs) {
        if ($count > 0) {
            $sql = "UPDATE `transporte`.`usuario` SET `token` = '".$token."' WHERE `id` = '".$rs['id']."';";
            $ejecucionSQL = $conexion->prepare($sql);
            $ejecucionSQL->execute();
            echo $token;
        }
    }
    $time_post = microtime(true);
    $time = $time_post - $time_pre;
    $time = $time*pow(10,3);
    $sql = "INSERT INTO `transporte`.`auditoria` (`fecha_acceso`, `user`, `response_time`, `endpoint`) VALUES ('" . date('Y-m-d H:i:s') . "', '" . $user . "', '" . $time . "', 'generarToken');";
    $ejecucionSQL = $conexion->prepare($sql);
    $ejecucionSQL->execute();
}