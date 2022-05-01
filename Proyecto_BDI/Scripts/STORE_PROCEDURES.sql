USE ProyectoBDI;

/*	Busqueda de cliente por nombre */
	DROP PROCEDURE sp_BuscarCliente;
	CREATE PROCEDURE sp_BuscarCliente @nombreCliente VARCHAR(30), @idCliente CHAR(13) OUTPUT
	AS
		BEGIN
			SELECT @idCliente = '0000000000000';
			SELECT @idCliente = Cliente.Identidad 
			FROM Cliente
			WHERE Cliente.nombre LIKE '%' + @nombreCliente + '%';	
		END
	;

	DECLARE @idCliente CHAR(13);

	EXECUTE sp_BuscarCliente 'Mario', @idCliente OUTPUT;
		PRINT(@idCliente);

	SELECT * fROM Cliente;

/* Eliminar Clientes por ID */
	DROP PROCEDURE sp_EliminarCliente;
	CREATE PROCEDURE sp_EliminarCliente @idCliente CHAR(13)
	AS
		BEGIN
			DELETE FROM Cliente WHERE Cliente.Identidad = @idCliente;
		END
	;

	SELECT * FROM Cliente;

	EXECUTE sp_EliminarCliente '1405200215975';

	SELECT * FROM Cliente;


/* Actualizar Clientes por ID */
	DROP PROCEDURE sp_ActualizarCliente;
	CREATE PROCEDURE sp_ActualizarCliente 
		@idCliente CHAR(13),
		@celularCliente CHAR(8),
		@fijoCliente CHAR(8),
		@correoCliente VARCHAR(25),
		@usuarioCliente VARCHAR(25),
		@contraCliente VARCHAR(35)
	AS
		BEGIN 
			UPDATE Cliente 
			SET tel_celular = @celularCliente,
				tel_fijo = @fijoCliente,
				correo = @correoCliente,
				usuario = @usuarioCliente,
				contrasenia = @contraCliente
			FROM Cliente
			WHERE Cliente.Identidad = @idCliente
		END
	;

	EXECUTE sp_ActualizarCliente 
		'0801199804256', 
		'32975555', 
		'22222222', 
		'mario@mail.com', 
		'MarioM', 
		'Contra59';

		SELECT * FROM Cliente;


/* Pedidos realizados por cliente */
	DROP PROCEDURE sp_PedidosCliente;
	CREATE PROCEDURE sp_PedidosCliente @idCliente CHAR(13)
	AS
		(
			SELECT * FROM Compra C
			WHERE C.Identidad = @idCliente
		)
	;

	EXECUTE sp_PedidosCliente '0801199804256';

/* Total de ventas de un producto en una fecha determinada */
	DROP PROCEDURE sp_ProductosPorFecha;
	CREATE PROCEDURE sp_ProductosPorFecha @idProducto INT, @fecha DATE
	AS
		(
			SELECT P.nombre, COUNT(P.ProductoID) AS NoVentas
			FROM Producto P INNER JOIN DetalleCompra DC
			ON P.ProductoID = DC.ProductoID INNER JOIN Compra C
			ON C.CompraID = DC.CompraID
			WHERE P.ProductoID = @idProducto AND C.fch_compra = @fecha
			GROUP BY P.nombre, P.ProductoID
		)
	;

	EXECUTE sp_ProductosPorFecha 1, '20220430';
