/*

1. Todos los nombre de los campos son en minúsculas.
2. Utilizar guión bajo para los nombres compuestos.
3. No utilizar números en los campos
4. Nombres de las tablas tiene que ir en plural
5. Claves foráneas siempre van en singular
6. El nombre de la tabla debe describir su propósito.
7. Agregar created_at -- updated_at -> creado_el- actualizado_el 

// manejar guid

Normalización:
    Primera regla: Todas la tablas debe tener un id o clave primaria y cada campo debe contener 1 solo valor
    Segunda regla: Cada columna de la tabla debe cumplir con el propósito de dicha tabla, y para esto debemos hacer que cada campo depende del ID de la tabla
    Tercera regla: Los datos no deben ser transitivos (Datos repetidos en una tabla deben sacar se a tabla aparte usuario->ciudad)

*/