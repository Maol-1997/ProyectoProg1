<?php
include("myconnection.php");
include("token.php");

if(token($data["token"]) != false) {
    $time_pre = microtime(true);
    $sql = "SELECT * FROM usuario";
    $stmt = $conexion->prepare($sql);
    $stmt->execute();

    $choferes = array();

    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {

        $choferes['Choferes'][] = $row;

    }

    echo json_encode($choferes);

    $time_post = microtime(true);
    $time = $time_post - $time_pre;

    $sql = "INSERT INTO `transporte`.`auditoria` (`fecha_acceso`, `user`, `response_time`, `endpoint`) VALUES ('".date('Y-m-d H:i:s')."', '".token($data["token"])."', '".$time."', 'asd');";
    $ejecucionSQL = $conexion->prepare($sql);
    $ejecucionSQL->execute();
}