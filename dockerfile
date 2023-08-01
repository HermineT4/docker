# Build the app (use a Java base image)
FROM openjdk:8-jre:latest

# Set the working directory inside the container
WORKDIR /app

# Copy the pom.xml and the cucumber test files into the container
COPY pom.xml ./
COPY src/ ./src

#Download Maven dependencies
RUN apt-get update && apt-get install -y maven
RUN mvn verify clean --fail-never

# Define the command to run your cucumber test
CMD ["mvn", "test"]

