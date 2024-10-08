# Use the official Tomcat 10.1.26 image with JDK 21 from the Docker Hub
FROM tomcat:10.1.26-jdk21

# Set the working directory in the container
WORKDIR /usr/local/tomcat

# Remove the default web apps
RUN rm -rf webapps/*

# Copy the WAR file to the webapps directory of Tomcat
COPY target/simple.war /usr/local/tomcat/webapps/ROOT.war

# Expose port 8088 for Tomcat
EXPOSE 8088

# Update Tomcat configuration to listen on port 8088
#RUN sed -i 's/8080/8088/' conf/server.xml

# Command to run Tomcat
CMD ["catalina.sh", "run"]
