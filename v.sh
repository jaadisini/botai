#!/bin/bash

SERVICE_NAME=$(basename "$(pwd)")

echo "📄 Menampilkan log real-time untuk service: $SERVICE_NAME"
echo "Tekan CTRL + C untuk keluar."

sudo journalctl -u "$SERVICE_NAME" -f -o cat
