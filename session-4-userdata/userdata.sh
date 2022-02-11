     #!/bin/bash
     sudo yum -y install httpd
     sudo systemctl enable httpd
     sudo systemctl start httpd.service
     sudo echo "Hi, web site from USA" >> /var/www/html/index.html