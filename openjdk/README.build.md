# JRE
```bash
docker build --tag andahme/openjdk:jre --squash openjdk/jre/.
docker build --build-arg INPUT_JAVA_MAJOR=8 --tag andahme/openjdk:8-jre --squash openjdk/jre/.
```

# JDK (extends JRE)
```bash
docker build --tag andahme/openjdk:jdk --squash openjdk/jdk/.
docker build --build-arg INPUT_JAVA_MAJOR=8 --tag andahme/openjdk:8-jdk --squash openjdk/jdk/.
```

