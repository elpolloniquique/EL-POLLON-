-- Opcional: columna dedicada para repartidor.
-- El panel admin ya guarda repartidor en datos_json.repartidor sin ejecutar esta migración.

ALTER TABLE pedidos ADD COLUMN IF NOT EXISTS repartidor TEXT DEFAULT '';
