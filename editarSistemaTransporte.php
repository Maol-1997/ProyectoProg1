<?php
include("myconnection.php");
include("token.php");
$data = json_decode(file_get_contents("php://input"),true);
if(token($data["token"]) != false) {
    $time_pre = microtime(true);

    if (isset($data["nombre"])) {
        $sql = "UPDATE `transporte`.`sistema_transporte` SET `nombre` = '" . $data["nombre"] . "' WHERE `" . $data["sistema_id"] . "` = '1';";
        $ejecucionSQL = $conexion->prepare($sql);
        $ejecucionSQL->execute();
    }

    if (isset($data["pais_procedencia"])) {
        $sql = "UPDATE `transporte`.`sistema_transporte` SET `nombre` = '" . $data["pais_procedencia"] . "' WHERE `" . $data["sistema_id"] . "` = '1';";
        $ejecucionSQL = $conexion->prepare($sql);
        $ejecucionSQL->execute();
    }

    $time_post = microtime(true);
    $time = $time_post - $time_pre;

    $sql = "INSERT INTO `transporte`.`auditoria` (`fecha_acceso`, `user`, `response_time`, `endpoint`) VALUES ('".date('Y-m-d H:i:s')."', '".token($data["token"])."', '".$time."', 'asd');";
    $ejecucionSQL = $conexion->prepare($sql);
    $ejecucionSQL->execute();
}