-- TRIGGER 1: Pedido entregado - actualiza fechaEntrega
estado no válido por CHECK constraint)
UPDATE Pedidos SET estadoPedido = 'entregadisimo' WHERE idPedido = 'PED-00002';


-- TRIGGER 30: fechaFactura = fechaCompra
-- fecha diferente
INSERT INTO Facturas VALUES ('FAC-99998', DATE '2024-01-01', 'COM-00001');

-- TRIGGER 31: Bajar cantidad de automóvil
-- idAuto no existe
INSERT INTO CompraAutos VALUES ('COM-99998', 'AUT-99999');


-- TRIGGER 32: Validar tipoPersona para Compradores
-- persona tipo 'vendedor'
INSERT INTO Compradores VALUES ('VEN-00001', 'FAC-99998');

-- TRIGGER 33: Validar tipoPersona para Vendedores
INSERT INTO Personas VALUES ('VEN-99999', 'Vendedor Prueba', 'Calle Test', '3999999999', 'test@vendedor.com', 'vendedor', '999999999', 'Colombia', DATE '2024-01-01');
-- persona tipo 'comprador'
INSERT INTO Vendedores VALUES ('CDR-00001', 'No', NULL, 'DocPrueba.pdf');


-- TRIGGERS 2-29: Actualización de PK
-- actualizar a un ID que ya existe - viola PK
UPDATE Personas SET idPersona = 'CDR-00002' WHERE idPersona = 'CDR-00001';

