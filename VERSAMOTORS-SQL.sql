-- ELIMINACIÓN DE TABLAS

DROP TABLE Facturas CASCADE CONSTRAINTS;
DROP TABLE CompraAutos CASCADE CONSTRAINTS;
DROP TABLE CompraPiezas CASCADE CONSTRAINTS;
DROP TABLE CarrosInteresado CASCADE CONSTRAINTS;
DROP TABLE PiezasInteresado CASCADE CONSTRAINTS;
DROP TABLE CarrosComprados CASCADE CONSTRAINTS;
DROP TABLE CarrosOfrece CASCADE CONSTRAINTS;
DROP TABLE AutosCompatibles CASCADE CONSTRAINTS;
DROP TABLE Contienen CASCADE CONSTRAINTS;
DROP TABLE HistorialMantenimientos CASCADE CONSTRAINTS;
DROP TABLE Inventarios CASCADE CONSTRAINTS;
DROP TABLE TramitesAduanas CASCADE CONSTRAINTS;
DROP TABLE Pedidos CASCADE CONSTRAINTS;
DROP TABLE Automoviles CASCADE CONSTRAINTS;
DROP TABLE Compras CASCADE CONSTRAINTS;
DROP TABLE Homologaciones CASCADE CONSTRAINTS;
DROP TABLE Importaciones CASCADE CONSTRAINTS;
DROP TABLE Piezas CASCADE CONSTRAINTS;
DROP TABLE Talleres CASCADE CONSTRAINTS;
DROP TABLE Proveedores CASCADE CONSTRAINTS;
DROP TABLE Vendedores CASCADE CONSTRAINTS;
DROP TABLE Compradores CASCADE CONSTRAINTS;
DROP TABLE Personas CASCADE CONSTRAINTS;

-- CREACIÓN DE TABLAS PRINCIPALES
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
    facturaDeCompra VARCHAR(500),
    idCompra VARCHAR(9)
);

CREATE TABLE Vendedores (
    idPersona VARCHAR(9) NOT NULL,
    esConcecionario VARCHAR(2) NOT NULL,
    nombreConcecionario VARCHAR(200),
    documentosPropiedad VARCHAR(500) NOT NULL,
    idAutomovil VARCHAR(9)
);

CREATE TABLE Talleres (
    idTaller VARCHAR(9) NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    direccion VARCHAR(200) NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    encargado VARCHAR(100) NOT NULL,
    especialidad VARCHAR(200) NOT NULL,
    idPieza VARCHAR(9),
    idBodega VARCHAR(9)
);

CREATE TABLE Homologaciones (
    idHomologacion VARCHAR(9) NOT NULL,
    idAuto VARCHAR(9) NOT NULL,
    fechaHomologaciones DATE NOT NULL,
    entidadHomologadora VARCHAR(100) NOT NULL,
    certificado VARCHAR(200) NOT NULL
);

CREATE TABLE Compras (
    idCompra VARCHAR(9) NOT NULL,
    idComprador VARCHAR(9) NOT NULL,
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
    estadoImportacion VARCHAR(50),
    idTramite VARCHAR(9),
    idAuto VARCHAR(9)
);

CREATE TABLE Automoviles (
    idAutomovil VARCHAR(9) NOT NULL,
    idVendedor VARCHAR(9) NOT NULL,
    idComprador VARCHAR(9) NOT NULL,
    idImportacion VARCHAR(9) NOT NULL,
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
    garantiaAutomovil VARCHAR(20) NOT NULL,
    fechaLlegada DATE NOT NULL
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
    fechaRegistro DATE NOT NULL,
    idPedido VARCHAR(9),
    idPieza VARCHAR(9),
    idCompra VARCHAR(9)
);

CREATE TABLE Pedidos (
    idPedido VARCHAR(9) NOT NULL,
    idProveedor VARCHAR(9) NOT NULL,
    idComprador VARCHAR(9) NOT NULL,
    fechaPedido DATE NOT NULL,
    fechaEntregaEstimada DATE NOT NULL,
    estadoPedido VARCHAR(50) NOT NULL,
    montoPedido NUMBER(15,2) NOT NULL,
    descripcionPedido VARCHAR(500) NOT NULL,
    documentosAsociados VARCHAR2(500) NOT NULL,
    costoEnvio NUMBER(15,2),
    idTramite VARCHAR(9)
);

CREATE TABLE TramitesAduanas (
    idTramite VARCHAR(9) NOT NULL,
    fechaInicio DATE NOT NULL,
    fechaFin DATE NOT NULL,
    estado VARCHAR(50) NOT NULL,
    observaciones VARCHAR(500) NOT NULL,
    documentosAsociados VARCHAR(500) NOT NULL
);

CREATE TABLE Piezas (
    idPieza VARCHAR(9) NOT NULL,
    nombrePieza VARCHAR(100) NOT NULL,
    descripcion VARCHAR(500) NOT NULL,
    fabricadorPieza VARCHAR(100) NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    precioPieza NUMBER(15,2) NOT NULL,
    estadoDePieza VARCHAR2(30) NOT NULL,
    cantidadDePiezas NUMBER NOT NULL,
    garantiaPieza VARCHAR(20) NOT NULL,
    codigoFabrica VARCHAR(100),
    idAuto VARCHAR(9)
);

CREATE TABLE Inventarios (
    idPieza VARCHAR(9) NOT NULL,
    idTaller VARCHAR(9) NOT NULL,
    idBodega VARCHAR(9) NOT NULL,
    cantidadDisponible NUMBER NOT NULL,
    ubicacionSeccionPieza VARCHAR(100) NOT NULL,
    ultimaFechaActualizacion DATE NOT NULL,
    Testante VARCHAR(10),
    TidPieza VARCHAR(9),
    TidBodega VARCHAR(9)
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

-- DEFINICIÓN DE CLAVES PRIMARIAS
ALTER TABLE Personas ADD CONSTRAINT pk_Personas PRIMARY KEY (idPersona);
ALTER TABLE Compradores ADD CONSTRAINT pk_comprador PRIMARY KEY (idPersona);
ALTER TABLE Vendedores ADD CONSTRAINT pk_vendedor PRIMARY KEY (idPersona);
ALTER TABLE Talleres ADD CONSTRAINT pk_Talleres PRIMARY KEY (idTaller);
ALTER TABLE Homologaciones ADD CONSTRAINT pk_Homologaciones PRIMARY KEY (idHomologacion);
ALTER TABLE Compras ADD CONSTRAINT pk_compra PRIMARY KEY (idCompra);
ALTER TABLE Facturas ADD CONSTRAINT pk_factura PRIMARY KEY (idFactura);
ALTER TABLE Importaciones ADD CONSTRAINT pk_importacion PRIMARY KEY (idImportacion);
ALTER TABLE Automoviles ADD CONSTRAINT pk_automoviles PRIMARY KEY (idAutomovil);
ALTER TABLE Proveedores ADD CONSTRAINT pk_proveedor PRIMARY KEY (idProveedor);
ALTER TABLE Pedidos ADD CONSTRAINT pk_pedidos PRIMARY KEY (idPedido);
ALTER TABLE TramitesAduanas ADD CONSTRAINT pk_tramitesaduanas PRIMARY KEY (idTramite);
ALTER TABLE Piezas ADD CONSTRAINT pk_pieza PRIMARY KEY (idPieza);
ALTER TABLE Inventarios ADD CONSTRAINT pk_inventario PRIMARY KEY (idBodega);
ALTER TABLE HistorialMantenimientos ADD CONSTRAINT pk_HistorialMantenimientos PRIMARY KEY (idMantenimiento);
ALTER TABLE Contienen ADD CONSTRAINT pk_Contienen PRIMARY KEY (idPedido, idPieza);

-- CLAVES PRIMARIAS PARA TABLAS DE MULTIPLICIDAD
ALTER TABLE CarrosInteresado ADD CONSTRAINT pk_carrosinteresado PRIMARY KEY (idPersona, carroInteresado);
ALTER TABLE PiezasInteresado ADD CONSTRAINT pk_piezasinteresado PRIMARY KEY (idPersona, piezaInteresado);
ALTER TABLE CarrosComprados ADD CONSTRAINT pk_carroscomprados PRIMARY KEY (idPersona, carroComprado);
ALTER TABLE CarrosOfrece ADD CONSTRAINT pk_carrossofrece PRIMARY KEY (idPersona, carroOfrece);
ALTER TABLE AutosCompatibles ADD CONSTRAINT pk_autoscompatibles PRIMARY KEY (idPieza, autoCompatible);
ALTER TABLE CompraAutos ADD CONSTRAINT pk_CompraAutos PRIMARY KEY (idCompra, idAuto);
ALTER TABLE CompraPiezas ADD CONSTRAINT pk_CompraPiezas PRIMARY KEY (idCompra, idPieza);

-- DEFINICIÃ“N DE CLAVES ÃšNICAS
ALTER TABLE Automoviles ADD CONSTRAINT uk_numeroChasis UNIQUE (numeroChasis);
ALTER TABLE Automoviles ADD CONSTRAINT uk_placa UNIQUE (placa);
ALTER TABLE Automoviles ADD CONSTRAINT uk_motor UNIQUE (motor);
ALTER TABLE Proveedores ADD CONSTRAINT uk_proveedor_telefono UNIQUE (telefono);
ALTER TABLE Proveedores ADD CONSTRAINT uk_proveedor_email UNIQUE (email);
ALTER TABLE Importaciones ADD CONSTRAINT uk_importacion UNIQUE (numeroContenedor);
ALTER TABLE Personas ADD CONSTRAINT uk_numeroIdentificacion UNIQUE (numeroIdentificacion);
ALTER TABLE Piezas ADD CONSTRAINT uk_codigoFabrica UNIQUE (codigoFabrica);


-- DEFINICIÃ“N DE CLAVES FORÃ?NEAS
ALTER TABLE Compradores ADD CONSTRAINT fk_comprador_Personas FOREIGN KEY (idPersona) REFERENCES Personas(idPersona) ON DELETE CASCADE;
ALTER TABLE Compradores ADD CONSTRAINT fk_comprador_compra FOREIGN KEY (idCompra) REFERENCES Compras(idCompra);
ALTER TABLE Vendedores ADD CONSTRAINT fk_vendedor_Personas FOREIGN KEY (idPersona) REFERENCES Personas(idPersona) ON DELETE CASCADE;
ALTER TABLE Vendedores ADD CONSTRAINT fk_vendedor_auto FOREIGN KEY (idAutomovil) REFERENCES Automoviles(idAutomovil);
ALTER TABLE Talleres ADD CONSTRAINT fk_Talleres_pieza FOREIGN KEY (idPieza) REFERENCES Piezas(idPieza);
ALTER TABLE Talleres ADD CONSTRAINT fk_Talleres_bodega FOREIGN KEY (idBodega) REFERENCES Inventarios(idBodega);
ALTER TABLE Homologaciones ADD CONSTRAINT fk_Homologaciones_auto FOREIGN KEY (idAuto) REFERENCES Automoviles(idAutomovil) ON DELETE CASCADE;
ALTER TABLE Facturas ADD CONSTRAINT fk_factura_compra FOREIGN KEY (idCompra) REFERENCES Compras(idCompra);
ALTER TABLE Importaciones ADD CONSTRAINT fk_importacion_tramite FOREIGN KEY (idTramite) REFERENCES TramitesAduanas(idTramite);
ALTER TABLE Importaciones ADD CONSTRAINT fk_importacion_auto FOREIGN KEY (idAuto) REFERENCES Automoviles(idAutomovil);
ALTER TABLE Automoviles ADD CONSTRAINT fk_auto_vendedor FOREIGN KEY (idVendedor) REFERENCES Vendedores(idPersona);
ALTER TABLE Automoviles ADD CONSTRAINT fk_auto_comprador FOREIGN KEY (idComprador) REFERENCES Compradores(idPersona);
ALTER TABLE Automoviles ADD CONSTRAINT fk_auto_importacion FOREIGN KEY (idImportacion) REFERENCES Importaciones(idImportacion);
ALTER TABLE Proveedores ADD CONSTRAINT fk_proveedor_pedido FOREIGN KEY (idPedido) REFERENCES Pedidos(idPedido);
ALTER TABLE Proveedores ADD CONSTRAINT fk_proveedor_pieza FOREIGN KEY (idPieza) REFERENCES Piezas(idPieza);
ALTER TABLE Proveedores ADD CONSTRAINT fk_proveedor_compra FOREIGN KEY (idCompra) REFERENCES Compras(idCompra);
ALTER TABLE Pedidos ADD CONSTRAINT fk_pedido_proveedor FOREIGN KEY (idProveedor) REFERENCES Proveedores(idProveedor);
ALTER TABLE Pedidos ADD CONSTRAINT fk_pedido_comprador FOREIGN KEY (idComprador) REFERENCES Compradores(idPersona);
ALTER TABLE Pedidos ADD CONSTRAINT fk_pedido_tramite FOREIGN KEY (idTramite) REFERENCES TramitesAduanas(idTramite);
ALTER TABLE Inventarios ADD CONSTRAINT fk_inventario_pieza FOREIGN KEY (idPieza) REFERENCES Piezas(idPieza) ON DELETE CASCADE;
ALTER TABLE Inventarios ADD CONSTRAINT fk_inventario_Talleres FOREIGN KEY (idTaller) REFERENCES Talleres(idTaller) ON DELETE CASCADE;
ALTER TABLE HistorialMantenimientos ADD CONSTRAINT fk_mant_automovil FOREIGN KEY (idAutomovil) REFERENCES Automoviles(idAutomovil) ON DELETE CASCADE;
ALTER TABLE HistorialMantenimientos ADD CONSTRAINT fk_mant_Talleres FOREIGN KEY (idTaller) REFERENCES Talleres(idTaller) ON DELETE CASCADE;
ALTER TABLE Contienen ADD CONSTRAINT fk_Contienen_pedido FOREIGN KEY (idPedido) REFERENCES Pedidos(idPedido) ON DELETE CASCADE;
ALTER TABLE Contienen ADD CONSTRAINT fk_Contienen_pieza FOREIGN KEY (idPieza) REFERENCES Piezas(idPieza) ON DELETE CASCADE;

-- FORÃ?NEAS PARA TABLAS DE MULTIPLICIDAD
ALTER TABLE CarrosInteresado ADD CONSTRAINT fk_carrosinteresado_comprador FOREIGN KEY (idPersona) REFERENCES Compradores(idPersona) ON DELETE CASCADE;
ALTER TABLE PiezasInteresado ADD CONSTRAINT fk_piezasinteresado_comprador FOREIGN KEY (idPersona) REFERENCES Compradores(idPersona) ON DELETE CASCADE;
ALTER TABLE CarrosComprados ADD CONSTRAINT fk_carroscomprados_comprador FOREIGN KEY (idPersona) REFERENCES Compradores(idPersona) ON DELETE CASCADE;
ALTER TABLE CarrosOfrece ADD CONSTRAINT fk_carrosofrece_vendedor FOREIGN KEY (idPersona) REFERENCES Vendedores(idPersona) ON DELETE CASCADE;
ALTER TABLE AutosCompatibles ADD CONSTRAINT fk_autoscompatibles_pieza FOREIGN KEY (idPieza) REFERENCES Piezas(idPieza) ON DELETE CASCADE;
ALTER TABLE CompraAutos ADD CONSTRAINT fk_CompraAutos_compra FOREIGN KEY (idCompra) REFERENCES Compras(idCompra) ON DELETE CASCADE;
ALTER TABLE CompraAutos ADD CONSTRAINT fk_CompraAutos_auto FOREIGN KEY (idAuto) REFERENCES Automoviles(idAutomovil) ON DELETE CASCADE;
ALTER TABLE CompraPiezas ADD CONSTRAINT fk_CompraPiezas_compra FOREIGN KEY (idCompra) REFERENCES Compras(idCompra) ON DELETE CASCADE;
ALTER TABLE CompraPiezas ADD CONSTRAINT fk_CompraPiezas_pieza FOREIGN KEY (idPieza) REFERENCES Piezas(idPieza) ON DELETE CASCADE;

-- CHECKS Y TIPOS
ALTER TABLE Compradores ADD CONSTRAINT chk_idComprador CHECK (REGEXP_LIKE(idPersona, '^CDR-[0-9]{5}$'));
ALTER TABLE Compradores ADD CONSTRAINT chk_idCompra_Comprador CHECK (REGEXP_LIKE(idCompra, '^COM-[0-9]{5}$'));
ALTER TABLE Personas ADD CONSTRAINT chk_tipoPersona CHECK (tipoPersona IN ('comprador', 'vendedor'));
ALTER TABLE Vendedores ADD CONSTRAINT chk_idVendedor CHECK (REGEXP_LIKE(idPersona, '^VEN-[0-9]{5}$'));
ALTER TABLE Vendedores ADD CONSTRAINT chk_idAutomovil_Vendedor CHECK (REGEXP_LIKE(idAutomovil, '^AUT-[0-9]{5}$'));
ALTER TABLE Vendedores ADD CONSTRAINT chk_esConcecionario CHECK (esConcecionario IN ('Si', 'No'));
ALTER TABLE Talleres ADD CONSTRAINT chk_idTaller CHECK (REGEXP_LIKE(idTaller, '^TAL-[0-9]{5}$'));
ALTER TABLE Talleres ADD CHECK (REGEXP_LIKE(idPieza, '^PIE-[0-9]{5}$'));
ALTER TABLE Talleres ADD CHECK (REGEXP_LIKE(idBodega, '^BOD-[0-9]{5}$'));
ALTER TABLE Homologaciones ADD CONSTRAINT chk_idHomologacion CHECK (REGEXP_LIKE(idHomologacion, '^HOM-[0-9]{5}$'));
ALTER TABLE Homologaciones ADD CONSTRAINT chk_idAuto CHECK (REGEXP_LIKE(idAuto, '^AUT-[0-9]{5}$'));
ALTER TABLE Vendedores ADD CONSTRAINT chk_idVendedores CHECK (REGEXP_LIKE(idPersona, '^VEN-[0-9]{5}$'));
ALTER TABLE Compras ADD CONSTRAINT chk_idComprador_Compra CHECK (REGEXP_LIKE(idComprador, '^CDR-[0-9]{5}$'));
ALTER TABLE Compras ADD CONSTRAINT chk_formaPago CHECK (formaPago IN ('transferencia', 'Deposito', 'efectivo'));
ALTER TABLE Compras ADD CONSTRAINT chk_estadoPago CHECK (estadoPago IN ('Realizado', 'En tramite'));
ALTER TABLE Facturas ADD CONSTRAINT chk_idFactura CHECK (REGEXP_LIKE(idFactura, '^FAC-[0-9]{5}$'));
ALTER TABLE Automoviles ADD CONSTRAINT chk_papelesTramite CHECK (papelesEnTramite IN ('Si', 'No'));
ALTER TABLE Automoviles ADD CONSTRAINT chk_placa CHECK (REGEXP_LIKE(placa, '^[A-Z]{3} [0-9]{3}$'));
ALTER TABLE Automoviles ADD CONSTRAINT chk_garantiaAutomovil CHECK (REGEXP_LIKE(garantiaAutomovil, '^[0-9]{2} meses$'));
ALTER TABLE Proveedores ADD CONSTRAINT chk_calificacion CHECK (calificacion BETWEEN 0 AND 5);
ALTER TABLE Proveedores ADD CONSTRAINT chk_idProveedor CHECK (REGEXP_LIKE(idProveedor, '^PRO-[0-9]{5}$'));
ALTER TABLE Pedidos ADD CONSTRAINT chk_idPedido CHECK (REGEXP_LIKE(idPedido, '^PED-[0-9]{5}$'));
ALTER TABLE Pedidos ADD CONSTRAINT chk_idTramitePedido CHECK (REGEXP_LIKE(idTramite, '^TRA-[0-9]{5}$'));
ALTER TABLE TramitesAduanas ADD CONSTRAINT chk_idTramite CHECK (REGEXP_LIKE(idTramite, '^TRA-[0-9]{5}$'));
ALTER TABLE Piezas ADD CONSTRAINT chk_idPieza CHECK (REGEXP_LIKE(idPieza, '^PIE-[0-9]{5}$'));
ALTER TABLE Piezas ADD CONSTRAINT chk_garantiaPieza CHECK (REGEXP_LIKE(garantiaPieza, '^[0-9]{2} meses$'));
ALTER TABLE Inventarios ADD CONSTRAINT chk_Testante CHECK (REGEXP_LIKE(Testante, '^[A-Z][0-9]$'));
ALTER TABLE Inventarios ADD CONSTRAINT chk_TidPiezaInv CHECK (REGEXP_LIKE(TidPieza, '^PIE-[0-9]{5}$'));
ALTER TABLE Inventarios ADD CONSTRAINT chk_TidBodegaInv CHECK (REGEXP_LIKE(TidBodega, '^BOD-[0-9]{5}$'));
ALTER TABLE Contienen ADD CONSTRAINT chk_idPedidoContiene CHECK (REGEXP_LIKE(idPedido, '^PED-[0-9]{5}$'));
ALTER TABLE Contienen ADD CONSTRAINT chk_idPiezaContiene CHECK (REGEXP_LIKE(idPieza, '^PIE-[0-9]{5}$'));
ALTER TABLE CarrosInteresado ADD CONSTRAINT chk_idPersonaCarrosInteresado CHECK (REGEXP_LIKE(idPersona, '^CDR-[0-9]{5}$'));
ALTER TABLE PiezasInteresado ADD CONSTRAINT chk_idPersonaPiezasInteresado CHECK (REGEXP_LIKE(idPersona, '^CDR-[0-9]{5}$'));
ALTER TABLE CarrosComprados ADD CONSTRAINT chk_idPersonaCarrosComprados CHECK (REGEXP_LIKE(idPersona, '^CDR-[0-9]{5}$'));
ALTER TABLE CarrosOfrece ADD CONSTRAINT chk_idPersonaCarrosOfrece CHECK (REGEXP_LIKE(idPersona, '^VEN-[0-9]{5}$'));
ALTER TABLE AutosCompatibles ADD CONSTRAINT chk_idPiezaAutosCompatibles CHECK (REGEXP_LIKE(idPieza, '^PIE-[0-9]{5}$'));
ALTER TABLE CompraAutos ADD CONSTRAINT chk_idCompraAutos CHECK (REGEXP_LIKE(idCompra, '^COM-[0-9]{5}$'));
ALTER TABLE CompraAutos ADD CONSTRAINT chk_idAutoCompraAutos CHECK (REGEXP_LIKE(idAuto, '^AUT-[0-9]{5}$'));
ALTER TABLE CompraPiezas ADD CONSTRAINT chk_idCompraPiezas CHECK (REGEXP_LIKE(idCompra, '^COM-[0-9]{5}$'));
ALTER TABLE CompraPiezas ADD CONSTRAINT chk_idPiezaCompraPiezas CHECK (REGEXP_LIKE(idPieza, '^PIE-[0-9]{5}$'));

-- DISPARADORES PARA AUTOMATIZACIÓN
CREATE OR REPLACE TRIGGER trg_validar_idComprador
BEFORE INSERT OR UPDATE ON Compradores
FOR EACH ROW
BEGIN
    IF NOT REGEXP_LIKE(:NEW.idPersona, '^CDR-[0-9]{5}$') THEN
        RAISE_APPLICATION_ERROR(-20001, 'El idPersona en Comprador debe tener formato CDR-XXXXX');
    END IF;
END;
/

CREATE OR REPLACE TRIGGER trg_validar_fechas_importacion
BEFORE INSERT OR UPDATE ON Importaciones
FOR EACH ROW
BEGIN
    IF :NEW.fechaSalida IS NOT NULL AND :NEW.fechaLlegada IS NOT NULL THEN
        IF :NEW.fechaLlegada < :NEW.fechaSalida THEN
            RAISE_APPLICATION_ERROR(-20002, 'La fecha de llegada no puede ser menor a la fecha de salida');
        END IF;
    END IF;
END;
/

CREATE OR REPLACE TRIGGER trg_auto_fecha_registro
BEFORE INSERT ON Personas
FOR EACH ROW
BEGIN
    IF :NEW.fechaRegistro IS NULL THEN
        :NEW.fechaRegistro := SYSDATE;
    END IF;
END;
/

-- POBLAR OK

-- TRÁMITES ADUANAS
INSERT INTO TramitesAduanas (idTramite, fechaInicio, fechaFin, estado, observaciones, documentosAsociados)
VALUES ('TRA-00001', TO_DATE('2024-01-10', 'YYYY-MM-DD'), TO_DATE('2024-01-25', 'YYYY-MM-DD'), 'Completado', 'Sin observaciones', 'DOC-TRA-001');

-- PERSONAS
INSERT INTO Personas (idPersona, nombre, direccion, telefono, email, tipoPersona, numeroIdentificacion, pais, fechaRegistro)
VALUES ('CDR-00001', 'Juan Pérez', 'Calle 123 #45-67', '3001234567', 'juan.perez@email.com', 'comprador', 'CC-12345678', 'Colombia', SYSDATE);

INSERT INTO Personas (idPersona, nombre, direccion, telefono, email, tipoPersona, numeroIdentificacion, pais, fechaRegistro)
VALUES ('CDR-00002', 'María Gómez', 'Carrera 45 #78-90', '3109876543', 'maria.gomez@email.com', 'comprador', 'CC-87654321', 'Colombia', SYSDATE);

INSERT INTO Personas (idPersona, nombre, direccion, telefono, email, tipoPersona, numeroIdentificacion, pais, fechaRegistro)
VALUES ('VEN-00001', 'Carlos López', 'Av Principal 123', '6011234567', 'carlos.lopez@email.com', 'vendedor', 'CC-111222333', 'Colombia', SYSDATE);

INSERT INTO Personas (idPersona, nombre, direccion, telefono, email, tipoPersona, numeroIdentificacion, pais, fechaRegistro)
VALUES ('VEN-00002', 'Ana Martínez', 'Calle 89 #12-34', '6017654321', 'ana.martinez@email.com', 'vendedor', 'CC-444555666', 'Colombia', SYSDATE);

-- COMPRADORES
INSERT INTO Compradores (idPersona, facturaDeCompra, idCompra)
VALUES ('CDR-00001', NULL, NULL);

INSERT INTO Compradores (idPersona, facturaDeCompra, idCompra)
VALUES ('CDR-00002', NULL, NULL);

-- VENDEDORES
INSERT INTO Vendedores (idPersona, esConcecionario, nombreConcecionario, documentosPropiedad, idAutomovil)
VALUES ('VEN-00001', 'Si', 'AutoMundo', 'DOC-001', NULL);

INSERT INTO Vendedores (idPersona, esConcecionario, nombreConcecionario, documentosPropiedad, idAutomovil)
VALUES ('VEN-00002', 'No', NULL, 'DOC-002', NULL);

-- IMPORTACIONES
INSERT INTO Importaciones (idImportacion, fechaSalida, fechaLlegada, puertoSalida, puertoLlegada, nombreBuqueAvion, numeroContenedor, estadoImportacion, idTramite, idAuto)
VALUES ('IMP-00001', TO_DATE('2024-01-10', 'YYYY-MM-DD'), TO_DATE('2024-01-25', 'YYYY-MM-DD'), 'Buenos Aires', 'Cartagena', 'BarcoAndes', 'CONT-001', 'Completada', 'TRA-00001', NULL);

-- AUTOMÓVILES
INSERT INTO Automoviles (
    idAutomovil, idVendedor, idComprador, idImportacion, marca, modelo, año, 
    numeroChasis, placa, color, cilindraje, tipoCombustible, precioCompra, 
    precioVenta, estado, papelesEnTramite, paisDeOrigen, cantidad, 
    paisDeEnsamblaje, motor, modificaciones, facturaAutomovil, 
    garantiaAutomovil, fechaLlegada
) VALUES (
    'AUT-00001', 'VEN-00001', 'CDR-00001', 'IMP-00001', 'Toyota', 'Corolla', 2023,
    'CHASIS001', 'ABC 123', 'Rojo', '1800cc', 'Gasolina', 45000000, 
    55000000, 'Disponible', 'No', 'Japón', 1, 
    'Japón', 'MOTOR-001', 'Ninguna', 'FAC-AUTO-001', 
    '12 meses', TO_DATE('2024-01-20', 'YYYY-MM-DD')
);

INSERT INTO Automoviles (
    idAutomovil, idVendedor, idComprador, idImportacion, marca, modelo, año, 
    numeroChasis, placa, color, cilindraje, tipoCombustible, precioCompra, 
    precioVenta, estado, papelesEnTramite, paisDeOrigen, cantidad, 
    paisDeEnsamblaje, motor, modificaciones, facturaAutomovil, 
    garantiaAutomovil, fechaLlegada
) VALUES (
    'AUT-00002', 'VEN-00002', 'CDR-00002', 'IMP-00001', 'Mazda', '3', 2024,
    'CHASIS002', 'XYZ 789', 'Azul', '2000cc', 'Gasolina', 52000000, 
    62000000, 'Disponible', 'Si', 'México', 1, 
    'México', 'MOTOR-002', 'Aros deportivos', 'FAC-AUTO-002', 
    '12 meses', TO_DATE('2024-02-15', 'YYYY-MM-DD')
);

-- COMPRAS
INSERT INTO Compras (idCompra, idComprador, fechaCompra, precioCompra, formaPago, estadoPago, fechaEntrega)
VALUES ('COM-00001', 'CDR-00001', SYSDATE, 55000000, 'transferencia', 'Realizado', SYSDATE + 7);

INSERT INTO Compras (idCompra, idComprador, fechaCompra, precioCompra, formaPago, estadoPago, fechaEntrega)
VALUES ('COM-00002', 'CDR-00002', SYSDATE - 5, 62000000, 'Deposito', 'Realizado', SYSDATE + 2);

-- FACTURAS
INSERT INTO Facturas (idFactura, fechaFactura, idCompra)
VALUES ('FAC-00001', SYSDATE, 'COM-00001');

INSERT INTO Facturas (idFactura, fechaFactura, idCompra)
VALUES ('FAC-00002', SYSDATE, 'COM-00001');

INSERT INTO Facturas (idFactura, fechaFactura, idCompra)
VALUES ('FAC-00003', SYSDATE - 5, 'COM-00002');

-- HOMOLOGACIONES
INSERT INTO Homologaciones (idHomologacion, idAuto, fechaHomologaciones, entidadHomologadora, certificado)
VALUES ('HOM-00001', 'AUT-00001', SYSDATE - 10, 'Ministerio de Transporte', 'CERT-001');

INSERT INTO Homologaciones (idHomologacion, idAuto, fechaHomologaciones, entidadHomologadora, certificado)
VALUES ('HOM-00002', 'AUT-00002', SYSDATE - 3, 'Ministerio de Transporte', 'CERT-002');

-- PROVEEDORES
INSERT INTO Proveedores (idProveedor, nombreProveedor, pais, telefono, email, direccion, tipoProveedor, calificacion, fechaRegistro, idPedido, idPieza, idCompra)
VALUES ('PRO-00001', 'Autopartes SAS', 'Colombia', '6011234567', 'ventas@autopartes.com', 'Av Principal 789', 'Piezas', 4.5, SYSDATE, NULL, NULL, NULL);

INSERT INTO Proveedores (idProveedor, nombreProveedor, pais, telefono, email, direccion, tipoProveedor, calificacion, fechaRegistro, idPedido, idPieza, idCompra)
VALUES ('PRO-00002', 'Repuestos Express', 'China', '6017654321', 'ventas@repuestosexpress.com', 'Calle Industrial 456', 'Piezas', 4.2, SYSDATE, NULL, NULL, NULL);

-- PIEZAS
INSERT INTO Piezas (idPieza, nombrePieza, descripcion, fabricadorPieza, categoria, precioPieza, estadoDePieza, cantidadDePiezas, garantiaPieza, codigoFabrica, idAuto)
VALUES ('PIE-00001', 'Filtro de Aceite', 'Filtro para motor 1.8L', 'Bosch', 'Filtros', 35000, 'Nuevo', 100, '06 meses', 'FAB-12345', 'AUT-00001');

INSERT INTO Piezas (idPieza, nombrePieza, descripcion, fabricadorPieza, categoria, precioPieza, estadoDePieza, cantidadDePiezas, garantiaPieza, codigoFabrica, idAuto)
VALUES ('PIE-00002', 'Pastillas de Freno', 'Pastillas cerámicas para freno', 'Brembo', 'Frenos', 120000, 'Nuevo', 50, '12 meses', 'FAB-67890', 'AUT-00002');

INSERT INTO Piezas (idPieza, nombrePieza, descripcion, fabricadorPieza, categoria, precioPieza, estadoDePieza, cantidadDePiezas, garantiaPieza, codigoFabrica, idAuto)
VALUES ('PIE-00003', 'Bujía', 'Bujía de iridio', 'NGK', 'Encendido', 25000, 'Nuevo', 200, '06 meses', 'FAB-11111', NULL);

-- PEDIDOS
INSERT INTO Pedidos (idPedido, idProveedor, idComprador, fechaPedido, fechaEntregaEstimada, estadoPedido, montoPedido, descripcionPedido, documentosAsociados, costoEnvio, idTramite)
VALUES ('PED-00001', 'PRO-00001', 'CDR-00001', SYSDATE - 10, SYSDATE + 5, 'En Proceso', 2500000, 'Pedido de piezas varias', 'DOC-PED-001', 50000, 'TRA-00001');

INSERT INTO Pedidos (idPedido, idProveedor, idComprador, fechaPedido, fechaEntregaEstimada, estadoPedido, montoPedido, descripcionPedido, documentosAsociados, costoEnvio, idTramite)
VALUES ('PED-00002', 'PRO-00002', 'CDR-00002', SYSDATE - 2, SYSDATE + 10, 'Pendiente', 1800000, 'Pedido de repuestos', 'DOC-PED-002', 75000, 'TRA-00001');

-- TALLERES
INSERT INTO Talleres (idTaller, nombre, direccion, telefono, encargado, especialidad, idPieza, idBodega)
VALUES ('TAL-00001', 'Talleres Central', 'Calle 50 #20-30', '6015551234', 'Carlos López', 'Mecánica General', NULL, NULL);

INSERT INTO Talleres (idTaller, nombre, direccion, telefono, encargado, especialidad, idPieza, idBodega)
VALUES ('TAL-00002', 'AutoReparaciones', 'Carrera 100 #45-12', '6015555678', 'Ana Martínez', 'Carrocería', NULL, NULL);

-- INVENTARIOS
INSERT INTO Inventarios (idPieza, idTaller, idBodega, cantidadDisponible, ubicacionSeccionPieza, ultimaFechaActualizacion, Testante, TidPieza, TidBodega)
VALUES ('PIE-00001', 'TAL-00001', 'BOD-00001', 50, 'Sección A', SYSDATE, 'A1', 'PIE-00001', 'BOD-00001');

INSERT INTO Inventarios (idPieza, idTaller, idBodega, cantidadDisponible, ubicacionSeccionPieza, ultimaFechaActualizacion, Testante, TidPieza, TidBodega)
VALUES ('PIE-00002', 'TAL-00001', 'BOD-00002', 25, 'Sección B', SYSDATE, 'B2', 'PIE-00002', 'BOD-00002');

INSERT INTO Inventarios (idPieza, idTaller, idBodega, cantidadDisponible, ubicacionSeccionPieza, ultimaFechaActualizacion, Testante, TidPieza, TidBodega)
VALUES ('PIE-00003', 'TAL-00002', 'BOD-00003', 100, 'Sección C', SYSDATE, 'C3', 'PIE-00003', 'BOD-00003');

-- HISTORIAL MANTENIMIENTOS
INSERT INTO HistorialMantenimientos (idMantenimiento, idAutomovil, idTaller, fechaMantenimiento, tipoMantenimiento, descripcion, costo, piezasUtilizadas, mecanico, observaciones)
VALUES ('MAN-00001', 'AUT-00001', 'TAL-00001', SYSDATE - 20, 'Preventivo', 'Cambio de aceite y filtros', 250000, 'PIE-00001', 'Juan Mecánico', 'Todo en orden');

INSERT INTO HistorialMantenimientos (idMantenimiento, idAutomovil, idTaller, fechaMantenimiento, tipoMantenimiento, descripcion, costo, piezasUtilizadas, mecanico, observaciones)
VALUES ('MAN-00002', 'AUT-00002', 'TAL-00001', SYSDATE - 5, 'Correctivo', 'Reparación de frenos', 380000, 'PIE-00002', 'Pedro Técnico', 'Frenos delanteros');

-- CONTIENEN
INSERT INTO Contienen (idPedido, idPieza)
VALUES ('PED-00001', 'PIE-00001');

INSERT INTO Contienen (idPedido, idPieza)
VALUES ('PED-00001', 'PIE-00002');

INSERT INTO Contienen (idPedido, idPieza)
VALUES ('PED-00002', 'PIE-00003');

-- COMPRA AUTOS
INSERT INTO CompraAutos (idCompra, idAuto)
VALUES ('COM-00001', 'AUT-00001');

INSERT INTO CompraAutos (idCompra, idAuto)
VALUES ('COM-00002', 'AUT-00002');

-- COMPRA PIEZAS
INSERT INTO CompraPiezas (idCompra, idPieza)
VALUES ('COM-00001', 'PIE-00001');

INSERT INTO CompraPiezas (idCompra, idPieza)
VALUES ('COM-00002', 'PIE-00002');

-- CarrosInteresado
INSERT INTO CarrosInteresado (idPersona, carroInteresado) VALUES ('CDR-00001', 'Toyota Corolla');
INSERT INTO CarrosInteresado (idPersona, carroInteresado) VALUES ('CDR-00001', 'Mazda 3');
INSERT INTO CarrosInteresado (idPersona, carroInteresado) VALUES ('CDR-00002', 'Honda Civic');

-- PiezasInteresado
INSERT INTO PiezasInteresado (idPersona, piezaInteresado) VALUES ('CDR-00001', 'Filtro de Aceite');
INSERT INTO PiezasInteresado (idPersona, piezaInteresado) VALUES ('CDR-00002', 'Pastillas de Freno');

-- CarrosComprados
INSERT INTO CarrosComprados (idPersona, carroComprado) VALUES ('CDR-00001', 'Toyota Corolla 2023');
INSERT INTO CarrosComprados (idPersona, carroComprado) VALUES ('CDR-00002', 'Mazda 3 2024');

-- CarrosOfrece
INSERT INTO CarrosOfrece (idPersona, carroOfrece) VALUES ('VEN-00001', 'Toyota Corolla');
INSERT INTO CarrosOfrece (idPersona, carroOfrece) VALUES ('VEN-00001', 'Toyota Hilux');
INSERT INTO CarrosOfrece (idPersona, carroOfrece) VALUES ('VEN-00002', 'Mazda 3');

-- AutosCompatibles
INSERT INTO AutosCompatibles (idPieza, autoCompatible) VALUES ('PIE-00001', 'Toyota Corolla');
INSERT INTO AutosCompatibles (idPieza, autoCompatible) VALUES ('PIE-00001', 'Toyota Yaris');
INSERT INTO AutosCompatibles (idPieza, autoCompatible) VALUES ('PIE-00002', 'Mazda 3');
INSERT INTO AutosCompatibles (idPieza, autoCompatible) VALUES ('PIE-00003', 'Chevrolet Spark');


-- POBLAR NO OK
INSERT INTO Talleres (idTaller, nombre, direccion, telefono, encargado, especialidad)
VALUES ('TAL-123', 'Talleres Error', 'Calle Falsa', '1234567', 'Error', 'General');

INSERT INTO Homologaciones (idHomologacion, idAuto, fechaHomologaciones, entidadHomologadora, certificado)
VALUES ('HOM-123', 'AUT-00001', SYSDATE, 'Entidad', 'CERT-002');

INSERT INTO Personas (idPersona, nombre, direccion, telefono, email, tipoPersona, numeroIdentificacion, pais, fechaRegistro)
VALUES ('CDR-00003', 'Test', 'Test', '123', 'test@test.com', 'invalido', 'CC-99999999', 'Colombia', SYSDATE);

INSERT INTO Compras (idCompra, fechaCompra, formaPago, estadoPago)
VALUES ('COM-00002', SYSDATE, 'tarjeta', 'Realizado');

INSERT INTO Personas (idPersona, nombre, direccion, telefono, email, tipoPersona, numeroIdentificacion, pais, fechaRegistro)
VALUES ('CDR-00004', 'Duplicado', 'Test', '123', 'test@test.com', 'comprador', 'CC-12345678', 'Colombia', SYSDATE);

INSERT INTO Automoviles (idAutomovil, idVendedor, idComprador, idImportacion, marca, modelo, anio, numeroChasis, placa, color, cilindraje, tipoCombustible, precioCompra, precioVenta, estado, papelesEnTramite, paisDeOrigen, cantidad, paisDeEnsamblaje, motor, modificaciones, facturaAutomovil, garantiaAutomovil, fechaLlegada)
VALUES ('AUT-00002', 'VDR-00001', 'CDR-00001', 'IMP-00001', 'Toyota', 'Corolla', 2023, 'CHASIS002', 'ABC123', 'Rojo', '1800cc', 'Gasolina', 45000000, 55000000, 'Disponible', 'No', 'JapÃ³n', 1, 'JapÃ³n', 'MOTOR-002', 'Ninguna', 'FAC-AUTO-002', '12 meses', TO_DATE('2024-01-20', 'YYYY-MM-DD'));

-- CONSULTAS SQL DE EJEMPLO
SELECT p.idPersona, p.nombre, p.email, c.facturaDeCompra
FROM Personas p
JOIN Compradores c ON p.idPersona = c.idPersona
WHERE p.tipoPersona = 'comprador';

SELECT a.idAutomovil, a.marca, a.modelo, a.placa, 
       v.nombreConcecionario AS vendedor,
       p.nombre AS comprador
FROM Automoviles a
JOIN Vendedores v ON a.idVendedor = v.idPersona
JOIN Compradores c ON a.idComprador = c.idPersona
JOIN Personas p ON c.idPersona = p.idPersona;

SELECT t.nombre AS Talleres, p.nombrePieza, i.cantidadDisponible, i.ubicacionSeccionPieza
FROM Inventarios i
JOIN Talleres t ON i.idTaller = t.idTaller
JOIN Piezas p ON i.idPieza = p.idPieza;

-- CONSULTAS GERENCIALES
-- 1. Conocer pedidos
SELECT 
    p.idPedido,
    p.fechaPedido,
    p.estadoPedido,
    p.montoPedido,
    p.descripcionPedido,
    pr.nombreProveedor,
    pe.nombre AS comprador,
    p.fechaEntregaEstimada
FROM Pedidos p
JOIN Proveedores pr ON p.idProveedor = pr.idProveedor
JOIN Personas pe ON p.idComprador = pe.idPersona
ORDER BY p.fechaPedido DESC;

-- 2. Conocer país de donde más importa
SELECT 
    a.paisDeOrigen AS pais,
    COUNT(*) AS cantidad_autos_importados,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER(), 2) AS porcentaje
FROM Automoviles a
GROUP BY a.paisDeOrigen
ORDER BY cantidad_autos_importados DESC
FETCH FIRST 1 ROW ONLY;

-- 3. Conocer automóviles más comprados
SELECT 
    a.marca,
    a.modelo,
    a.año,
    COUNT(ca.idCompra) AS veces_comprado,
    SUM(a.precioVenta) AS total_ventas,
    AVG(a.precioVenta) AS precio_promedio
FROM Automoviles a
JOIN CompraAutos ca ON a.idAutomovil = ca.idAuto
JOIN Compras c ON ca.idCompra = c.idCompra
GROUP BY a.marca, a.modelo, a.año
ORDER BY veces_comprado DESC, total_ventas DESC
FETCH FIRST 5 ROWS ONLY;

-- CONSULTAS OPERATIVAS

--1. Tipos de carros disponibles
SELECT DISTINCT
    a.marca,
    a.modelo,
    COUNT(a.idAutomovil) AS unidades_disponibles
FROM Automoviles a
WHERE a.estado = 'Disponible'
GROUP BY a.marca, a.modelo
ORDER BY unidades_disponibles DESC;

-- 2. Consultar la cantidad de carros importados
SELECT 
    COUNT(*) AS total_carros_importados,
    SUM(a.cantidad) AS total_unidades
FROM Automoviles a;

--3. Consulta las ventas de un punto
SELECT 
    v.nombreConcecionario AS punto_venta,
    p.nombre AS vendedor,
    COUNT(DISTINCT a.idAutomovil) AS autos_vendidos,
    SUM(a.precioVenta) AS total_ventas_pesos,
    AVG(a.precioVenta) AS precio_promedio,
    TO_CHAR(MIN(c.fechaCompra), 'YYYY-MM-DD') AS primera_venta,
    TO_CHAR(MAX(c.fechaCompra), 'YYYY-MM-DD') AS ultima_venta
FROM Vendedores v
JOIN Personas p ON v.idPersona = p.idPersona
JOIN Automoviles a ON v.idPersona = a.idVendedor
JOIN Compras c ON a.idComprador = c.idComprador
WHERE v.esConcecionario = 'Si'
  AND v.nombreConcecionario = 'AutoMundo'  -- Cambiar según el punto deseado
GROUP BY v.nombreConcecionario, p.nombre
ORDER BY total_ventas_pesos DESC;

--4. Piezas disponibles con stock mayor a cero
SELECT 
    p.idPieza,
    p.nombrePieza,
    p.categoria,
    i.cantidadDisponible,
    p.precioPieza,
    p.estadoDePieza
FROM Piezas p
JOIN Inventarios i ON p.idPieza = i.idPieza
WHERE i.cantidadDisponible > 0
  AND p.estadoDePieza = 'Nuevo'
ORDER BY i.cantidadDisponible DESC, p.categoria;

--5. Consultar la ubicacion de las piezas
SELECT 
    p.nombrePieza,
    p.idPieza,
    t.nombre AS taller,
    t.direccion AS direccion_taller,
    i.ubicacionSeccionPieza AS seccion_o_estante,
    i.cantidadDisponible,
    i.idBodega,
    i.ultimaFechaActualizacion AS ultima_actualizacion
FROM Piezas p
JOIN Inventarios i ON p.idPieza = i.idPieza
JOIN Talleres t ON i.idTaller = t.idTaller
WHERE i.cantidadDisponible > 0
ORDER BY t.nombre, i.ubicacionSeccionPieza;

-- ELIMINACIÓN DE DATOS (Ejemplos)
DELETE FROM Talleres WHERE idTaller = 'TAL-00002';

-- ELIMINACIÓN DE TRIGGERS
/*
DROP TRIGGER trg_validar_idComprador;
DROP TRIGGER trg_validar_fechas_importacion;
DROP TRIGGER trg_auto_fecha_registro;
*/