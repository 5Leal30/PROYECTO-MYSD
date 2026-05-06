ALTER TABLE Homologaciones ADD CONSTRAINT fk_homologaciones_automovil FOREIGN KEY (idAuto) REFERENCES Automoviles(idAutomovil) ON DELETE CASCADE;
ALTER TABLE Facturas ADD CONSTRAINT fk_facturas_compra FOREIGN KEY (idCompra) REFERENCES Compras(idCompra) ON DELETE CASCADE;
ALTER TABLE Pedidos ADD CONSTRAINT fk_pedidos_proveedor FOREIGN KEY (idProveedor) REFERENCES Proveedores(idProveedor) ON DELETE CASCADE;
ALTER TABLE TramitesAduanas ADD CONSTRAINT fk_tramites_importacion FOREIGN KEY (idImportacion) REFERENCES Importaciones(idImportacion) ON DELETE CASCADE;
ALTER TABLE TramitesAduanas ADD CONSTRAINT fk_tramites_pedido FOREIGN KEY (idPedido) REFERENCES Pedidos(idPedido) ON DELETE CASCADE;
ALTER TABLE Inventarios ADD CONSTRAINT fk_inventarios_taller FOREIGN KEY (idTaller) REFERENCES Talleres(idTaller) ON DELETE CASCADE;
ALTER TABLE Contienen ADD CONSTRAINT fk_contienen_pieza FOREIGN KEY (idPieza) REFERENCES Piezas(idPieza) ON DELETE CASCADE;
ALTER TABLE Contienen ADD CONSTRAINT fk_contienen_pedido FOREIGN KEY (idPedido) REFERENCES Pedidos(idPedido) ON DELETE CASCADE;

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
