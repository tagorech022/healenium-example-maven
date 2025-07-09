FROM maven:3.8.6-eclipse-temurin-17 AS build

WORKDIR /app

# Copy POM and source files from subdirectory
COPY pom.xml .
COPY source-folder/src ./src

# Optional: skip tests during build
RUN mvn clean package -Dmaven.test.skip=true

# Run tests when container starts (optional)
CMD ["mvn", "test"]
