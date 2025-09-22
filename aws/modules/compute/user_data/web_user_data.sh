#!/bin/bash
yum update -y
yum install -y httpd
systemctl start httpd
systemctl enable httpd

# Create a simple index page
cat <<EOF > /var/www/html/index.html
<!DOCTYPE html>
<html>
<head>
    <title>Web Server ${instance_id}</title>
</head>
<body>
    <h1>Welcome to Web Server ${instance_id}</h1>
    <p>This is the web tier of the multi-cloud Terraform infrastructure.</p>
    <p>Server ID: ${instance_id}</p>
</body>
</html>
EOF

# Set proper permissions
chown apache:apache /var/www/html/index.html
