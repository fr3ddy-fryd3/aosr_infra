#!/bin/bash
set -e

# Ждём PostgreSQL
echo "🔄 Ждём PostgreSQL на $POSTGRES_HOST:$POSTGRES_PORT..."
until pg_isready -h "$POSTGRES_HOST" -p "$POSTGRES_PORT" -U "$POSTGRES_USER"; do
  sleep 2
done
echo "✅ PostgreSQL готов!"

# Путь к дампу
DUMP_PATH="/backups/backup_$(date +%F_%H-%M-%S).sql"

# Создаём бэкап
echo "📦 Создаём бэкап в $DUMP_PATH..."
pg_dump -h "$POSTGRES_HOST" -p "$POSTGRES_PORT" -U "$POSTGRES_USER" "$POSTGRES_DB" >"$DUMP_PATH"
echo "🎉 Бэкап завершён."

sleep infinity
