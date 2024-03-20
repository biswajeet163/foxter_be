# Use Maven image with OpenJDK 17 as base image for building
FROM maven:3.8.3-openjdk-17-slim AS build

# Set the working directory in the container
WORKDIR /app

# Copy the Maven project descriptor
COPY pom.xml .

# Download dependencies
RUN mvn dependency:go-offline

# Copy the source code
COPY src ./src

# Build the application
RUN mvn package -DskipTests

# Use OpenJDK 17 as base image for running
FROM openjdk:17-jdk-alpine

# Set the working directory in the container
WORKDIR /app

# Copy the packaged JAR file from the build stage
COPY --from=build /app/target/my-ecommerce-app.jar .

# Expose the port that the application runs on
EXPOSE 8080

# Specify the command to run the service
CMD ["java", "-jar", "my-ecommerce-app.jar"]
