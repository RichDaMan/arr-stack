#!/bin/sh
# Generate crontab from environment variables

PAUSE_HOUR=${PAUSE_HOUR:-20}
RESUME_HOUR=${RESUME_HOUR:-6}

cat > /etc/crontabs/root << EOF
# Pause all torrents at ${PAUSE_HOUR}:00
0 ${PAUSE_HOUR} * * * /app/pause-resume.sh pause >> /proc/1/fd/1 2>&1

# Resume all torrents at ${RESUME_HOUR}:00
0 ${RESUME_HOUR} * * * /app/pause-resume.sh resume >> /proc/1/fd/1 2>&1
EOF

echo "qbit-scheduler: pause at ${PAUSE_HOUR}:00, resume at ${RESUME_HOUR}:00 (TZ: ${TZ:-UTC})"

# Run crond in foreground
exec crond -f -l 2
