## OpenJDK Base Image(s)

#### JRE
```bash
docker build --build-arg INPUT_JAVA_MAJOR=10 --tag andahme/openjdk:10-jre --squash openjdk/jre/.
docker tag andahme/openjdk:10-jre andahme/openjdk:jre
```

#### Older JRE Imges
```bash
docker build --build-arg INPUT_JAVA_MAJOR=9 --tag andahme/openjdk:9-jre --squash openjdk/jre/.
docker build --build-arg INPUT_JAVA_MAJOR=8 --tag andahme/openjdk:8-jre --squash openjdk/jre/.
```

#### JDK (extends JRE)
```bash
docker build --build-arg INPUT_JAVA_MAJOR=10 --tag andahme/openjdk:10-jdk --squash openjdk/jdk/.
docker tag andahme/openjdk:10-jdk andahme/openjdk:jdk
```

#### Older JDK Imges
```bash
docker build --build-arg INPUT_JAVA_MAJOR=9 --tag andahme/openjdk:9-jdk --squash openjdk/jdk/.
docker build --build-arg INPUT_JAVA_MAJOR=8 --tag andahme/openjdk:8-jdk --squash openjdk/jdk/.
```

