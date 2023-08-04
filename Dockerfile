# Use the official Gradle image with JDK 11
FROM gradle:7.2-jdk11 AS build

# Set the working directory inside the image
WORKDIR /app

# Copy the host's build file and source code into the container
COPY build.gradle.kts .
COPY src ./src

# Use Gradle's wrapper to build the project
RUN gradle clean build

# Use a smaller base image for the final product
FROM openjdk:11-jre-slim

# Copy the compiled JAR file from the build stage
COPY --from=build /app/build/libs/*.jar /app/app.jar

# Set the application's entry point
ENTRYPOINT ["java", "-jar", "/app/app.jar"]
