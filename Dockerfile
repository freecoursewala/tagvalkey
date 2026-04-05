FROM valkey/valkey:alpine

# Install tiny HTTP server
RUN apk add --no-cache busybox-extras

# Expose both ports
EXPOSE 6379 10000

# Start Valkey + fake HTTP server
CMD sh -c "valkey-server --bind 0.0.0.0 --requirepass maku0704 & \
           while true; do echo -e 'HTTP/1.1 200 OK\n\nOK' | nc -l -p 10000; done"
