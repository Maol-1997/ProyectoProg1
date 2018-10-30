<?php
include("myconnection.php");
if(!empty($_POST['user']) && !empty($_POST['pass'])) { // GENERAR TOKEN
    $user = $_POST['user']; // usuario
    $pass = hash('sha256', strtoupper($_POST['user'] . $_POST['pass'])); // clave
    $token = hash('sha256', strtoupper($_POST['user'] . $_POST['pass'] . date('Y-m-d H:i:s'))); // token generado
    $sql = "SELECT * FROM usuario WHERE usuario = '".$user."' AND clave = '".$pass."'";
    $ejecucionSQL = $conexion->prepare($sql);
    $ejecucionSQL->execute();
    $res = $ejecucionSQL->fetchAll();
    $count = $ejecucionSQL->rowCount();
    if ($count > 0) {
        $sql = "UPDATE `programacion1`.`usuario` SET `token` = '" . $token . "' WHERE `usuario` = '" . $user . "' AND `clave` = '" . $pass . "'; ";
        $ejecucionSQL = $conexion->prepare($sql);
        $ejecucionSQL->execute();
        echo $token;
    }
}

if(!empty($_POST['id'])) { // OBTENER USUARIO JSON
    $sql = "SELECT * FROM usuario WHERE id = ".$_POST['id'];
    $ejecucionSQL = $conexion->prepare($sql);
    $ejecucionSQL->execute();
    $res = $ejecucionSQL->fetchAll();
    $count = $ejecucionSQL->rowCount();
    foreach ($res as $rs) {
        if ($count > 0) {
            $json=new \stdClass();
            $json->id=$rs['id'];
            $json->user=$rs['usuario'];
            $json->pass=$rs['clave'];
            $json->token=$rs['token'];
            echo json_encode($json);
            break;
        }
    }
}