#!/bin/bash
apt-get update -y
apt-get install -y apache2

# Start and enable Apache
systemctl start apache2
systemctl enable apache2

# Create a simple index page
cat > /var/www/html/index.html << EOF
<!DOCTYPE html>
<html>
<head>
    <title>Web Server ${instance_id}</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 40px; }
        .container { max-width: 800px; margin: 0 auto; }
        .header { background-color: #f4f4f4; padding: 20px; border-radius: 5px; }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>Web Server ${instance_id}</h1>
            <p>This is a web server instance running on Azure VM.</p>
            <p>Instance ID: ${instance_id}</p>
            <p>Server Time: $(date)</p>
        </div>
    </div>
</body>
</html>
EOF

# Set proper permissions
chown www-data:www-data /var/www/html/index.html
chmod 644 /var/www/html/index.html
