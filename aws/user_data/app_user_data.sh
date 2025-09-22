#!/bin/bash
yum update -y
yum install -y java-11-amazon-corretto

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
        System.out.println("App Server ${instance_id} started on port 8080");
        System.out.println("Database endpoint: ${db_endpoint}");
        
        while (true) {
            Socket clientSocket = serverSocket.accept();
            PrintWriter out = new PrintWriter(clientSocket.getOutputStream(), true);
            
            out.println("HTTP/1.1 200 OK");
            out.println("Content-Type: text/html");
            out.println();
            out.println("<html><body>");
            out.println("<h1>App Server ${instance_id}</h1>");
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
