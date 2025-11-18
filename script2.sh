#!/bin/sh

[ -f "$1" ] || { echo "fisier inexistent"; exit 1; }

for ip in $(awk '!/^#/ && NF {print $1}' "$1"); do
  echo "$ip" | grep -Eq '^([0-9]{1,3}\.){3}[0-9]{1,3}$' || echo "invalid: $ip"
done
