<?php
include("myconnection.php");
include("token.php");
$data = json_decode(file_get_contents("php://input"),true);
if(token($data["token"]) != false) {
    $time_pre = microtime(true);

    if (isset($data["apellido"])) {
        $sql = "UPDATE `transporte`.`chofer` SET `apellido` = '" . $data["apellido"] . "' WHERE `chofer_id` = '" . $data["chofer_id"] . "';";
        $ejecucionSQL = $conexion->prepare($sql);
        $ejecucionSQL->execute();
    }

    if (isset($data["nombre"])) {
        $sql = "UPDATE `transporte`.`chofer` SET `nombre` = '" . $data["nombre"] . "' WHERE `chofer_id` = '" . $data["chofer_id"] . "';";
        $ejecucionSQL = $conexion->prepare($sql);
        $ejecucionSQL->execute();
    }

    if (isset($data["documento"])) {
        $sql = "UPDATE `transporte`.`chofer` SET `documento` = '" . $data["documento"] . "' WHERE `chofer_id` = '" . $data["chofer_id"] . "';";
        $ejecucionSQL = $conexion->prepare($sql);
        $ejecucionSQL->execute();
    }

    if (isset($data["email"])) {
        $sql = "UPDATE `transporte`.`chofer` SET `email` = '" . $data["email"] . "' WHERE `chofer_id` = '" . $data["chofer_id"] . "';";
        $ejecucionSQL = $conexion->prepare($sql);
        $ejecucionSQL->execute();
    }

    if (isset($data["vehiculo_id"])) {
        $sql = "UPDATE `transporte`.`chofer` SET `vehiculo_id` = '" . $data["vehiculo_id"] . "' WHERE `chofer_id` = '" . $data["chofer_id"] . "';";
        $ejecucionSQL = $conexion->prepare($sql);
        $ejecucionSQL->execute();
    }

    if (isset($data["sistema_id"])) {
        $sql = "UPDATE `transporte`.`chofer` SET `sistema_id` = '" . $data["sistema_id"] . "' WHERE `chofer_id` = '" . $data["chofer_id"] . "';";
        $ejecucionSQL = $conexion->prepare($sql);
        $ejecucionSQL->execute();
    }

    $time_post = microtime(true);
    $time = $time_post - $time_pre;

    $sql = "INSERT INTO `transporte`.`auditoria` (`fecha_acceso`, `user`, `response_time`, `endpoint`) VALUES ('".date('Y-m-d H:i:s')."', '".token($data["token"])."', '".$time."', 'asd');";
    $ejecucionSQL = $conexion->prepare($sql);
    $ejecucionSQL->execute();
}