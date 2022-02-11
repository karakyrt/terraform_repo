     #!/bin/bash
     sudo yum -y install httpd
     sudo systemctl enable httpd
     sudo systemctl start httpd.service
     sudo echo "Hi, from a ${environment} EC2" >> /var/www/html/index.html
     //Resoult is: Hi, from a dev(this is environtment variables dev, which means-${environment}) EC2 and dev.env taked from variables.tf
     //Hi, from a dev or qa EC2