FROM maven:3.8.6-eclipse-temurin-17 AS build

WORKDIR /app

COPY pom.xml .
COPY src ./src

# Build without running tests
RUN mvn clean install -DskipTests

# Set default command to run tests when container starts
CMD ["mvn", "test"]
