CREATE DATABASE ProyectoBDI;

USE ProyectoBDI;

/* Tabla Direccion (de un cliente)*/
CREATE TABLE Direccion (	
	DireccionID INT PRIMARY KEY IDENTITY(1,1),
	colonia VARCHAR(50) NOT NULL,
	bloque VARCHAR(10),
	calle VARCHAR(20),
	num_casa VARCHAR(10) NOT NULL,
	descripcion TEXT
);


/* Tabla Cliente */
CREATE TABLE Cliente (
	Identidad CHAR(13) PRIMARY KEY,
	DireccionID INT FOREIGN KEY REFERENCES Direccion(DireccionID),
	nombre VARCHAR(30) NOT NULL,
	tel_celular CHAR(8) NOT NULL,
	tel_fijo CHAR(8),
	fch_nacimiento DATE NOT NULL,
	correo VARCHAR(25) NOT NULL,
	usuario VARCHAR(25) NOT NULL,
	contrasenia VARCHAR(35) NOT NULL
);


/* Tabla Categoria (de un producto)*/
CREATE TABLE Categoria (
	CategoriaID TINYINT PRIMARY KEY IDENTITY(1,1),
	nombre VARCHAR(25) NOT NULL
);


/* Tabla Producto */
CREATE TABLE Producto (
	ProductoID INT PRIMARY KEY IDENTITY(1,1),
	CategoriaID TINYINT FOREIGN KEY REFERENCES Categoria(CategoriaID),
	nombre VARCHAR(35) NOT NULL,
	precio_venta MONEY NOT NULL,
	descripcion TEXT,
	foto VARBINARY(MAX)
);


/* Tabla Proveedor */
/* Tipo Proveedor */
CREATE TABLE Proveedor (
	ProveedorID SMALLINT PRIMARY KEY IDENTITY(1,1),
	nombre VARCHAR(35) NOT NULL,
	telefono CHAR(8) NOT NULL, 
	descripcion TEXT
);


/* Tabla Sucursal */
CREATE TABLE Sucursal (
	SucursalID TINYINT PRIMARY KEY IDENTITY(1,1),
	descipcion TEXT,
	ubicacion TEXT NOT NULL
);


/* Tabla Inventario */
CREATE TABLE Inventario (
	ProductoID INT FOREIGN KEY REFERENCES Producto(ProductoID),
	SucursalID TINYINT FOREIGN KEY REFERENCES Sucursal(SucursalID),
	cantidad SMALLINT NOT NULL,
	PRIMARY KEY(ProductoID, SucursalID)
);


/* Table DetalleProveedor */
CREATE TABLE DetalleProveedor (
	DetalleID INT PRIMARY KEY IDENTITY(1,1),
	ProductoID INT FOREIGN KEY REFERENCES Producto(ProductoID),
	SucursalID TINYINT FOREIGN KEY REFERENCES Sucursal(SucursalID),
	ProveedorID SMALLINT FOREIGN KEY REFERENCES Proveedor(ProveedorID),
	cantidad SMALLINT NOT NULL,
	precio_compra MONEY NOT NULL,
	fecha DATE NOT NULL
);


/* Tabla Promocion */
CREATE TABLE Promocion(
	PromocionID SMALLINT PRIMARY KEY IDENTITY(1,1),
	fch_inicio DATE NOT NULL,
	fch_fin DATE NOT NULL,
	descuento FLOAT(5) NOT NULL,
	estado BIT DEFAULT 1
);


/* Tabla Compra */
CREATE TABLE Compra (
	CompraID INT PRIMARY KEY IDENTITY(1,1),
	Identidad CHAR(13) FOREIGN KEY REFERENCES Cliente(Identidad),
	SucursalID TINYINT FOREIGN KEY REFERENCES Sucursal(SucursalID),
	PromocionID SMALLINT FOREIGN KEY REFERENCES Promocion(PromocionID),
	fch_compra DATE NOT NULL,
	total MONEY NOT NULL
);


/* Tabla DetalleCompra */
CREATE TABLE DetalleCompra (
	CompraID INT FOREIGN KEY REFERENCES Compra(CompraID),
	ProductoID INT FOREIGN KEY REFERENCES Producto(ProductoID),
	cantidad SMALLINT NOT NULL,
	PRIMARY KEY(CompraID, ProductoID)
);
