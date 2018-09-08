```bash
docker run -it --rm --name dns \
  --network host \
  -e DNSMASQ_ADDRESS_DOMAIN=local.andah.me \
  -e DNSMASQ_ADDRESS_IP=192.168.99.100 \
  andahme/dnsmasq
```

