FROM openjdk:11

EXPOSE 8085

ADD target/docker-service.jar docker-service.jar

ENTRYPOINT ["java", "-jar", "docker-service.jar"]