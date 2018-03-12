## OpenJDK Base Image(s)

#### JRE
```bash
docker build --tag andahme/openjdk:jre --squash openjdk/jre/.
```
```bash
docker build --build-arg INPUT_JAVA_MAJOR=8 --tag andahme/openjdk:8-jre --squash openjdk/jre/.
```

#### JDK (extends JRE)
```bash
docker build --tag andahme/openjdk:jdk --squash openjdk/jdk/.
```
```bash
docker build --build-arg INPUT_JAVA_MAJOR=8 --tag andahme/openjdk:8-jdk --squash openjdk/jdk/.
```

