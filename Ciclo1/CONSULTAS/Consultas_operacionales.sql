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
