# Use the official Gradle image with JDK 11
FROM gradle:7.2-jdk17 AS build

# Set the working directory inside the image
WORKDIR /app

# Copy the host's build file and source code into the container
COPY build.gradle .
COPY src ./src

# Use Gradle's wrapper to build the project
RUN gradle dist

# Use a smaller base image for the final product
FROM openjdk:17.0.1-jdk-slim

# Copy the compiled JAR file from the build stage
COPY --from=build /app/build/libs/*.jar /app/app.jar

# Set the application's entry point
ENTRYPOINT ["java", "-jar", "/app/app.jar"]
