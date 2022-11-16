# Documentación API - Cafetería

Esta es una API para acceder a los productos que están en la base de datos de una cafetería.
- url base http://localhost/carpetalocal/api

#ENDPOINTS
-localhost/carpetalocal/api/products (GET)
-localhost/carpetalocal/api/products (POST)
-localhost/carpetalocal/api/products/:ID (GET)
-localhost/carpetalocal/api/products/:ID (PUT)

#Servicios GET
  GET ALL
  Obtiene todos los elementos de la base de datos.
  ```bash
  localhost/carpetalocal/api/products
  ```

  GET BY ID
  Obtiene un producto en particular, especificado por su ID enviada por parámetro.
  ```bash
  localhost/carpetealocal/api/products/5
  ```

  SORT & ORDER
  Ordena utilizando los query params recibidos por GET, el parámetro 'sort' define por qué campo van a ser ordenados los elementos, y 'order' define si será ascendente o descendentemente, teniendo como default 'nombre' y 'asc' respectivamente.
  sort:
    - id
    - nombre
    - descripcion
    - cantidad
    - precioBase
    - id_marca_fk
  order:
    - asc
    - desc
    
  ```bash
  localhost/carpetalocal/api/products?sort=nombre&order=asc
  localhost/carpetalocal/api/products?sort=precioBase&order=desc
  ```
  
  FILTER
  Filtra utilizando el query param "marca" recibido por GET. Obtiene todos los productos que sean de la marca especificada.
  marcas:
    - Volcanica
    - JAVA
    - CoffeeBean
    - Death Wish
    - Wild Jo
    
  ```bash
  localhost/carpetalocal/api/products?marca=JAVA
  localhost/carpetalocal/api/products?marca=CoffeeBean
  ```
  
  PAGINATION
  Realiza una paginación del contenido utilizando los query params recibidos por GET, el parámetro 'page' define qué página se va a devolver, y 'limit' la cantidad de elementos que se van a mostrar por página. Ambos parámetros pueden recibir valores numéricos mayores a 0.
  
  ```bash
  localhost/carpetalocal/api/products?page=1&limit=5
  ```
  
  Se pueden combinar sort&order con page&limit si lo deseamos.
  
  ```bash
  localhost/carpetalocal/api/products?sort=cantidad&order=asc&page=2&limit=10
  ```
  
#Servicio POST
  Podemos agregar un producto a la base de datos con este servicio.
  ```bash
  (POST) localhost/carpetalocal/api/products
  ```
  ejemplo de cómo debemos armar el producto:
  ```bash
  {
    "nombre": "Café Tandilense",
    "descripcion": "Este café tiene uno de los mejores sabores regionales, ideal para acompañar con un buen salamín.",
    "cantidad": 350,
    "precioBase": 2500,
    "id_marca_fk": 2
  }
  ```
  
#Servicio PUT
  Con este servicio podemos modificar cualquier elemento de la base de datos, especificando su ID.
  ```bash
  (PUT) localhost/carpetalocal/api/products/14
  ```
  e indicando los valores a modificar tal como en el servicio POST, sin necesidad de rellenar si o si todos los campos, los campos no especificados no se verán modificados.
  ```bash
  {
    "nombre": "Café Tandil",
    "precioBase": 3500
  }
  ```




















