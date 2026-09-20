-- ==========================================
-- PROYECTO: ANÁLISIS DE VENTAS
-- Herramienta: PostgreSQL
-- ==========================================


-- 1. Gasto total de cada cliente

SELECT
    c.nombre,
    COALESCE(SUM(v.cantidad * v.precio), 0) AS total_gastado
FROM clientes AS c
LEFT JOIN ventas AS v
    ON c.id_cliente = v.id_cliente
GROUP BY c.nombre
ORDER BY total_gastado DESC;

-- ==========================================
-- 2. Ingresos generados por producto
-- ==========================================

SELECT
    producto,
    SUM(cantidad * precio) AS ingresos_totales
FROM ventas
GROUP BY producto
ORDER BY ingresos_totales DESC;

-- ==========================================
-- 3. Clientes que nunca han realizado compras
-- ==========================================

SELECT
    c.id_cliente,
    c.nombre,
    c.ciudad
FROM clientes AS c
LEFT JOIN ventas AS v
    ON c.id_cliente = v.id_cliente
WHERE v.id_cliente IS NULL
ORDER BY c.nombre;

-- ==========================================
-- 4. Clientes que gastan por encima del promedio
-- ==========================================

WITH gastos_clientes AS (
    SELECT
        c.id_cliente,
        c.nombre,
        COALESCE(SUM(v.cantidad * v.precio), 0) AS total_gastado
    FROM clientes AS c
    LEFT JOIN ventas AS v
        ON c.id_cliente = v.id_cliente
    GROUP BY c.id_cliente, c.nombre
)

SELECT
    id_cliente,
    nombre,
    total_gastado
FROM gastos_clientes
WHERE total_gastado > (
    SELECT AVG(total_gastado)
    FROM gastos_clientes
)
ORDER BY total_gastado DESC;

-- ==========================================
-- 5. Ranking de clientes por gasto total
-- ==========================================

WITH gastos_clientes AS (
    SELECT
        c.id_cliente,
        c.nombre,
        COALESCE(SUM(v.cantidad * v.precio), 0) AS total_gastado
    FROM clientes AS c
    LEFT JOIN ventas AS v
        ON c.id_cliente = v.id_cliente
    GROUP BY c.id_cliente, c.nombre
)

SELECT
    id_cliente,
    nombre,
    total_gastado,
    RANK() OVER (
        ORDER BY total_gastado DESC
    ) AS ranking
FROM gastos_clientes
ORDER BY ranking;

-- ==========================================
-- 6. Comparación de ventas consecutivas
-- ==========================================

WITH analisis_ventas AS (
    SELECT
        id_venta,
        producto,
        cantidad * precio AS total_venta,
        LAG(cantidad * precio) OVER (
            ORDER BY id_venta
        ) AS venta_anterior
    FROM ventas
)

SELECT
    id_venta,
    producto,
    total_venta,
    venta_anterior,
    total_venta - venta_anterior AS cambio
FROM analisis_ventas
ORDER BY id_venta;

-- ==========================================
-- 7. Clasificación del cambio en las ventas
-- ==========================================

WITH analisis_ventas AS (
    SELECT
        id_venta,
        producto,
        cantidad * precio AS total_venta,
        LAG(cantidad * precio) OVER (
            ORDER BY id_venta
        ) AS venta_anterior
    FROM ventas
),

cambios AS (
    SELECT
        id_venta,
        producto,
        total_venta,
        venta_anterior,
        total_venta - venta_anterior AS cambio
    FROM analisis_ventas
)

SELECT
    id_venta,
    producto,
    total_venta,
    venta_anterior,
    cambio,
    CASE
        WHEN venta_anterior IS NULL THEN 'Sin comparación'
        WHEN cambio > 0 THEN 'Aumento'
        WHEN cambio < 0 THEN 'Disminución'
        ELSE 'Igual'
    END AS clasificacion
FROM cambios
ORDER BY id_venta;

-- ==========================================
-- 8. Porcentaje de cambio entre ventas
-- ==========================================

WITH analisis_ventas AS (
    SELECT
        id_venta,
        producto,
        cantidad * precio AS total_venta,
        LAG(cantidad * precio) OVER (
            ORDER BY id_venta
        ) AS venta_anterior
    FROM ventas
),

cambios AS (
    SELECT
        id_venta,
        producto,
        total_venta,
        venta_anterior,
        total_venta - venta_anterior AS cambio
    FROM analisis_ventas
)

SELECT
    id_venta,
    producto,
    total_venta,
    venta_anterior,
    cambio,
    ROUND(
        (cambio::numeric / NULLIF(venta_anterior, 0)) * 100,
        2
    ) AS cambio_porcentaje
FROM cambios
ORDER BY id_venta;
