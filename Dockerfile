FROM openjdk:18
WORKDIR /app
COPY target/Devops-automation-0.0.1-SNAPSHOT.jar /app
EXPOSE 8084
CMD ["java","-jar","Devops-automation-0.0.1-SNAPSHOT.jar"]

