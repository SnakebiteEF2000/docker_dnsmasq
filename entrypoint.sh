#!/bin/sh

if [ -z "$DHCP_START" ] || [ -z "$DHCP_END" ] || [ -z "$DHCP_GATEWAY" ] || [ -z "$DHCP_DNS" ]; then
    echo "error: required env vars not se"
    exit 1
fi

cat > /etc/dnsmasq.conf << EOF
# dhcp config
interface=eth0
dhcp-range=${DHCP_START},${DHCP_END},12h
dhcp-options=option:router,${DHCP_GATEWAY}
dhcp-options=option:dns-server,${DHCP_DNS}

log-dhcp

domain-needed
bogus-priv
no-resolv
no-hosts

keep-in-foreground
EOF

exec "$@"