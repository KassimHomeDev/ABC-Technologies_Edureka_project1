# Base Image - Latest supported LTS Ubuntu version
FROM ubuntu:20.04

# Install OpenJDK 8 and wget
RUN apt-get update && \
    apt-get -y upgrade && \
    apt-get -y install openjdk-8-jdk wget

# Create directory for Tomcat
RUN mkdir /usr/local/tomcat

# Download and extract the latest stable Tomcat 9 BINARY version
RUN wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.96/bin/apache-tomcat-9.0.96.tar.gz -O /tmp/apache-tomcat.tar.gz && \
    tar -xvzf /tmp/apache-tomcat.tar.gz -C /usr/local/tomcat --strip-components=1 && \
    rm /tmp/apache-tomcat.tar.gz

# Add execute permissions for catalina.sh
RUN chmod +x /usr/local/tomcat/bin/catalina.sh

# Copy the WAR file from your local directory to Tomcat's webapps folder
COPY target/*.war /usr/local/tomcat/webapps/

# Expose port 8080 for accessing the web application
EXPOSE 8080

# Start Tomcat using the array format
CMD ["/usr/local/tomcat/bin/catalina.sh", "run"]
