ALTER TABLE Automoviles ADD CONSTRAINT uk_numeroChasis UNIQUE (numeroChasis);
ALTER TABLE Automoviles ADD CONSTRAINT uk_placa UNIQUE (placa);
ALTER TABLE Automoviles ADD CONSTRAINT uk_motor UNIQUE (motor);
ALTER TABLE Proveedores ADD CONSTRAINT uk_proveedor_telefono UNIQUE (telefono);
ALTER TABLE Proveedores ADD CONSTRAINT uk_proveedor_email UNIQUE (email);
ALTER TABLE Importaciones ADD CONSTRAINT uk_importacion UNIQUE (numeroContenedor);
ALTER TABLE Personas ADD CONSTRAINT uk_numeroIdentificacion UNIQUE (numeroIdentificacion);
ALTER TABLE Piezas ADD CONSTRAINT uk_codigoFabrica UNIQUE (codigoFabrica);
