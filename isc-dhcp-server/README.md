## QuickStart
```bash
docker run -d --name dhcpd \
  --restart always \
  --network host \
  --volume /etc/dhcp/dhcpd.conf:/etc/dhcp/dhcpd.conf \
  --volume dhcpd-leases:/var/lib/dhcp \
  andahme/isc-dhcp-server:incubator
```


