FROM valkey/valkey:alpine

RUN apk add --no-cache busybox-extras

EXPOSE 6379 10000

CMD sh -c "valkey-server \
  --bind 0.0.0.0 \
  --port 6379 \
  --requirepass \"$VALKEY_PASSWORD\" \
  --protected-mode yes \
  --rename-command FLUSHALL \"\" \
  --rename-command FLUSHDB \"\" \
  --rename-command CONFIG \"\" \
  --rename-command SHUTDOWN \"\" \
  --rename-command KEYS \"\" \
  --maxclients 50 \
  --timeout 60 \
  --tcp-keepalive 300 & \
while true; do \
  echo -e 'HTTP/1.1 200 OK\n\nOK' | nc -l -p 10000; \
done"
