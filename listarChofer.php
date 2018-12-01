<?php
include("myconnection.php");
include("token.php");

if(token($_GET['token']) != false) {
    $time_pre = microtime(true);
    $sql = "SELECT * FROM chofer";
    $stmt = $conexion->prepare($sql);
    $stmt->execute();

    $choferes = array();

    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {

        $choferes['Choferes'][] = $row;

    }

    echo json_encode($choferes);

    $time_post = microtime(true);
    $time = $time_post - $time_pre;
    $time = $time*pow(10,3);

    $sql = "INSERT INTO `transporte`.`auditoria` (`fecha_acceso`, `user`, `response_time`, `endpoint`) VALUES ('".date('Y-m-d H:i:s')."', '".token($_GET['token'])."', '".$time."', 'asd');";
    $ejecucionSQL = $conexion->prepare($sql);
    $ejecucionSQL->execute();
}