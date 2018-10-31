## OpenJDK Base Image(s)

#### JRE
```bash
docker build --build-arg INPUT_JAVA_MAJOR=11 --tag andahme/openjdk-jre:11 --squash openjdk/jre/.

docker tag andahme/openjdk-jre:11 andahme/openjdk-jre:latest
```

#### Older JRE Imges
```bash
docker build --build-arg INPUT_JAVA_MAJOR=10 --tag andahme/openjdk-jre:10 --squash openjdk/jre/.
docker build --build-arg INPUT_JAVA_MAJOR=9 --tag andahme/openjdk-jre:9 --squash openjdk/jre/.
docker build --build-arg INPUT_JAVA_MAJOR=8 --tag andahme/openjdk-jre:8 --squash openjdk/jre/.
```

#### JDK (extends JRE)
```bash
docker build --build-arg INPUT_JAVA_MAJOR=11 --tag andahme/openjdk-jdk:11 --squash openjdk/jdk/.

docker tag andahme/openjdk-jdk:11 andahme/openjdk-jdk:latest
```

#### Older JDK Imges
```bash
docker build --build-arg INPUT_JAVA_MAJOR=10 --tag andahme/openjdk-jdk:10 --squash openjdk/jdk/.
docker build --build-arg INPUT_JAVA_MAJOR=9 --tag andahme/openjdk-jdk:9 --squash openjdk/jdk/.
docker build --build-arg INPUT_JAVA_MAJOR=8 --tag andahme/openjdk-jdk:8 --squash openjdk/jdk/.
```

