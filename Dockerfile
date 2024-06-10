FROM caddy:2.8.4-builder AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/desec \
    --with github.com/greenpau/caddy-security \
    --with github.com/lucaslorentz/caddy-docker-proxy/v2

FROM caddy:2.8.4

COPY --from=builder /usr/bin/caddy /usr/bin/caddy

CMD ["caddy", "docker-proxy"]
