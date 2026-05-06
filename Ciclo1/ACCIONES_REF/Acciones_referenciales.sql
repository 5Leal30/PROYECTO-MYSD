ALTER TABLE Compradores ADD CONSTRAINT fk_comprador_Personas FOREIGN KEY (idPersona) REFERENCES Personas(idPersona) ON DELETE CASCADE;
ALTER TABLE Vendedores ADD CONSTRAINT fk_vendedor_Personas FOREIGN KEY (idPersona) REFERENCES Personas(idPersona) ON DELETE CASCADE;
ALTER TABLE Homologaciones ADD CONSTRAINT fk_Homologaciones_auto FOREIGN KEY (idAuto) REFERENCES Automoviles(idAutomovil) ON DELETE CASCADE;
ALTER TABLE Inventarios ADD CONSTRAINT fk_inventario_pieza FOREIGN KEY (idPieza) REFERENCES Piezas(idPieza) ON DELETE CASCADE;
ALTER TABLE Inventarios ADD CONSTRAINT fk_inventario_Talleres FOREIGN KEY (idTaller) REFERENCES Talleres(idTaller) ON DELETE CASCADE;
ALTER TABLE HistorialMantenimientos ADD CONSTRAINT fk_mant_automovil FOREIGN KEY (idAutomovil) REFERENCES Automoviles(idAutomovil) ON DELETE CASCADE;
ALTER TABLE HistorialMantenimientos ADD CONSTRAINT fk_mant_Talleres FOREIGN KEY (idTaller) REFERENCES Talleres(idTaller) ON DELETE CASCADE;
ALTER TABLE Contienen ADD CONSTRAINT fk_Contienen_pedido FOREIGN KEY (idPedido) REFERENCES Pedidos(idPedido) ON DELETE CASCADE;
ALTER TABLE Contienen ADD CONSTRAINT fk_Contienen_pieza FOREIGN KEY (idPieza) REFERENCES Piezas(idPieza) ON DELETE CASCADE;
ALTER TABLE CarrosInteresado ADD CONSTRAINT fk_carrosinteresado_comprador FOREIGN KEY (idPersona) REFERENCES Compradores(idPersona) ON DELETE CASCADE;
ALTER TABLE PiezasInteresado ADD CONSTRAINT fk_piezasinteresado_comprador FOREIGN KEY (idPersona) REFERENCES Compradores(idPersona) ON DELETE CASCADE;
ALTER TABLE CarrosComprados ADD CONSTRAINT fk_carroscomprados_comprador FOREIGN KEY (idPersona) REFERENCES Compradores(idPersona) ON DELETE CASCADE;
ALTER TABLE CarrosOfrece ADD CONSTRAINT fk_carrosofrece_vendedor FOREIGN KEY (idPersona) REFERENCES Vendedores(idPersona) ON DELETE CASCADE;
ALTER TABLE AutosCompatibles ADD CONSTRAINT fk_autoscompatibles_pieza FOREIGN KEY (idPieza) REFERENCES Piezas(idPieza) ON DELETE CASCADE;
ALTER TABLE CompraAutos ADD CONSTRAINT fk_CompraAutos_compra FOREIGN KEY (idCompra) REFERENCES Compras(idCompra) ON DELETE CASCADE;
ALTER TABLE CompraAutos ADD CONSTRAINT fk_CompraAutos_auto FOREIGN KEY (idAuto) REFERENCES Automoviles(idAutomovil) ON DELETE CASCADE;
ALTER TABLE CompraPiezas ADD CONSTRAINT fk_CompraPiezas_compra FOREIGN KEY (idCompra) REFERENCES Compras(idCompra) ON DELETE CASCADE;
ALTER TABLE CompraPiezas ADD CONSTRAINT fk_CompraPiezas_pieza FOREIGN KEY (idPieza) REFERENCES Piezas(idPieza) ON DELETE CASCADE;

--Restricciones de Tuplas

ALTER TABLE Compras
ADD CONSTRAINT check_compras_fechas 
CHECK (
    (fechaEntrega IS NULL OR fechaEntrega >= fechaCompra)
    AND
    (estadoPago = 'Realizado' OR fechaEntrega IS NULL)
);

ALTER TABLE Vendedores
ADD CONSTRAINT check_vendedores_concesionario 
CHECK (
    (esConcecionario = 'Si' AND nombreConcecionario IS NOT NULL) 
    OR 
    (esConcecionario = 'No' AND nombreConcecionario IS NULL)
);

ALTER TABLE Pedidos
ADD CONSTRAINT check_pedidos_fechas 
CHECK (fechaPedido < fechaEntregaEstimada);


ALTER TABLE TramitesAduanas
ADD CONSTRAINT check_tramites_fechas 
CHECK (fechaInicio < fechaFin);


ALTER TABLE Importaciones
ADD CONSTRAINT check_importaciones_fechas 
CHECK (fechaSalida < fechaLlegada);


ALTER TABLE Importaciones
ADD CONSTRAINT check_importaciones_puertos 
CHECK (puertoSalida <> puertoLlegada);


ALTER TABLE Homologaciones
ADD CONSTRAINT check_homologaciones_fechas 
CHECK (
    fechaSolicitud <= fechaAprobacion
    AND
    fechaVigenciaHasta > fechaAprobacion
);
