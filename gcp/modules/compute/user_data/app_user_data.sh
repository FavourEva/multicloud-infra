#!/bin/bash
apt-get update -y
apt-get install -y openjdk-11-jdk

# Create a simple application
mkdir -p /opt/app
cat <<EOF > /opt/app/app.sh
#!/bin/bash
echo "GCP Application Server ${instance_id} is running"
echo "Database endpoint: ${db_endpoint}"
echo "Listening on port 8080"
while true; do
    echo "GCP app server ${instance_id} - \$(date)" >> /var/log/app.log
    sleep 60
done
EOF

chmod +x /opt/app/app.sh

# Create systemd service
cat <<EOF > /etc/systemd/system/app.service
[Unit]
Description=GCP Application Server
After=network.target

[Service]
Type=simple
User=ubuntu
ExecStart=/opt/app/app.sh
Restart=always

[Install]
WantedBy=multi-user.target
EOF

systemctl daemon-reload
systemctl start app
systemctl enable app
