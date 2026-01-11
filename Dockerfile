# Stage 1: Build stage (JDK + Maven)
FROM eclipse-temurin:17-jdk-jammy AS build

WORKDIR /app

# Copy Maven config and source code
COPY pom.xml .
COPY src ./src

# Install Maven and build the app
RUN apt-get update && apt-get install -y maven
RUN mvn clean package -DskipTests

# Stage 2: Runtime stage (JRE only)
FROM eclipse-temurin:17-jre-jammy

WORKDIR /app

# Copy the jar from build stage
COPY --from=build /app/target/*.jar app.jar

EXPOSE 8081

CMD ["java", "-jar", "app.jar"]
