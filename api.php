<?php
if(!empty($_POST['user']) && !empty($_POST['pass'])) { // GENERAR TOKEN
    include("myconnection.php");
    $user = $_POST['user']; // usuario
    $pass = hash('sha256', strtoupper($_POST['user'] . $_POST['pass'])); // clave
    $token = hash('sha256', strtoupper($_POST['user'] . $_POST['pass'] . date('Y-m-d H:i:s'))); // token generado
    $params = array('usuario' => $user, 'clave' => $pass);
    $sql = "SELECT * FROM usuario WHERE usuario = :usuario AND clave = :clave";
    $ejecucionSQL = $conexion->prepare($sql);
    $ejecucionSQL->execute($params);
    $res = $ejecucionSQL->fetchAll();
    $count = $ejecucionSQL->rowCount();
    if ($count > 0) {
        $sql = "UPDATE `programacion1`.`usuario` SET `token` = '".$token."' WHERE `usuario` = '".$user."' AND `clave` = '".$pass."'; ";
        $ejecucionSQL = $conexion->prepare($sql);
        $ejecucionSQL->execute();
        echo "El token generado es: ".$token;
    exit;
    }
}
