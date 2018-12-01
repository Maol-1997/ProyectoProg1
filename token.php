<?php
include("myconnection.php");
function token($a){
    global $conexion;
    $sql = "SELECT * FROM usuario WHERE token = '".$a."'";
    $ejecucionSQL = $conexion->prepare($sql);
    $ejecucionSQL->execute();
    $res = $ejecucionSQL->fetchAll();
    $count = $ejecucionSQL->rowCount();
    if($count > 0) {
        foreach ($res as $rs) {
            return $rs['usuario'];
        }
    }
    return false;
}