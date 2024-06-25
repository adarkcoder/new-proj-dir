# Use a specific Maven and JDK version
FROM maven:3.9.7-eclipse-temurin-11 AS build

# Set the working directory
WORKDIR /app

# Copy the project files
COPY . .

# Package the Spring Boot application
RUN mvn clean install -DskipTests

# Use the official OpenJDK image to run the app
FROM openjdk:11-jre-slim

# Set the working directory
WORKDIR /app

# Expose port 8080
EXPOSE 8080

# Copy the jar file from the build stage
COPY --from=build /app/target/*.jar app.jar

# Run the Spring Boot application
ENTRYPOINT ["java", "-jar", "app.jar"]
