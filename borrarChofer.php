<?php
include("myconnection.php");
include("token.php");
$data = json_decode(file_get_contents("php://input"),true);
if(token($data["token"]) != false) {
    $time_pre = microtime(true);

<<<<<<< HEAD:borrarchofer.php
    $sql = "DELETE FROM `transporte`.`chofer` WHERE `chofer_id` = '" . $data["chofer_id"] . "';";
    $ejecucionSQL = $conexion->prepare($sql);
    $ejecucionSQL->execute();

    $time_post = microtime(true);
    $time = $time_post - $time_pre;

    $sql = "INSERT INTO `transporte`.`auditoria` (`fecha_acceso`, `user`, `response_time`, `endpoint`) VALUES ('".date('Y-m-d H:i:s')."', '".token($data["token"])."', '".$time."', 'asd');";
    $ejecucionSQL = $conexion->prepare($sql);
    $ejecucionSQL->execute();
}
=======
$sql = "DELETE FROM `transporte`.`chofer` WHERE `chofer_id` = '".$data["chofer_id"]."';";
$ejecucionSQL = $conexion->prepare($sql);
$ejecucionSQL->execute();
>>>>>>> a83a6ce346fe9db25e6bd1f2c7ba99a8266055ba:borrarChofer.php
