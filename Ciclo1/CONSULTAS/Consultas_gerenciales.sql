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
