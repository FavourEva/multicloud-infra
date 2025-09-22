#!/bin/bash
apt-get update -y
apt-get install -y apache2

# Start and enable Apache
systemctl start apache2
systemctl enable apache2

# Get instance metadata
INSTANCE_NAME=$(curl -H "Metadata-Flavor: Google" http://metadata.google.internal/computeMetadata/v1/instance/name)
ZONE=$(curl -H "Metadata-Flavor: Google" http://metadata.google.internal/computeMetadata/v1/instance/zone | cut -d'/' -f4)

# Create a simple index page
cat > /var/www/html/index.html << EOF
<!DOCTYPE html>
<html>
<head>
    <title>Web Server - $INSTANCE_NAME</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 40px; }
        .container { max-width: 800px; margin: 0 auto; }
        .header { background-color: #f4f4f4; padding: 20px; border-radius: 5px; }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>Web Server - $INSTANCE_NAME</h1>
            <p>This is a web server instance running on Google Cloud Platform.</p>
            <p>Instance Name: $INSTANCE_NAME</p>
            <p>Zone: $ZONE</p>
            <p>Server Time: $(date)</p>
        </div>
    </div>
</body>
</html>
EOF

# Set proper permissions
chown www-data:www-data /var/www/html/index.html
chmod 644 /var/www/html/index.html
