# Use Maven with Java 17
FROM maven:3.8.6-eclipse-temurin-17 AS build

# Set working directory
WORKDIR /app

# Copy project files
COPY pom.xml .
COPY src ./src

# Build the project (skip tests)
RUN mvn clean install -DskipTests

# Run tests when container starts
CMD ["mvn", "test"]
