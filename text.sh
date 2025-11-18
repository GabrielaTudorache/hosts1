#!/bin/bash

if [ $# -eq 0 ]; then
    echo "Eroare: Trebuie sa specifici un fisier!"
    exit 1
fi

HOSTS_FILE="$1"

if [ ! -f "$HOSTS_FILE" ]; then
    echo "Eroare: Fisierul '$HOSTS_FILE' nu exista!"
    exit 1
fi

echo "Verificare adrese IP din $HOSTS_FILE"

valid=0
invalid=0

while read -r line; do
    if [[ -z "$line" || "$line" =~ ^# ]]; then
        continue
    fi
    
    ip=$(echo $line | cut -d' ' -f1)
    
    hostname=$(echo $line | cut -d' ' -f2)
    
    if [[ $ip =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
        echo "VALID: $ip -> $hostname"
        valid=$((valid + 1))
    else
        echo "INVALID: $ip -> $hostname"
        invalid=$((invalid + 1))
    fi
    
done < "$HOSTS_FILE"

echo "Verificare completa!"
echo "Adrese valide: $valid"
echo "Adrese invalide: $invalid"

#modificat de studentul A