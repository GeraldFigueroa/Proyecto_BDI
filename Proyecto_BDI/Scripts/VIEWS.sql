
USE ProyectoBDI;

/* Ventas por sucursal al mes */
	CREATE VIEW vw_Ventas_Sucursal
	AS
		(
			SELECT fch_compra, SucursalID, COUNT(SucursalID) AS Ventas FROM Compra 
			WHERE fch_compra BETWEEN CAST('01/04/2022' AS DATE) AND CAST('30/04/2022' AS DATE)
			GROUP BY SucursalID, fch_compra 
		);

		SELECT * FROM vw_Ventas_Sucursal;

/* Producos por producto al mes*/
	CREATE VIEW vw_Ventas_Producto
	AS
		(
			SELECT Producto.ProductoID, nombre, precio_venta, COUNT(DP.ProductoID) AS Ventas  
			FROM Producto INNER JOIN DetalleCompra DP
			ON DP.ProductoID = Producto.ProductoID
			GROUP BY Producto.ProductoID, nombre, precio_venta, DP.ProductoID
		)
	;
	
	SELECT * FROM vw_Ventas_Producto;


/* Ventas por categoria */
	CREATE VIEW vw_Ventas_Categoria
	AS
		(
			SELECT Categoria.nombre, COUNT(Categoria.nombre) AS Productos 
			FROM Categoria INNER JOIN Producto P
			ON p.CategoriaID = Categoria.CategoriaID 
			INNER JOIN DetalleCompra DC
			ON DC.ProductoID = P.ProductoID
			GROUP BY Categoria.nombre
		)
	;

	SELECT * FROM vw_Ventas_Categoria;


/* Productos con menos de 10 unidades por sucursal */
	CREATE VIEW vw_Productos_LowStock
	AS
		(
			SELECT P.ProductoID, P.nombre, S.SucursalID, I.cantidad
			FROM Producto P INNER JOIN Inventario I
			ON P.ProductoID = I.ProductoID INNER JOIN Sucursal S
			ON S.SucursalID = I.SucursalID
			WHERE I.cantidad <= 5 
		)
	;

	SELECT * FROM vw_Productos_LowStock;

/* Clientes que no han realizado pedidos por mes */
	CREATE VIEW vw_Clientes_Sin_Compras
	AS
		(
			SELECT * FROM Cliente 
			WHERE
				Cliente.Identidad NOT IN (
				SELECT C.Identidad 
				FROM Compra C 
				WHERE C.fch_compra BETWEEN CAST('01/04/2022' AS DATE) AND CAST('30/04/2022' AS DATE)
				GROUP BY C.Identidad) 
		)
	;

	SELECT * FROM vw_Clientes_Sin_Compras;