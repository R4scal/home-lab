#!/bin/bash

TEXTFILE_COLLECTOR_DIR=/var/lib/node-exporter/
METRICS_GROUP=rpi_node
START="$(date +%s)"

sleep 1

CPU_TEMP_RAW=$(</sys/class/thermal/thermal_zone0/temp)

# Write out metrics to a temporary file.
END="$(date +%s)"
cat << EOF > "$TEXTFILE_COLLECTOR_DIR/${METRICS_GROUP}.prom.$$"
${METRICS_GROUP}_duration_seconds $(($END - $START))
${METRICS_GROUP}_last_run_seconds $END
${METRICS_GROUP}_cpu_temperature $CPU_TEMP_RAW
EOF

# Rename the temporary file atomically.
# This avoids the node exporter seeing half a file.
mv "$TEXTFILE_COLLECTOR_DIR/${METRICS_GROUP}.prom.$$" \
  "$TEXTFILE_COLLECTOR_DIR/${METRICS_GROUP}.prom"
