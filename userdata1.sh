#!/bin/bash


# Install Apache2
sudo yum install httpd -y
sudo systemctl start httpd
sudo systemctl enable httpd


# Create index.html in Apache's root directory
cat <<EOF > /var/www/html/index.html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Congratulations Team India!</title>
</head>
<body>
    <header>
        <h1>Congratulations Team India!</h1>
        <p>Winners of the T20 World Cup!</p>
    </header>
    <section>
        <h2>Highlights of the Match</h2>
        <p>Team India won the T20 World Cup in a thrilling final match, showcasing exceptional skills and teamwork. The players displayed great determination and sportsmanship throughout the tournament, culminating in a well-deserved victory.</p>
    </section>
    <footer>
        <p>Thank you for the unforgettable moments and pride you bring to our nation!</p>
    </footer>
</body>
</html>
EOF

# Restart Apache to serve the new index page
sudo systemctl restart httpd
