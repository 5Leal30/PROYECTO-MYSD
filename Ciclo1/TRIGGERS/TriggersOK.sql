-- TRIGGER 1: Pedido entregado - actualiza fechaEntrega
--debe actualizar fechaEntrega
UPDATE Pedidos SET estadoPedido = 'entregado' WHERE idPedido = 'PED-00002';

-- TRIGGER 30: fechaFactura = fechaCompra
-- misma fecha
INSERT INTO Facturas VALUES ('FAC-99999', DATE '2024-10-02', 'COM-00001');


-- TRIGGER 31: Bajar cantidad de automóvil
-- debe bajar cantidad a 2
INSERT INTO CompraAutos VALUES ('COM-99999', 'AUT-00001');

-- TRIGGER 32: Validar tipoPersona para Compradores
-- persona tipo 'comprador'
INSERT INTO Compradores VALUES ('CDR-00001', 'FAC-99999');


-- TRIGGER 33: Validar tipoPersona para Vendedores
-- Primero crear persona vendedor nueva
INSERT INTO Personas VALUES ('VEN-99999', 'Vendedor Prueba', 'Calle Test', '3999999999', 'test@vendedor.com', 'vendedor', '999999999', 'Colombia', DATE '2024-01-01');

-- persona tipo 'vendedor'
INSERT INTO Vendedores VALUES ('VEN-99999', 'No', NULL, 'DocPrueba.pdf');


-- TRIGGERS 2-29: Actualización de PK
-- debe actualizar Compradores automáticamente
UPDATE Personas SET idPersona = 'CDR-99999' WHERE idPersona = 'CDR-00001';

-- Verificar que se actualizó
SELECT * FROM Compradores WHERE idPersona = 'CDR-99999';

-- Restaurar para otras pruebas
UPDATE Personas SET idPersona = 'CDR-00001' WHERE idPersona = 'CDR-99999';



