
USE ProyectoBDI;

/* Edad promedio de los clientes */
	SELECT AVG(DATEDIFF(yy, fch_nacimiento, GETDATE())) AS PromedioEdad FROM Cliente;

/* 10 Productos màs vendidos */
	SELECT TOP(10) Producto.ProductoID, Producto.nombre, COUNT(*) as Ventas
	fROM Producto
	INNER JOIN DetalleCompra dc
	ON dc.ProductoID = Producto.ProductoID
	GROUP BY Producto.ProductoID, Producto.nombre
	ORDER BY Ventas DESC
	;

/* Cantidad de productos por categoria */
	SELECT Categoria.nombre, COUNT(Categoria.nombre) AS NoProductos
	FROM Categoria
	INNER JOIN Producto
	ON Producto.CategoriaID = Categoria.CategoriaID
	GROUP BY Categoria.nombre
	;

/* Listar los productos mas bajos en ventas */
	SELECT TOP(10) Producto.ProductoID, Producto.nombre, COUNT(*) as Ventas
	fROM Producto
	INNER JOIN DetalleCompra dc
	ON dc.ProductoID = Producto.ProductoID
	GROUP BY Producto.ProductoID, Producto.nombre
	ORDER BY Ventas ASC
	;

/* Productos agrupados por categoria */
	SELECT Producto.nombre, C.nombre
	FROM Producto INNER JOIN Categoria C
	ON C.CategoriaID = Producto.CategoriaID
	GROUP BY C.nombre ,Producto.nombre;
	