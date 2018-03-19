```bash
docker run -d --rm --name jenkins \
  --publish 127.0.0.1:8080:8080 \
  --volume jenkins-home:/var/lib/jenkins \
  andahme/jenkins
```


```bash
docker exec -it --user jenkins jenkins cat /var/lib/jenkins/.jenkins/secrets/initialAdminPassword
```

