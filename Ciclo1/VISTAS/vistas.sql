CREATE VIEW ComprasEnTramite AS
SELECT * FROM Compras 
WHERE estadoPago = 'Realizado';
