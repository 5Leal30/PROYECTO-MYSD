CREATE VIEW ComprasEnTramite AS
SELECT * FROM Compras 
WHERE estadoPago != 'Finalizado' 
   OR estadoPago = 'finalizado';
