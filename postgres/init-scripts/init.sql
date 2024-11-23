-- T.Libros
CREATE TABLE IF NOT EXISTS librosPg (
    _id SERIAL PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    autor VARCHAR(255) NOT NULL,
    isbn VARCHAR(20) UNIQUE NOT NULL, --unico
    copias_disponibles INT DEFAULT 1,
    categorias VARCHAR(100)[]
);

-- T.Usuarios
CREATE TABLE IF NOT EXISTS usuariosPg (
    _id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL, --unico
    prestamos_activos INT[] DEFAULT '{}'
);

-- T.Préstamos
CREATE TABLE IF NOT EXISTS prestamosPg (
    _id SERIAL PRIMARY KEY,
    libro_id INT REFERENCES librosPg(_id) ON DELETE CASCADE,
    usuario_id INT REFERENCES usuariosPg(_id) ON DELETE CASCADE,
    fecha_prestamo DATE DEFAULT CURRENT_DATE,
    fecha_devolucion DATE,
    estado VARCHAR(20) CHECK (estado IN ('activo', 'devuelto'))
);

-- T.Valoraciones
CREATE TABLE IF NOT EXISTS valoracionesPg (
    _id SERIAL PRIMARY KEY,
    libro_id INT REFERENCES librosPg(_id) ON DELETE CASCADE,
    usuario_id INT REFERENCES usuariosPg(_id) ON DELETE CASCADE,
    contenido TEXT,
    valoracion INT CHECK (valoracion BETWEEN 1 AND 5), --validaciónes
    fecha_resena DATE DEFAULT CURRENT_DATE
);

-- Insertar libros
INSERT INTO librosPg (titulo, autor, isbn, copias_disponibles, categorias) VALUES 
('Cien Años de Soledad', 'Gabriel García Márquez', '9780060883287', 5, ARRAY['Novela', 'Realismo mágico']),
('1984', 'George Orwell', '9780451524935', 3, ARRAY['Distopía', 'Ciencia ficción']),
('Don Quijote de la Mancha', 'Miguel de Cervantes', '9788491050499', 2, ARRAY['Novela', 'Clásico']),
('El Principito', 'Antoine de Saint-Exupéry', '9780156012195', 4, ARRAY['Fábula', 'Infantil']),
('Orgullo y Prejuicio', 'Jane Austen', '9788491050406', 6, ARRAY['Romance', 'Clásico']),
('Crimen y Castigo', 'Fiódor Dostoyevski', '9780140449136', 4, ARRAY['Novela', 'Drama']),
('La Odisea', 'Homero', '9780140268867', 3, ARRAY['Poesía', 'Épico']),
('La Divina Comedia', 'Dante Alighieri', '9780140448955', 1, ARRAY['Poesía', 'Épico']),
('Harry Potter y la Piedra Filosofal', 'J.K. Rowling', '9781408855898', 7, ARRAY['Fantástico', 'Juvenil']),
('El Hobbit', 'J.R.R. Tolkien', '9780261102217', 5, ARRAY['Fantástico', 'Aventura']);

-- Insertar usuarios
INSERT INTO usuariosPg (nombre, email, prestamos_activos) VALUES 
('Juan Pérez', 'juan.perez@example.com', ARRAY[1]),
('Ana Gómez', 'ana.gomez@example.com', ARRAY[2, 4]),
('Carlos Ruiz', 'carlos.ruiz@example.com', ARRAY[5]),
('Laura Nieto', 'laura.nieto@example.com', ARRAY[0]),
('Marta Sanz', 'marta.sanz@example.com', ARRAY[3]),
('Pedro Jiménez', 'pedro.jimenez@example.com', ARRAY[0]),
('Sofía López', 'sofia.lopez@example.com', ARRAY[6]),
('Luis Torres', 'luis.torres@example.com', ARRAY[0]),
('Elena González', 'elena.gonzalez@example.com', ARRAY[0]),
('Daniel Fuentes', 'daniel.fuentes@example.com', ARRAY[7]);

-- Insertar préstamos
INSERT INTO prestamosPg (libro_id, usuario_id, fecha_prestamo, fecha_devolucion, estado) VALUES 
(1, 1, '2024-11-01', '2024-11-10', 'devuelto'),
(2, 2, '2024-11-02', NULL, 'activo'),
(3, 3, '2024-11-03', NULL, 'activo'),
(4, 2, '2024-11-04', '2024-11-15', 'devuelto'),
(5, 4, '2024-11-05', NULL, 'activo'),
(6, 5, '2024-11-06', '2024-11-20', 'devuelto'),
(7, 6, '2024-11-07', NULL, 'activo'),
(8, 1, '2024-11-08', '2024-11-18', 'devuelto'),
(9, 7, '2024-11-09', NULL, 'activo'),
(10, 8, '2024-11-10', '2024-11-15', 'devuelto');

-- Insertar valoraciones
INSERT INTO valoracionesPg (libro_id, usuario_id, contenido, valoracion, fecha_resena) VALUES 
(1, 1, 'Un libro fascinante que aborda temas profundos y complejos.', 5, '2024-11-12'),
(2, 2, 'Interesante, pero un poco denso en algunas partes.', 4, '2024-11-13'),
(3, 3, 'Una obra maestra de la literatura clásica.', 5, '2024-11-14'),
(4, 4, 'Es hermoso y triste a la vez, perfecto para niños y adultos.', 5, '2024-11-15'),
(5, 5, 'Una de mis novelas románticas favoritas.', 5, '2024-11-16'),
(6, 6, 'La historia y los personajes son muy complejos y fascinantes.', 4, '2024-11-17'),
(7, 7, 'Una epopeya maravillosa, aunque algo difícil de leer en algunos tramos.', 3, '2024-11-18'),
(8, 8, 'Un clásico de la literatura antigua que merece ser leído al menos una vez.', 4, '2024-11-19'),
(9, 9, 'Un inicio de saga fantástico y muy entretenido.', 5, '2024-11-20'),
(10, 10, 'Una historia de aventuras que te atrapa de principio a fin.', 5, '2024-11-21'),
(1, 2, 'Un libro que me dejó pensando por mucho tiempo.', 5, '2024-11-22'),
(2, 3, 'Tiene muchas ideas interesantes sobre el control y la libertad.', 4, '2024-11-23'),
(3, 4, 'Un clásico de la literatura, aunque puede ser largo para algunos.', 4, '2024-11-24');
