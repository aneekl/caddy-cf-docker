FROM caddy:2.7.6-builder AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/desec \
    --with github.com/greenpau/caddy-security

FROM caddy:2.7.6

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
