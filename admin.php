<?php
session_start();
include("myconnection.php");
if(!empty($_POST['logout'])) {
    session_destroy();
    header('Location: admin.php');
}
if(!empty($_POST['volver']))
    header('Location: admin.php');
if(empty($_POST['pass']) && empty($_SESSION['logeado'])) {?>
    <head></head>
    <html>
    <body>
<form method="POST" action="admin.php">
    <p>Ingrese contraseña de administracion: </p>

    <input type="password" name="pass">
    <input type="submit">
</form>
</body>
</html><?php
}else if(empty($_SESSION['logeado'])){
    $pass = hash('sha256', strtoupper($_POST['pass'] . "adminxd")); // clave
    $sql = "SELECT * FROM admin WHERE pass = '" . $pass . "'";
    $ejecucionSQL = $conexion->prepare($sql);
    $ejecucionSQL->execute();
    $count = $ejecucionSQL->rowCount();
    if ($count > 0) {
        $_SESSION['logeado'] = 1;
    }else
        header('Location: admin.php');
}
if(!empty($_SESSION['logeado'])) {
    if (empty($_POST['opcion'])) {
        ?>
        <form method="POST" action="admin.php">
            <input type="hidden" name="opcion" value="Usuarios">
            <input value="Usuarios" type="submit">
        </form>
        <form method="POST" action="admin.php">
            <input type="hidden" name="opcion" value="MostrarRegistrosDeAuditoria">
            <input value="Mostrar registros de auditoria" type="submit">
        </form>
        <form method="POST" action="admin.php">
            <input type="hidden" name="opcion" value="ArchivoDeAuditoria">
            <input value="Archivo de auditoria" type="submit">
        </form>
        <form method="POST" action="admin.php">
            <input type="hidden" name="logout" value="1">
            <input value="logout" type="submit">
        </form>
        <?php
    }else
                if($_POST['opcion'] == "Usuarios") {
                ?>
                <form method="POST">
                    <input type="hidden" name="opcion" value="listarUsuarios">
                    <input value="listarUsuarios" type="submit">
                </form>
                <form method="POST">
                    <input type="hidden" name="opcion" value="agregarUsuario">
                    <input value="agregarUsuario" type="submit">
                </form>
                <form method="POST">
                    <input type="hidden" name="opcion" value="borrarUsuario">
                    <input value="borrarUsuario" type="submit">
                </form>
                <form method="POST">
                    <input type="hidden" name="opcion" value="editarUsuario">
                    <input value="editarUsuario" type="submit">
                </form>
                <?php
    }else
    if($_POST['opcion'] == "listarUsuarios") {
        $sql = "SELECT * from usuario";
        $ejecucionSQL = $conexion->prepare($sql);
        $ejecucionSQL->execute();
        $res = $ejecucionSQL->fetchAll();
        $count = $ejecucionSQL->rowCount();
        if ($count > 0) {
            ?>
<table style="width:100%" border="1px solid black">
    <tr>
        <th>ID</th>
        <th>Usuario</th>
        <th>Clave</th>
        <th>Token</th>
    </tr>
    <?php
            foreach ($res as $rs) {
                echo "<tr>";
                echo "<td>".$rs["id"]."</td>";
                echo "<td>".$rs["usuario"]."</td>";
                echo "<td>".$rs["clave"]."</td>";
                echo "<td>".$rs["token"]."</td>";
                echo "</tr>";
            } ?>
</table>
<?php
        }
    }else
    if($_POST['opcion'] == "agregarUsuario") {
        ?>
        <form method="POST" action="admin.php">
            <p>Usuario: </p>
            <input type="text" name="usuario">
            <p>Clave: </p>
            <input type="password" name="clave">
            <input type="hidden" name="opcion" value="agregarUsuario">
            <br><br>
            <input type="submit">
        </form>
        <?php
        $sql ="";
        $ejecucionSQL="";
        if(!empty($_POST['usuario'])) {
            $sql = "INSERT INTO `transporte`.`usuario` (`usuario`, `clave`, `token`) VALUES ('" . $_POST['usuario'] . "', '" . hash('sha256',$_POST['usuario'].$_POST['clave']) . "', '" . hash('sha256', $_POST['usuario'] . $_POST['clave'] . date('Y-m-d H:i:s')) . "');";
            $ejecucionSQL = $conexion->prepare($sql);
            $ejecucionSQL->execute();
            echo "<h4>Se ha creado el usuario " . $_POST['usuario'] . "</h4>";
        }
    }else
        if($_POST['opcion'] == "borrarUsuario"){?>
            <form method="POST" action="admin.php">
                <p>Ingrese el ID del usuario a eliminar: </p>
                <input type="text" name="idborrar">
                <input type="hidden" name="opcion" value="borrarUsuario">
                <br><br>
                <input type="submit">
            </form>
        <?php
            $sql ="";
            $ejecucionSQL="";
        if (!empty($_POST['idborrar'])){
            $sql = "DELETE FROM `transporte`.`usuario` WHERE `id` = '".$_POST['idborrar']."';";
            $ejecucionSQL = $conexion->prepare($sql);
            $ejecucionSQL->execute();
            echo "<h4>Se ha borrado el usuario con id " . $_POST['idborrar'] . "</h4>";
        }
    }else
        if($_POST['opcion'] == "editarUsuario") {
            if(!empty($_POST['editarUsuarioOK'])) {
                $sql = "UPDATE `transporte`.`usuario` SET `usuario` = '".$_POST['usuario']."' , `clave` = '".hash('sha256',$_POST['usuario'].$_POST['clave'])."' WHERE `id` = '".$_POST['lista']."';";
                $ejecucionSQL = $conexion->prepare($sql);
                $ejecucionSQL->execute();
            }
            $sql = "SELECT * FROM `transporte`.`usuario`";
            $ejecucionSQL = $conexion->prepare($sql);
            $ejecucionSQL->execute();
            $res = $ejecucionSQL->fetchAll();
            ?>
            <form method="POST" action="admin.php">
            <select name="lista">
                <?php
                foreach ($res as $rs) {
                    ?>
                    <option value="<?php echo $rs["id"]; ?>"><?php echo $rs["id"] . " " . $rs["usuario"]; ?></option>
                    <?php
                } ?>
            </select>
            <input type="hidden" name="opcion" value="editarUsuario">
            <input type="submit" value="editar">
            </form><?php
            foreach ($res as $rs) {
                if (!empty($_POST['lista'])) {
                    if ($_POST['lista'] == $rs['id']) {
                        echo "<form method='POST' action='admin.php'>";
                        echo "<input type='text' name='usuario' placeholder='" . $rs['usuario'] . "'>";
                        echo "<input type='password' name='clave' placeholder='clave'>";
                        echo "<input type='hidden' name='opcion' value='editarUsuario'>";
                        echo "<input type='hidden' name='editarUsuarioOK' value='editarUsuarioOK'>";
                        echo "<input type='hidden' name='lista' value='".$_POST['lista']."'>";
                        echo "<input type='submit' value='OK'>";
                        echo "</form>";
                    }
                }

            }
        } else
        if($_POST["opcion"] == "MostrarRegistrosDeAuditoria") {
            $sql = "SELECT * FROM auditoria";
            $ejecucionSQL = $conexion->prepare($sql);
            $ejecucionSQL->execute();
            $res = $ejecucionSQL->fetchAll();
            ?>
            <table style="width:100%" border="1px solid black">
                <tr>
                    <th>ID</th>
                    <th>Fecha de acceso</th>
                    <th>User</th>
                    <th>Response Time</th>
                    <th>Endpoint</th>
                </tr>
                <?php
                foreach ($res as $rs) {
                    echo "<tr>";
                    echo "<td>" . $rs["auditoria_id"] . "</td>";
                    echo "<td>" . $rs["fecha_acceso"] . "</td>";
                    echo "<td>" . $rs["user"] . "</td>";
                    echo "<td>" . $rs["response_time"] . "</td>";
                    echo "<td>" . $rs["endpoint"] . "</td>";
                    echo "</tr>";
                } ?>
            </table>
            <?php
        }else
            if($_POST["opcion"] == "ArchivoDeAuditoria") {
                if(empty($_POST["fechaInicio"]) && empty($_POST["fechaFinal"])) {?>
                    <form method='POST' action="admin.php">
                        Desde <input type='date' name='fechaInicio'>
                        <br>
                        Hasta <input type='date' name='fechaFinal'>
                        <br>
                        <input type="hidden" name="opcion" value="ArchivoDeAuditoria">
                        <input type="submit" value="enviar">
                    </form>
                    <?php
                } else {
                    $file = fopen("auditoria.txt", "c+");
                    $escribir = false;
                    $contenido = "";
                    $sql = "SELECT * FROM auditoria";
                    $ejecucionSQL = $conexion->prepare($sql);
                    $ejecucionSQL->execute();
                    $res = $ejecucionSQL->fetchAll();
                    foreach ($res as $rs) {
                        $fecha = explode(" ", $rs["fecha_acceso"]);
                        if($fecha[0] == $_POST["fechaInicio"]) {
                            $escribir = true;
                        }
                        $contenido = $contenido.$rs["auditoria_id"].",".$rs["fecha_acceso"].",".$rs["user"].",".$rs["response_time"].",".$rs["endpoint"]."\r\n";
                        if($fecha[0] == $_POST["fechaFinal"]) {
                            $escribir = false;
                        }
                    }
                    file_put_contents("auditoria.txt", $contenido);
                    $_POST["opcion"] = "";
                    header ("Content-Disposition: attachment; filename=auditoria.txt");
                    header ("Content-Type: application/octet-stream");
                    readfile("auditoria.txt");
                }
            }

}if( !empty($_POST['opcion']) && !empty($_SESSION['logeado'])){?>
<form method="POST">
                <input type="hidden" name="volver" value="1">
                <input value="Volver" type="submit">
            </form>
<?php
}