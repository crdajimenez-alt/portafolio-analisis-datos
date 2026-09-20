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

El proyecto utiliza dos tablas principales.

Clientes

id_cliente

nombre

edad

ciudad

salario

Ventas

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

SUM()

AVG()

RANK()

LAG()

Funciones de ventana

📊 Resultados

1. Gasto total por cliente

---------------------------
| Cliente	| Total gastado |
|---------|---------------|
| Luis	  | 4,500         |
| Ana	    | 3,000         |
| Carlos	| 400           |
| María	  | 0             |
| Sofía	  | 0             |

Luis registra el mayor gasto con 4,500, seguido por Ana con 3,000.

2. Ingresos por producto

Producto	Ingresos

Laptop	6,000

Monitor	1,500

Teclado	200

Mouse	200

Laptop registra 6,000 en ingresos, mientras que Monitor registra 1,500 y Teclado y Mouse 200 cada uno.

3. Clientes sin compras

El análisis identificó dos clientes sin ventas asociadas:

Cliente	Ciudad
María	Barranquilla
Sofía	Cali
4. Clientes por encima del gasto promedio
Cliente	Total gastado
Luis	4,500
Ana	3,000

Estos son los clientes cuyo gasto se encuentra por encima del promedio calculado sobre todos los clientes.

5. Ranking de clientes
Cliente	Total gastado	Ranking
Luis	4,500	1
Ana	3,000	2
Carlos	400	3
María	0	4
Sofía	0	4

María y Sofía comparten la posición 4 debido a que ambas tienen un gasto total de 0.

6. Comparación de ventas consecutivas
ID	Producto	Venta	Venta anterior	Cambio
101	Laptop	3,000	—	—
102	Mouse	200	3,000	-2,800
103	Teclado	200	200	0
104	Monitor	1,500	200	+1,300
105	Laptop	3,000	1,500	+1,500

Se utilizó LAG() para comparar cada venta con la venta inmediatamente anterior según id_venta.

7. Clasificación de cambios
ID	Producto	Cambio	Clasificación
101	Laptop	—	Sin comparación
102	Mouse	-2,800	Disminución
103	Teclado	0	Igual
104	Monitor	+1,300	Aumento
105	Laptop	+1,500	Aumento

Se utilizó CASE para transformar los cambios numéricos en categorías interpretables.

8. Porcentaje de cambio
ID	Producto	Cambio	Porcentaje
101	Laptop	—	—
102	Mouse	-2,800	-93.33%
103	Teclado	0	0%
104	Monitor	+1,300	+650%
105	Laptop	+1,500	+100%

El porcentaje se calculó comparando cada venta con la venta anterior.

🧠 Aprendizajes

Este proyecto me permitió aplicar conceptos de SQL desde consultas básicas hasta técnicas de análisis más avanzadas.

Entre los principales aprendizajes se encuentran:

Uso de JOIN y LEFT JOIN.

Agregación y agrupación de datos.

Uso de CTE para estructurar consultas.

Subconsultas.

Clasificación de información mediante CASE.

Ranking mediante funciones de ventana.

Comparación de registros mediante LAG().

Cálculo de variaciones porcentuales.

📁 Archivos

analisis_ventas.sql — contiene las consultas SQL utilizadas para realizar el análisis.

🚀 Próximos proyectos

Este proyecto forma parte de mi proceso de aprendizaje en análisis de datos.

Próximamente incorporaré proyectos utilizando:

SQL y PostgreSQL

Python

Pandas

Visualización de datos

Power BI
