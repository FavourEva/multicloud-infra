#!/bin/bash
apt-get update -y
apt-get install -y apache2

# Start and enable Apache
systemctl start apache2
systemctl enable apache2

# Create a simple index page
cat <<EOF > /var/www/html/index.html
<!DOCTYPE html>
<html>
<head>
    <title>GCP Web Server ${instance_id}</title>
</head>
<body>
    <h1>Welcome to GCP Web Server ${instance_id}</h1>
    <p>This is the web tier of the multi-cloud Terraform infrastructure.</p>
    <p>Server ID: ${instance_id}</p>
    <p>Cloud Provider: Google Cloud Platform</p>
</body>
</html>
EOF

# Set proper permissions
chown www-data:www-data /var/www/html/index.html
