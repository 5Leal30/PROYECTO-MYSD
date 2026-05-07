INSERT INTO Personas VALUES ('CDR-00001', 'Carlos López', 'Calle 123, Bogotá', '3111111111', 'carlos@email.com', 'comprador', '12345678', 'Colombia', DATE '2024-01-15');
INSERT INTO Personas VALUES ('CDR-00002', 'María García', 'Carrera 45, Medellín', '3222222222', 'maria@email.com', 'comprador', '87654321', 'Colombia', DATE '2024-02-20');
INSERT INTO Personas VALUES ('CDR-00003', 'Juan Pérez', 'Avenida 78, Cali', '3333333333', 'juan@email.com', 'comprador', '11223344', 'Colombia', DATE '2024-03-10');
INSERT INTO Personas VALUES ('CDR-00004', 'Ana Rodríguez', 'Calle 90, Barranquilla', '3444444444', 'ana@email.com', 'comprador', '44332211', 'Colombia', DATE '2024-04-05');
INSERT INTO Personas VALUES ('CDR-00005', 'Pedro Sánchez', 'Transversal 67, Bucaramanga', '3555555555', 'pedro@email.com', 'comprador', '55667788', 'Colombia', DATE '2024-05-12');
INSERT INTO Personas VALUES ('VEN-00001', 'Automotores SAS', 'Calle 10 #20-30, Bogotá', '3666666666', 'ventas@automotores.com', 'vendedor', '901234567', 'Colombia', DATE '2023-01-10');
INSERT INTO Personas VALUES ('VEN-00002', 'Luis Martínez', 'Carrera 50 #15-20, Medellín', '3777777777', 'luis.martinez@autos.com', 'vendedor', '123459876', 'Colombia', DATE '2023-02-14');
INSERT INTO Personas VALUES ('VEN-00003', 'CarroYA Express', 'Avenida Las Américas #45-67, Cali', '3888888888', 'contacto@carroya.com', 'vendedor', '987654321', 'Colombia', DATE '2023-03-20');

INSERT INTO Compradores VALUES ('CDR-00001', 'FAC-00001');
INSERT INTO Compradores VALUES ('CDR-00002', 'FAC-00002');
INSERT INTO Compradores VALUES ('CDR-00003', 'FAC-00003');
INSERT INTO Compradores VALUES ('CDR-00004', 'FAC-00004');
INSERT INTO Compradores VALUES ('CDR-00005', 'FAC-00005');

INSERT INTO Vendedores VALUES ('VEN-00001', 'Si', 'Automotores SAS', 'DocProp001.pdf');
INSERT INTO Vendedores VALUES ('VEN-00002', 'No', NULL, 'DocProp002.pdf');
INSERT INTO Vendedores VALUES ('VEN-00003', 'Si', 'CarroYA Express', 'DocProp003.pdf');

INSERT INTO Talleres VALUES ('TAL-00001', 'Taller Central Bogotá', 'Calle 45 #23-12, Bogotá', '3112000001', 'Jorge Ramírez', 'Mecánica general');
INSERT INTO Talleres VALUES ('TAL-00002', 'AutoServicio Medellín', 'Carrera 32 #5-67, Medellín', '3112000002', 'Carolina Mejía', 'Enderezado y pintura');
INSERT INTO Talleres VALUES ('TAL-00003', 'MegaLubricentro Cali', 'Avenida 5 #12-34, Cali', '3112000003', 'Andrés López', 'Lubricación y frenos');

INSERT INTO Proveedores VALUES ('PRO-00001', 'Toyota Colombia', 'Japón', '3111000001', 'import@toyota.com', 'Calle Industrial 1, Bogotá', 'automotriz', 4.8, DATE '2022-01-01');
INSERT INTO Proveedores VALUES ('PRO-00002', 'Mazda Latino', 'México', '3111000002', 'ventas@mazda.com', 'Av Principal 2, Medellín', 'automotriz', 4.5, DATE '2022-02-10');
INSERT INTO Proveedores VALUES ('PRO-00003', 'Chevrolet Andino', 'Brasil', '3111000003', 'import@chevrolet.com', 'Calle Fábrica 3, Cali', 'automotriz', 4.9, DATE '2022-03-15');
INSERT INTO Proveedores VALUES ('PRO-00004', 'Repuestos Genéricos SA', 'China', '3111000004', 'ventas@repuestos.com', 'Zona Franca 4, Bogotá', 'repuestos', 4.2, DATE '2023-01-20');
INSERT INTO Proveedores VALUES ('PRO-00005', 'Frenos y Más', 'Colombia', '3111000005', 'contacto@frenosymas.com', 'Calle Repuestos 5, Medellín', 'repuestos', 4.7, DATE '2023-02-14');

INSERT INTO Pedidos VALUES ('PED-00001', 'PRO-00001', DATE '2024-10-01', DATE '2024-10-20', 'entregado', 125000000, '10 unidades Toyota Corolla', 'doc_pedido_001.pdf', 2500000);
INSERT INTO Pedidos VALUES ('PED-00002', 'PRO-00002', DATE '2024-10-05', DATE '2024-10-25', 'en camino', 80000000, '5 unidades Mazda CX-5', 'doc_pedido_002.pdf', 1800000);
INSERT INTO Pedidos VALUES ('PED-00003', 'PRO-00003', DATE '2024-10-10', DATE '2024-10-30', 'saliendo', 150000000, '8 unidades Chevrolet Onix', 'doc_pedido_003.pdf', 2000000);
INSERT INTO Pedidos VALUES ('PED-00004', 'PRO-00004', DATE '2024-09-15', DATE '2024-10-05', 'retrasado', 15000000, '500 unidades pastillas de freno', 'doc_pedido_004.pdf', 500000);
INSERT INTO Pedidos VALUES ('PED-00005', 'PRO-00005', DATE '2024-10-08', DATE '2024-10-18', 'entregado', 8500000, '200 unidades bujías NGK', 'doc_pedido_005.pdf', 300000);

INSERT INTO Importaciones VALUES ('IMP-00001', DATE '2024-09-01', DATE '2024-09-25', 'Yokohama', 'Buenaventura', 'MOL Phoenix', 'CONT-001', 'COMPLETADA');
INSERT INTO Importaciones VALUES ('IMP-00002', DATE '2024-09-10', DATE '2024-10-05', 'Veracruz', 'Cartagena', 'Maersk Southampton', 'CONT-002', 'EN ADUANA');
INSERT INTO Importaciones VALUES ('IMP-00003', DATE '2024-09-20', DATE '2024-10-15', 'Shanghai', 'Buenaventura', 'COSCO Shipping', 'CONT-003', 'EN TRANSITO');
INSERT INTO Importaciones VALUES ('IMP-00004', DATE '2024-10-01', DATE '2024-10-20', 'Busan', 'Buenaventura', 'HMM Promise', 'CONT-004', 'EN ADUANA');
INSERT INTO Importaciones VALUES ('IMP-00005', DATE '2024-09-15', DATE '2024-10-08', 'Santos', 'Cartagena', 'Log-In Explorer', 'CONT-005', 'COMPLETADA');

INSERT INTO Compras VALUES ('COM-00001', 'PRO-00001', 'CDR-00001', 'PED-00001', DATE '2024-10-02', 8500000, 'transferencia', 'Realizado', DATE '2024-10-20');
INSERT INTO Compras VALUES ('COM-00002', 'PRO-00004', 'CDR-00002', 'PED-00004', DATE '2024-09-16', 85000, 'Deposito', 'En tramite', NULL);
INSERT INTO Compras VALUES ('COM-00003', 'PRO-00005', 'CDR-00003', 'PED-00005', DATE '2024-10-09', 45000, 'efectivo', 'Realizado', DATE '2024-10-18');
INSERT INTO Compras VALUES ('COM-00004', 'PRO-00002', 'CDR-00001', 'PED-00002', DATE '2024-10-06', 35000, 'transferencia', 'Realizado', DATE '2024-10-25');
INSERT INTO Compras VALUES ('COM-00005', 'PRO-00003', 'CDR-00004', 'PED-00003', DATE '2024-10-11', 450000, 'Deposito', 'En tramite', NULL);

INSERT INTO Piezas VALUES ('PIE-00001', 'PRO-00001', 'COM-00001', 'Motor 2.0L', 'Motor completo para Toyota', 'Toyota Industries', 'motores', 8500000, 'DISPONIBLE', 15, '12 meses', 'MOT-TOY-001');
INSERT INTO Piezas VALUES ('PIE-00002', 'PRO-00004', 'COM-00002', 'Pastillas Freno Delanteras', 'Set pastillas cerámica', 'Bosch', 'frenos', 85000, 'DISPONIBLE', 500, '06 meses', 'BOS-PAST-001');
INSERT INTO Piezas VALUES ('PIE-00003', 'PRO-00005', 'COM-00003', 'Bujía Iridium', 'Bujía de alto rendimiento', 'NGK', 'encendido', 45000, 'DISPONIBLE', 300, '12 meses', 'NGK-BUJ-001');
INSERT INTO Piezas VALUES ('PIE-00004', 'PRO-00002', 'COM-00004', 'Filtro de Aceite', 'Filtro original Mazda', 'Mazda', 'filtros', 35000, 'DISPONIBLE', 200, '06 meses', 'MAZ-FIL-001');
INSERT INTO Piezas VALUES ('PIE-00005', 'PRO-00003', 'COM-00005', 'Amortiguador Trasero', 'Par amortiguadores', 'Monroe', 'suspensión', 450000, 'DISPONIBLE', 80, '12 meses', 'MON-AMO-001');

INSERT INTO Automoviles VALUES ('AUT-00001', 'VEN-00001', 'IMP-00001', 'PIE-00001', 'Toyota', 'Corolla', 2024, 'CHASIS001234', 'ABC 123', 'Blanco', '1800cc', 'Gasolina', 75000000, 82000000, 'DISPONIBLE', 'No', 'Japón', 3, 'Japón', '2ZR-FE', 'Ninguna', 'factura_toyota_001.pdf', '12 meses');
INSERT INTO Automoviles VALUES ('AUT-00002', 'VEN-00002', 'IMP-00002', 'PIE-00004', 'Mazda', 'CX-5', 2024, 'CHASIS002345', 'DEF 456', 'Rojo', '2000cc', 'Gasolina', 120000000, 135000000, 'DISPONIBLE', 'No', 'México', 2, 'México', 'SKYACTIV-G', 'Aros deportivos', 'factura_mazda_002.pdf', '12 meses');
INSERT INTO Automoviles VALUES ('AUT-00003', 'VEN-00003', 'IMP-00003', 'PIE-00002', 'Chevrolet', 'Onix', 2024, 'CHASIS003456', 'GHI 789', 'Negro', '1000cc', 'Gasolina', 55000000, 62000000, 'DISPONIBLE', 'Si', 'Brasil', 5, 'Brasil', '1.0L Turbo', 'Ninguna', 'factura_chevrolet_003.pdf', '12 meses');
INSERT INTO Automoviles VALUES ('AUT-00004', 'VEN-00001', 'IMP-00004', 'PIE-00003', 'Toyota', 'Hilux', 2024, 'CHASIS004567', 'JKL 012', 'Gris', '2800cc', 'Diesel', 160000000, 175000000, 'RESERVADO', 'No', 'Tailandia', 2, 'Tailandia', '2GD-FTV', 'Estribos laterales', 'factura_hilux_004.pdf', '12 meses');
INSERT INTO Automoviles VALUES ('AUT-00005', 'VEN-00002', 'IMP-00005', 'PIE-00005', 'Mazda', 'Mazda3', 2024, 'CHASIS005678', 'MNO 345', 'Azul', '2000cc', 'Gasolina', 85000000, 92000000, 'DISPONIBLE', 'No', 'México', 4, 'México', 'SKYACTIV-G 2.0', 'Techo solar', 'factura_mazda3_005.pdf', '12 meses');


INSERT INTO Facturas VALUES ('FAC-00001', DATE '2024-10-03', 'COM-00001');
INSERT INTO Facturas VALUES ('FAC-00002', DATE '2024-09-17', 'COM-00002');
INSERT INTO Facturas VALUES ('FAC-00003', DATE '2024-10-10', 'COM-00003');
INSERT INTO Facturas VALUES ('FAC-00004', DATE '2024-10-07', 'COM-00004');
INSERT INTO Facturas VALUES ('FAC-00005', DATE '2024-10-12', 'COM-00005');

INSERT INTO TramitesAduanas VALUES ('TRA-00001', 'IMP-00001', 'PED-00001', DATE '2024-09-02', DATE '2024-09-20', 'COMPLETADO', 'Documentos en orden', 'doc_aduanas_001.pdf');
INSERT INTO TramitesAduanas VALUES ('TRA-00002', 'IMP-00002', 'PED-00002', DATE '2024-09-11', DATE '2024-10-10', 'EN_REVISION', 'Pendiente certificado de origen', 'doc_aduanas_002.pdf');
INSERT INTO TramitesAduanas VALUES ('TRA-00003', 'IMP-00003', 'PED-00003', DATE '2024-09-21', DATE '2024-10-20', 'EN_TRAMITE', 'Revisión de documentos', 'doc_aduanas_003.pdf');
INSERT INTO TramitesAduanas VALUES ('TRA-00004', 'IMP-00004', 'PED-00004', DATE '2024-10-02', DATE '2024-10-25', 'PENDIENTE', 'Pendiente pago de aranceles', 'doc_aduanas_004.pdf');

INSERT INTO Inventarios VALUES ('PIE-00001', 'TAL-00001', 'BOD-00001', 10, 'Estante A1', DATE '2024-10-15');
INSERT INTO Inventarios VALUES ('PIE-00002', 'TAL-00002', 'BOD-00002', 200, 'Estante B3', DATE '2024-10-14');
INSERT INTO Inventarios VALUES ('PIE-00003', 'TAL-00003', 'BOD-00003', 150, 'Estante C2', DATE '2024-10-13');
INSERT INTO Inventarios VALUES ('PIE-00004', 'TAL-00001', 'BOD-00004', 80, 'Estante D4', DATE '2024-10-12');

INSERT INTO HistorialMantenimientos VALUES ('MAN-00001', 'AUT-00003', 'TAL-00001', DATE '2024-10-01', 'Preventivo', 'Cambio de aceite y filtros', 250000, 'Filtro aceite, aceite 5W30', 'Pedro Gómez', 'Todo en orden');
INSERT INTO HistorialMantenimientos VALUES ('MAN-00002', 'AUT-00001', 'TAL-00002', DATE '2024-09-25', 'Correctivo', 'Revisión de frenos', 180000, 'Pastillas freno', 'Luis Torres', 'Frenos en buen estado');

INSERT INTO Contienen VALUES ('PED-00001', 'PIE-00001');
INSERT INTO Contienen VALUES ('PED-00002', 'PIE-00004');
INSERT INTO Contienen VALUES ('PED-00003', 'PIE-00002');
INSERT INTO Contienen VALUES ('PED-00004', 'PIE-00005');

INSERT INTO CarrosInteresado VALUES ('CDR-00001', 'Toyota Corolla');
INSERT INTO CarrosInteresado VALUES ('CDR-00002', 'Mazda CX-5');
INSERT INTO CarrosInteresado VALUES ('CDR-00003', 'Chevrolet Onix');

INSERT INTO PiezasInteresado VALUES ('CDR-00001', 'Motor 2.0L');
INSERT INTO PiezasInteresado VALUES ('CDR-00002', 'Pastillas Freno');

INSERT INTO CarrosComprados VALUES ('CDR-00001', 'Toyota Corolla');
INSERT INTO CarrosComprados VALUES ('CDR-00003', 'Chevrolet Onix');

INSERT INTO CarrosOfrece VALUES ('VEN-00001', 'Toyota Corolla');
INSERT INTO CarrosOfrece VALUES ('VEN-00001', 'Toyota Hilux');
INSERT INTO CarrosOfrece VALUES ('VEN-00002', 'Mazda CX-5');
INSERT INTO CarrosOfrece VALUES ('VEN-00002', 'Mazda Mazda3');

INSERT INTO AutosCompatibles VALUES ('PIE-00001', 'Toyota Corolla 2020-2024');
INSERT INTO AutosCompatibles VALUES ('PIE-00002', 'Chevrolet Onix 2019-2024');
INSERT INTO AutosCompatibles VALUES ('PIE-00004', 'Mazda CX-5 2021-2024');

INSERT INTO CompraAutos VALUES ('COM-00001', 'AUT-00001');
INSERT INTO CompraAutos VALUES ('COM-00004', 'AUT-00005');

INSERT INTO CompraPiezas VALUES ('COM-00002', 'PIE-00002');
INSERT INTO CompraPiezas VALUES ('COM-00003', 'PIE-00003');
INSERT INTO CompraPiezas VALUES ('COM-00005', 'PIE-00005');
