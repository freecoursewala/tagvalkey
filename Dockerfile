FROM valkey/valkey:alpine

EXPOSE 6379

CMD ["valkey-server", \
     "--bind", "0.0.0.0", \
     "--protected-mode", "yes", \
     "--requirepass", "maku0704"]
