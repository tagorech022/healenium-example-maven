# Use Maven with Java 17
FROM maven:3.8.6-eclipse-temurin-17

# Set working directory inside the container
WORKDIR /app

# Copy POM file first to leverage Docker cache
COPY ../actual-source/pom.xml .

# Copy source code from the actual directory
COPY ../actual-source/src ./src

# Build the project (skip tests to avoid test-time failures)
RUN mvn clean install -DskipTests

# Default command (optional)
CMD ["mvn", "test"]
