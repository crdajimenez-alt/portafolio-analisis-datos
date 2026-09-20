📊 Análisis de Ventas con PostgreSQL
📌 Descripción

Proyecto de análisis de datos desarrollado utilizando PostgreSQL y SQL.

El objetivo es analizar información de clientes y ventas para obtener información sobre el comportamiento de compra, los ingresos generados y la evolución de las ventas.

🎯 Objetivos

El proyecto busca responder preguntas como:

¿Cuánto ha gastado cada cliente?
¿Qué productos generan más ingresos?
¿Qué clientes no han realizado compras?
¿Qué clientes gastan por encima del promedio?
¿Cuál es el ranking de clientes según su gasto?
¿Cómo cambia cada venta respecto a la anterior?
¿Qué porcentaje aumenta o disminuye cada venta?
🗂️ Datos utilizados

El proyecto utiliza dos tablas principales:

Clientes

Contiene información básica de los clientes:

id_cliente
nombre
edad
ciudad
salario
Ventas

Contiene información relacionada con las ventas:

id_venta
id_producto
id_cliente
producto
cantidad
precio
🛠️ Tecnologías utilizadas
PostgreSQL
SQL
GitHub
📚 Técnicas SQL utilizadas

Durante el análisis se aplicaron diferentes técnicas:

SELECT
WHERE
ORDER BY
GROUP BY
HAVING
JOIN
LEFT JOIN
COALESCE
CASE
Subconsultas
CTE (WITH)
AVG()
SUM()
RANK()
LAG()
Funciones de ventana
📊 Análisis realizados
1. Gasto total por cliente

Se calcula cuánto ha gastado cada cliente y se ordenan los resultados de mayor a menor.

2. Ingresos por producto

Se calcula el ingreso total generado por cada producto.

3. Clientes sin compras

Se identifican los clientes registrados que no tienen ninguna venta asociada.

4. Clientes por encima del gasto promedio

Se utiliza una CTE y AVG() para identificar los clientes cuyo gasto supera el promedio.

5. Ranking de clientes

Se utiliza RANK() para establecer la posición de cada cliente según su gasto total.

6. Comparación de ventas consecutivas

Se utiliza LAG() para comparar cada venta con la venta anterior.

7. Clasificación de cambios

Se utiliza CASE para clasificar las ventas como:

Aumento
Disminución
Igual
Sin comparación
8. Porcentaje de cambio

Se calcula el porcentaje de variación entre una venta y la venta anterior.

📁 Archivos
analisis_ventas.sql — contiene todas las consultas utilizadas en el análisis.
🚀 Aprendizaje

Este proyecto forma parte de mi proceso de aprendizaje en análisis de datos, con especial enfoque en PostgreSQL y SQL.

A través del proyecto he practicado desde consultas básicas hasta técnicas más avanzadas como CTE, subconsultas y funciones de ventana.
