CREATE VIEW ComprasEnTramite AS
SELECT * FROM Compras 
WHERE estadoPago = 'Realizado';

CREATE VIEW PedidosEnviados AS
SELECT * FROM Pedidos 
WHERE estadoPedido = 'retrasado';
