
USE ProyectoBDI;

/* Inserts tabla Direccion */
INSERT INTO Direccion VALUES 
	('Res. El Sauce', 'A', 'Calle Uno', '3', 'Casa Dos plantas, Verde'),
	('Col. El Trapiche', '1B', 'Calle Tres', '5656', ''),
	('Bo. Morazan', 'B', 'Calle Patuca', '1003', ''),
	('Bo. El Centro', '3A', 'Calle Finlay', '56', 'Casa Azul, porton Negro'),
	('Res. Suyapita', 'A', 'Calle Callejas', '28', '');

	SELECT * FROM Direccion;


/* Inserts tabla Cliente */
INSERT INTO Cliente(Identidad, DireccionID, nombre, tel_celular, tel_fijo, fch_nacimiento, correo, usuario, contrasenia) VALUES
	('0801199904366', 3, 'Juan Carlos Peralta', '88888999', '', '20000509', 'mail@mail.com', 'JCPeralta', 'Contra1'),
	('0804200012345', 1, 'Joshua Ramos', '99455258', '', '19900808', 'mail@mail.com', 'JRamos', 'Contra2'),
	('1405200215975', 5, 'Fanny Gomez', '99985555', '', '19990209', 'mail@mail.com', 'FGomez', 'Contra3'),
	('0801199804256', 4, 'Mario Mendoza', '32975555', '', '20021006', 'mail@mail.com', 'MendozaM', 'Contra4'),
	('1305199015462', 2, 'Cristina Barahona', '88888899', '22220405', '20070107', 'mail@mail.com', 'CristiB', 'Contra5');

	SELECT * FROM Cliente;


/* Inserts Tabla Categoria */
INSERT INTO Categoria VALUES
	('Medicamentos'),
	('Cuidado Personal'),
	('Electrodomesticos'),
	('Abarroteria'),
	('Lentes');

	SELECT * FROM Categoria;


/* Inserts Tabla Producto */
INSERT INTO Producto(CategoriaID, nombre, precio_venta, descripcion) VALUES 
	(1, 'Acetaminofen', 150.00 ,'Bote 100ml'),
	(1, 'Gripex', 38.5, 'Unidad'),
	(1, 'Vitaflenaco', 350.99, 'Blister'),
	(1, 'Yodo', 59.99, 'Bote 120ml'),
	(2, 'Jabon Liquido', 130.00, 'Bote 200ml'),
	(2, 'Pasta Dental', 74.55, 'Colgate 100g'),
	(3, 'Audifonos Inhalambricos', 999.99, 'TZUMI T7550'),
	(4, 'Azucar Morena', 50.99, 'Bolsa 1800g'),
	(4, 'Frijoles', 48.50, 'Libra'),
	(5, 'Lentes', 850.00, 'Lentes para lectura');

	SELECT * FROM Producto;

	

/* Inserts Tabla Proveedor */
INSERT INTO Proveedor(nombre, telefono) VALUES 
	('Super Opticas', '2222222'),
	('El Cañal', '88899898'),
	('TZUMI', '55555555'),
	('Colgate', '51515553'),
	('PFIZER', '55556565'),
	('BAYERN', '78789898');

	SELECT * FROM Proveedor;


/* Inserts Tabla Sucursal */
INSERT INTO Sucursal VALUES
	('Barrio El Centro', 'Tegucigalpa'),
	('Mall Premier', 'Tegucigalpa'),
	('Multiplaza', 'Tegucigalpa'),
	('Boulevart Suyapa', 'Tegucigalpa'),
	('Los Castaños', 'Tegucigalpa');
	
	SELECT * FROM Sucursal;


/* Inserts Tabla DetalleProveedor */
INSERT INTO DetalleProveedor VALUES
	(2, 1, 5, 10, 22.00, GETDATE()),
	(1, 2, 6, 20, 100.00, GETDATE()),
	(3, 1, 6, 10, 280.00, GETDATE()),
	(10, 5, 1, 5, 500.00, GETDATE()),
	(7, 5, 3, 5, 850.00, GETDATE());

	SELECT * FROM DetalleProveedor;

/* Inserts Tabla Inventario */
INSERT INTO INVENTARIO VALUES
	(2,1,10),
	(1,2,20),
	(3,1,10),
	(10,5,5),
	(7,5,5);

	SELECT * FROM Inventario;

/* Inserts Tabla Compra */
INSERT INTO Compra(Identidad, SucursalID, fch_compra, total) VALUES
	('0801199904366', 2, GETDATE(), 300.00),
	('0801199804256', 1, GETDATE(), 389.49),
	('1305199015462', 5, GETDATE(), 1849.99),
	('0804200012345', 5, GETDATE(), 209.99);

	SELECT * FROM Compra; 


/* Inserts Tabla Detalle Compra */
INSERT INTO DetalleCompra VALUES
	(1,1,2),
	(2,2,1),
	(2,3,1),
	(3,7,1),
	(3,10,1),
	(4,1,1),
	(4,4,1);
	SELECT * FROM DetalleCompra;