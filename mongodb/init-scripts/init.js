db = db.getSiblingDB("gvd_database_mongo");

//Colecciones
db.createCollection("libros");
db.createCollection("usuarios");
db.createCollection("prestamos");
db.createCollection("valoraciones");

// Datos
db.libros.insertMany([
  { titulo: "Cien Años de Soledad", autor: "Gabriel García Márquez", genero: "Novela", disponibilidad: true },
  { titulo: "1984", autor: "George Orwell", genero: "Distopía", disponibilidad: true }
]);

db.usuarios.insertMany([
  { nombre: "Juan Pérez", email: "juan.perez@example.com", rol: "lector" },
  { nombre: "Ana Gómez", email: "ana.gomez@example.com", rol: "administrador" }
]);

// Crear lo roles y sus permisos
db.createRole({
  role: "librarianRole",
  privileges: [
    { resource: { db: "gvd_database_mongo", collection: "libros" }, actions: ["find", "insert", "update"] },
    { resource: { db: "gvd_database_mongo", collection: "usuarios" }, actions: ["find", "insert", "update"] },
    { resource: { db: "gvd_database_mongo", collection: "prestamos" }, actions: ["find", "insert", "update"] }
  ],
  roles: []
});

db.createRole({
  role: "readerRole",
  privileges: [
    { resource: { db: "gvd_database_mongo", collection: "libros" }, actions: ["find"] },
    { resource: { db: "gvd_database_mongo", collection: "prestamos" }, actions: ["find"] }
  ],
  roles: []
});


