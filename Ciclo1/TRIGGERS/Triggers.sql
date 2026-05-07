CREATE OR REPLACE TRIGGER trg_pedido_entregado_fecha
BEFORE UPDATE OF estadoPedido ON Pedidos
FOR EACH ROW
BEGIN
    IF :NEW.estadoPedido = 'entregado' THEN
        UPDATE Compras 
        SET fechaEntrega = SYSDATE
        WHERE idPedido = :NEW.idPedido;
    END IF;
END;
/

CREATE OR REPLACE TRIGGER trg_update_compradores_pk
AFTER UPDATE OF idPersona ON Personas
FOR EACH ROW
BEGIN
    UPDATE Compradores SET idPersona = :NEW.idPersona WHERE idPersona = :OLD.idPersona;
END;
/

CREATE OR REPLACE TRIGGER trg_update_vendedores_pk
AFTER UPDATE OF idPersona ON Personas
FOR EACH ROW
BEGIN
    UPDATE Vendedores SET idPersona = :NEW.idPersona WHERE idPersona = :OLD.idPersona;
END;
/


CREATE OR REPLACE TRIGGER trg_update_compras_proveedor
AFTER UPDATE OF idProveedor ON Proveedores
FOR EACH ROW
BEGIN
    UPDATE Compras SET idProveedor = :NEW.idProveedor WHERE idProveedor = :OLD.idProveedor;
END;
/


CREATE OR REPLACE TRIGGER trg_update_compras_comprador
AFTER UPDATE OF idPersona ON Compradores
FOR EACH ROW
BEGIN
    UPDATE Compras SET idComprador = :NEW.idPersona WHERE idComprador = :OLD.idPersona;
END;
/


CREATE OR REPLACE TRIGGER trg_update_compras_pedido
AFTER UPDATE OF idPedido ON Pedidos
FOR EACH ROW
BEGIN
    UPDATE Compras SET idPedido = :NEW.idPedido WHERE idPedido = :OLD.idPedido;
END;
/


CREATE OR REPLACE TRIGGER trg_update_piezas_proveedor
AFTER UPDATE OF idProveedor ON Proveedores
FOR EACH ROW
BEGIN
    UPDATE Piezas SET idProveedor = :NEW.idProveedor WHERE idProveedor = :OLD.idProveedor;
END;
/


CREATE OR REPLACE TRIGGER trg_update_piezas_compra
AFTER UPDATE OF idCompra ON Compras
FOR EACH ROW
BEGIN
    UPDATE Piezas SET idCompra = :NEW.idCompra WHERE idCompra = :OLD.idCompra;
END;
/


CREATE OR REPLACE TRIGGER trg_update_automoviles_vendedor
AFTER UPDATE OF idPersona ON Vendedores
FOR EACH ROW
BEGIN
    UPDATE Automoviles SET idVendedor = :NEW.idPersona WHERE idVendedor = :OLD.idPersona;
END;
/


CREATE OR REPLACE TRIGGER trg_update_automoviles_importacion
AFTER UPDATE OF idImportacion ON Importaciones
FOR EACH ROW
BEGIN
    UPDATE Automoviles SET idImportacion = :NEW.idImportacion WHERE idImportacion = :OLD.idImportacion;
END;
/


CREATE OR REPLACE TRIGGER trg_update_automoviles_pieza
AFTER UPDATE OF idPieza ON Piezas
FOR EACH ROW
BEGIN
    UPDATE Automoviles SET idPieza = :NEW.idPieza WHERE idPieza = :OLD.idPieza;
END;
/


CREATE OR REPLACE TRIGGER trg_update_pedidos_proveedor
AFTER UPDATE OF idProveedor ON Proveedores
FOR EACH ROW
BEGIN
    UPDATE Pedidos SET idProveedor = :NEW.idProveedor WHERE idProveedor = :OLD.idProveedor;
END;
/


CREATE OR REPLACE TRIGGER trg_update_tramites_importacion
AFTER UPDATE OF idImportacion ON Importaciones
FOR EACH ROW
BEGIN
    UPDATE TramitesAduanas SET idImportacion = :NEW.idImportacion WHERE idImportacion = :OLD.idImportacion;
END;
/


CREATE OR REPLACE TRIGGER trg_update_tramites_pedido
AFTER UPDATE OF idPedido ON Pedidos
FOR EACH ROW
BEGIN
    UPDATE TramitesAduanas SET idPedido = :NEW.idPedido WHERE idPedido = :OLD.idPedido;
END;
/


CREATE OR REPLACE TRIGGER trg_update_inventarios_pieza
AFTER UPDATE OF idPieza ON Piezas
FOR EACH ROW
BEGIN
    UPDATE Inventarios SET idPieza = :NEW.idPieza WHERE idPieza = :OLD.idPieza;
END;
/


CREATE OR REPLACE TRIGGER trg_update_inventarios_taller
AFTER UPDATE OF idTaller ON Talleres
FOR EACH ROW
BEGIN
    UPDATE Inventarios SET idTaller = :NEW.idTaller WHERE idTaller = :OLD.idTaller;
END;
/


CREATE OR REPLACE TRIGGER trg_update_mantenimientos_auto
AFTER UPDATE OF idAutomovil ON Automoviles
FOR EACH ROW
BEGIN
    UPDATE HistorialMantenimientos SET idAutomovil = :NEW.idAutomovil WHERE idAutomovil = :OLD.idAutomovil;
END;
/


CREATE OR REPLACE TRIGGER trg_update_mantenimientos_taller
AFTER UPDATE OF idTaller ON Talleres
FOR EACH ROW
BEGIN
    UPDATE HistorialMantenimientos SET idTaller = :NEW.idTaller WHERE idTaller = :OLD.idTaller;
END;
/


CREATE OR REPLACE TRIGGER trg_update_contienen_pedido
AFTER UPDATE OF idPedido ON Pedidos
FOR EACH ROW
BEGIN
    UPDATE Contienen SET idPedido = :NEW.idPedido WHERE idPedido = :OLD.idPedido;
END;
/


CREATE OR REPLACE TRIGGER trg_update_contienen_pieza
AFTER UPDATE OF idPieza ON Piezas
FOR EACH ROW
BEGIN
    UPDATE Contienen SET idPieza = :NEW.idPieza WHERE idPieza = :OLD.idPieza;
END;
/


CREATE OR REPLACE TRIGGER trg_update_carrosinteresado_persona
AFTER UPDATE OF idPersona ON Personas
FOR EACH ROW
BEGIN
    UPDATE CarrosInteresado SET idPersona = :NEW.idPersona WHERE idPersona = :OLD.idPersona;
END;
/


CREATE OR REPLACE TRIGGER trg_update_piezasinteresado_persona
AFTER UPDATE OF idPersona ON Personas
FOR EACH ROW
BEGIN
    UPDATE PiezasInteresado SET idPersona = :NEW.idPersona WHERE idPersona = :OLD.idPersona;
END;
/


CREATE OR REPLACE TRIGGER trg_update_carroscomprados_persona
AFTER UPDATE OF idPersona ON Personas
FOR EACH ROW
BEGIN
    UPDATE CarrosComprados SET idPersona = :NEW.idPersona WHERE idPersona = :OLD.idPersona;
END;
/


CREATE OR REPLACE TRIGGER trg_update_carrosofrece_vendedor
AFTER UPDATE OF idPersona ON Vendedores
FOR EACH ROW
BEGIN
    UPDATE CarrosOfrece SET idPersona = :NEW.idPersona WHERE idPersona = :OLD.idPersona;
END;
/


CREATE OR REPLACE TRIGGER trg_update_autoscompatibles_pieza
AFTER UPDATE OF idPieza ON Piezas
FOR EACH ROW
BEGIN
    UPDATE AutosCompatibles SET idPieza = :NEW.idPieza WHERE idPieza = :OLD.idPieza;
END;
/


CREATE OR REPLACE TRIGGER trg_update_compraautos_compra
AFTER UPDATE OF idCompra ON Compras
FOR EACH ROW
BEGIN
    UPDATE CompraAutos SET idCompra = :NEW.idCompra WHERE idCompra = :OLD.idCompra;
END;
/


CREATE OR REPLACE TRIGGER trg_update_compraautos_auto
AFTER UPDATE OF idAutomovil ON Automoviles
FOR EACH ROW
BEGIN
    UPDATE CompraAutos SET idAuto = :NEW.idAutomovil WHERE idAuto = :OLD.idAutomovil;
END;
/


CREATE OR REPLACE TRIGGER trg_update_comprapiezas_compra
AFTER UPDATE OF idCompra ON Compras
FOR EACH ROW
BEGIN
    UPDATE CompraPiezas SET idCompra = :NEW.idCompra WHERE idCompra = :OLD.idCompra;
END;
/


CREATE OR REPLACE TRIGGER trg_update_comprapiezas_pieza
AFTER UPDATE OF idPieza ON Piezas
FOR EACH ROW
BEGIN
    UPDATE CompraPiezas SET idPieza = :NEW.idPieza WHERE idPieza = :OLD.idPieza;
END;
/


CREATE OR REPLACE TRIGGER trg_factura_fecha_compra
BEFORE INSERT OR UPDATE ON Facturas
FOR EACH ROW
DECLARE
    v_fechaCompra DATE;
BEGIN
    SELECT fechaCompra INTO v_fechaCompra 
    FROM Compras WHERE idCompra = :NEW.idCompra;
    
    IF :NEW.fechaFactura <> v_fechaCompra THEN
        RAISE_APPLICATION_ERROR(-20001, 'La fecha de la factura debe ser igual a la fecha de compra');
    END IF;
END;
/


CREATE OR REPLACE TRIGGER trg_compra_auto_bajar_cantidad
AFTER INSERT ON CompraAutos
FOR EACH ROW
BEGIN
    UPDATE Automoviles 
    SET cantidad = cantidad - 1
    WHERE idAutomovil = :NEW.idAuto;
END;
/


CREATE OR REPLACE TRIGGER trg_validar_comprador_tipo
BEFORE INSERT ON Compradores
FOR EACH ROW
DECLARE
    v_tipo VARCHAR2(20);
BEGIN
    SELECT tipoPersona INTO v_tipo FROM Personas WHERE idPersona = :NEW.idPersona;
    
    IF v_tipo != 'comprador' THEN
        RAISE_APPLICATION_ERROR(-20002, 'La persona debe ser de tipo comprador para insertarla en Compradores');
    END IF;
END;
/


CREATE OR REPLACE TRIGGER trg_validar_vendedor_tipo
BEFORE INSERT ON Vendedores
FOR EACH ROW
DECLARE
    v_tipo VARCHAR2(20);
BEGIN
    SELECT tipoPersona INTO v_tipo FROM Personas WHERE idPersona = :NEW.idPersona;
    
    IF v_tipo != 'vendedor' THEN
        RAISE_APPLICATION_ERROR(-20003, 'La persona debe ser de tipo vendedor para insertarla en Vendedores');
    END IF;
END;
/
