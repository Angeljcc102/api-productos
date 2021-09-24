# README

Version 1.0 de la api-productos

## Ruby version
  - 2.7.4p191
 ## Rails version

  - Rails 6.1.4.1

 ## Configuracion

  - Ejecutar el comando bundle para instalar las gemas utilizadas

  - Iniciar servicio con rails s

 ## Tablas de base de datos

  - Categoria : nombre:string not null , descripcion:string not null

  - Producto : nombre:string not null , descripcion:string not null , categoria_id not null

 ## Rutas
 
 La pagina es la siguiente : https://api-productos.herokuapp.com

 ## Rutas de Categoria

  - GET /categoria : Regresa todas las categorias

  - POST /categoria : Crear una nueva categoria

  - GET /categoria/id : Regresa categoria con el id

  - PUT /categoria/id : Actualizar una categoria

  - DELETE /categoria/id : Eliminar una categoria, solo si no tiene productos

  ## Rutas de Producto

  - GET /productos : Regresa todos los productos

  - POST /productos : Crear un nuevo producto

  - GET /productos/id : Regresa un producto

  - PUT /productos/id : Actualizar un producto

  - DELETE /productos/id : Eliminar un producto

  ## Notas

  Errores no manejados como parsing del json o utilizar metodos de petición no soportados en una dirección
  
  En la rama Heroku se encuentra la versión implementada en postgreSQL que funciona igual.
