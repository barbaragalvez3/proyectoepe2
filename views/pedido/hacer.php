<?php if(isset($_SESSION['identity'])):?>
    <h1>Hacer Pedido</h1>
    <p>
        <a href="<?=base_url?>carrito/index">Ver los productos y el precio del pedido</a>
    </p>
    <br>

    <h3>Dirección para el envio:</h3>
    <form action="<?=base_url?>pedido/add" method="post">
        <label for="region">region</label>
        <input type="text" name="region" required>

        <label for="comuna">comuna</label>
        <input type="text" name="comuna" required>

        <label for="direccion">Dirección</label>
        <input type="text" name="direccion" required>

        <input type="submit" value="Confirmar pedido">
    </form>
<?php else: ?>
    <h1>Necesitas estar identificado</h1>
    <p>Necesitas estar logueado en la web para poder realizar tu Pedido</p>
<?php endif; ?>