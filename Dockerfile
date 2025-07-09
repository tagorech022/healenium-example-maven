# Stage 1: Build using Maven and Java 17
FROM maven:3.9.6-eclipse-temurin-17 AS build

# Set working directory
WORKDIR /app

# Copy all files
COPY . .

# Build the project without tests (optional: add `-DskipTests`)
RUN mvn clean package -DskipTests

# Stage 2: Run using Java 17 JRE
FROM eclipse-temurin:17-jre

# Create working directory
WORKDIR /app

# Copy the built JAR files (adjust path if necessary)
COPY --from=build /app/healenium-web-selenoid/target/*.jar app.jar

# Expose Healenium port if needed
EXPOSE 7878

# Run the application
ENTRYPOINT ["java", "-jar", "app.jar"]
