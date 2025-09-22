#!/bin/bash
apt-get update -y
apt-get install -y openjdk-11-jdk

# Get instance metadata
INSTANCE_NAME=$(curl -H "Metadata-Flavor: Google" http://metadata.google.internal/computeMetadata/v1/instance/name)
ZONE=$(curl -H "Metadata-Flavor: Google" http://metadata.google.internal/computeMetadata/v1/instance/zone | cut -d'/' -f4)

# Create application directory
mkdir -p /opt/app
cd /opt/app

# Create a simple Java application
cat > App.java << EOF
import java.net.*;
import java.io.*;

public class App {
    public static void main(String[] args) throws IOException {
        ServerSocket serverSocket = new ServerSocket(8080);
        System.out.println("App Server $INSTANCE_NAME started on port 8080");
        System.out.println("Database endpoint: ${db_endpoint}");
        
        while (true) {
            Socket clientSocket = serverSocket.accept();
            PrintWriter out = new PrintWriter(clientSocket.getOutputStream(), true);
            
            out.println("HTTP/1.1 200 OK");
            out.println("Content-Type: text/html");
            out.println();
            out.println("<html><body>");
            out.println("<h1>App Server $INSTANCE_NAME</h1>");
            out.println("<p>Zone: $ZONE</p>");
            out.println("<p>Database endpoint: ${db_endpoint}</p>");
            out.println("<p>Server Time: " + new java.util.Date() + "</p>");
            out.println("</body></html>");
            
            clientSocket.close();
        }
    }
}
EOF

# Compile and run the application
javac App.java
nohup java App > /var/log/app.log 2>&1 &
