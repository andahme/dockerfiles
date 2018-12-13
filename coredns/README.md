## QuickStart
```bash
docker run -d --name coredns \
  --restart always \
  --publish 10.10.0.1:53:5353 \
  --publish 10.10.0.1:53:5353/udp \
  --volume /etc/coredns:/etc/coredns \
  andahme/coredns:incubator
```


