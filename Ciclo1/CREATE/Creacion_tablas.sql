CREATE TABLE Personas (
    idPersona VARCHAR(9) NOT NULL,
    nombre VARCHAR2(100) NOT NULL,
    direccion VARCHAR2(200) NOT NULL,
    telefono VARCHAR2(20) NOT NULL,
    email VARCHAR2(100) NOT NULL,
    tipoPersona VARCHAR2(20) NOT NULL,
    numeroIdentificacion VARCHAR2(50) NOT NULL,
    pais VARCHAR2(50) NOT NULL,
    fechaRegistro DATE NOT NULL
);

CREATE TABLE Compradores (
    idPersona VARCHAR(9) NOT NULL,
    facturaDeCompra VARCHAR(500)
);

CREATE TABLE Vendedores (
    idPersona VARCHAR(9) NOT NULL,
    esConcecionario VARCHAR(2) NOT NULL,
    nombreConcecionario VARCHAR(200),
    documentosPropiedad VARCHAR(500) NOT NULL
);

CREATE TABLE Talleres (
    idTaller VARCHAR(9) NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    direccion VARCHAR(200) NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    encargado VARCHAR(100) NOT NULL,
    especialidad VARCHAR(200) NOT NULL
);

CREATE TABLE Homologaciones (
    idHomologacion VARCHAR(9) NOT NULL,
    idAuto VARCHAR(9) NOT NULL,
    fechaHomologaciones DATE NOT NULL,
    entidadHomologadora VARCHAR(100) NOT NULL,
    certificado VARCHAR(200) NOT NULL,
    fechaSolicitud DATE NOT NULL,
    fechaAprobacion DATE NOT NULL,
    fechaVigenciaHasta DATE NOT NULL
);

CREATE TABLE Compras (
    idCompra VARCHAR(9) NOT NULL,
    idProveedor VARCHAR(9) NOT NULL,
    idComprador VARCHAR(9) NOT NULL,
    idPedido VARCHAR(9),
    idPieza VARCHAR(9),
    fechaCompra DATE NOT NULL,
    precioCompra NUMBER(15,2),
    formaPago VARCHAR(20) NOT NULL,
    estadoPago VARCHAR(20) NOT NULL,
    fechaEntrega DATE
);

CREATE TABLE Facturas (
    idFactura VARCHAR(9) NOT NULL,
    fechaFactura DATE NOT NULL,
    idCompra VARCHAR(9)
);

CREATE TABLE Importaciones (
    idImportacion VARCHAR(9) NOT NULL,
    fechaSalida DATE,
    fechaLlegada DATE,
    puertoSalida VARCHAR(100),
    puertoLlegada VARCHAR(100),
    nombreBuqueAvion VARCHAR(100),
    numeroContenedor VARCHAR(50),
    estadoImportacion VARCHAR(50)
);

CREATE TABLE Automoviles (
    idAutomovil VARCHAR(9) NOT NULL,
    idVendedor VARCHAR(9) NOT NULL,
    idImportacion VARCHAR(9) NOT NULL,
    idPieza VARCHAR(9) NOT NULL,
    marca VARCHAR(50) NOT NULL,
    modelo VARCHAR(50) NOT NULL,
    año NUMBER(4) NOT NULL,
    numeroChasis VARCHAR(50) NOT NULL,
    placa VARCHAR(20) NOT NULL,
    color VARCHAR(30) NOT NULL,
    cilindraje VARCHAR(20) NOT NULL,
    tipoCombustible VARCHAR(30) NOT NULL,
    precioCompra NUMBER(15,2) NOT NULL,
    precioVenta NUMBER(15,2) NOT NULL,
    estado VARCHAR2(30) NOT NULL,
    papelesEnTramite VARCHAR(3) NOT NULL,
    paisDeOrigen VARCHAR(50) NOT NULL,
    cantidad NUMBER NOT NULL,
    paisDeEnsamblaje VARCHAR(50) NOT NULL,
    motor VARCHAR(100) NOT NULL,
    modificaciones VARCHAR(500) NOT NULL,
    facturaAutomovil VARCHAR(200) NOT NULL,
    garantiaAutomovil VARCHAR(20) NOT NULL
);

CREATE TABLE Proveedores (
    idProveedor VARCHAR(9) NOT NULL,
    nombreProveedor VARCHAR(100) NOT NULL,
    pais VARCHAR(50) NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    email VARCHAR(100) NOT NULL,
    direccion VARCHAR(200) NOT NULL,
    tipoProveedor VARCHAR(50) NOT NULL,
    calificacion NUMBER(2,1) NOT NULL,
    fechaRegistro DATE NOT NULL
);

CREATE TABLE Pedidos (
    idPedido VARCHAR(9) NOT NULL,
    idProveedor VARCHAR(9) NOT NULL,
    fechaPedido DATE NOT NULL,
    fechaEntregaEstimada DATE NOT NULL,
    estadoPedido VARCHAR(50) NOT NULL,
    montoPedido NUMBER(15,2) NOT NULL,
    descripcionPedido VARCHAR(500) NOT NULL,
    documentosAsociados VARCHAR2(500) NOT NULL,
    costoEnvio NUMBER(15,2),
);

CREATE TABLE TramitesAduanas (
    idTramite VARCHAR(9) NOT NULL,
    idImportacion VARCHAR(9) NOT NULL,
    idPedido VARCHAR(9) NOT NULL,
    fechaInicio DATE NOT NULL,
    fechaFin DATE NOT NULL,
    estado VARCHAR(50) NOT NULL,
    observaciones VARCHAR(500) NOT NULL,
    documentosAsociados VARCHAR(500) NOT NULL
);

CREATE TABLE Piezas (
    idPieza VARCHAR(9) NOT NULL,
    idProveedor VARCHAR(9) NOT NULL,
    idCompra VARCHAR(9) NOT NULL,
    nombrePieza VARCHAR(100) NOT NULL,
    descripcion VARCHAR(500) NOT NULL,
    fabricadorPieza VARCHAR(100) NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    precioPieza NUMBER(15,2) NOT NULL,
    estadoDePieza VARCHAR2(30) NOT NULL,
    cantidadDePiezas NUMBER NOT NULL,
    garantiaPieza VARCHAR(20) NOT NULL,
    codigoFabrica VARCHAR(100)
);

CREATE TABLE Inventarios (
    idPieza VARCHAR(9) NOT NULL,
    idTaller VARCHAR(9) NOT NULL,
    idBodega VARCHAR(9) NOT NULL,
    cantidadDisponible NUMBER NOT NULL,
    ubicacionSeccionPieza VARCHAR(100) NOT NULL,
    ultimaFechaActualizacion DATE NOT NULL
);

CREATE TABLE HistorialMantenimientos (
    idMantenimiento VARCHAR(9) NOT NULL,
    idAutomovil VARCHAR(9) NOT NULL,
    idTaller VARCHAR(9) NOT NULL,
    fechaMantenimiento DATE NOT NULL,
    tipoMantenimiento VARCHAR(100) NOT NULL,
    descripcion VARCHAR(100) NOT NULL,
    costo NUMBER(15,2),
    piezasUtilizadas VARCHAR(100) NOT NULL,
    mecanico VARCHAR2(100) NOT NULL,
    observaciones VARCHAR2(500) NOT NULL
);

CREATE TABLE Contienen (
    idPedido VARCHAR(9) NOT NULL,
    idPieza VARCHAR(9) NOT NULL
);

-- TABLAS PARA MULTIPLICIDAD (atributos con [0..*] o [1..*])
CREATE TABLE CarrosInteresado (
    idPersona VARCHAR(9) NOT NULL,
    carroInteresado VARCHAR(100) NOT NULL
);

CREATE TABLE PiezasInteresado (
    idPersona VARCHAR(9) NOT NULL,
    piezaInteresado VARCHAR(100) NOT NULL
);

CREATE TABLE CarrosComprados (
    idPersona VARCHAR(9) NOT NULL,
    carroComprado VARCHAR(100) NOT NULL
);

CREATE TABLE CarrosOfrece (
    idPersona VARCHAR(9) NOT NULL,
    carroOfrece VARCHAR(100) NOT NULL
);

CREATE TABLE AutosCompatibles (
    idPieza VARCHAR(9) NOT NULL,
    autoCompatible VARCHAR(100) NOT NULL
);

CREATE TABLE CompraAutos (
    idCompra VARCHAR(9) NOT NULL,
    idAuto VARCHAR(9) NOT NULL
);

CREATE TABLE CompraPiezas (
    idCompra VARCHAR(9) NOT NULL,
    idPieza VARCHAR(9) NOT NULL
);
