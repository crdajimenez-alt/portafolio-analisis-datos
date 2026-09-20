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
