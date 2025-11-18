#!/bin/sh

for ip in $(awk '!/^#/ && NF {print $1}' "$HOME/etc/hosts"); do
  echo "$ip" | grep -Eq '^([0-9]{1,3}\.){3}[0-9]{1,3}$' || echo "invalid: $ip"
done
