FROM maven AS builder
WORKDIR /usr/src/cs6400/
COPY ./ ./
RUN ["mvn", "package"]

# Copy the jar and test scenarios into our final image
FROM openjdk:17
WORKDIR /usr/src/cs6400/
COPY --from=builder /usr/src/cs6400/target/household-1.0.0.jar ./api.jar
EXPOSE 9090
CMD ["java", "-jar", "-Dspring.profiles.active=local", "api.jar"]