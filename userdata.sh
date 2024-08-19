#!/bin/bash

# Install httpd
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
    <title>Congratulations to Our Olympic Heroes</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <header>
        <h1>Congratulations to Indian Olympic Winners!</h1>
    </header>
    <section id="winners">
        <article>
            <img src="images/athlete1.jpg" alt="Neeraj Chopra, Javelin Throw">
            <h2>Neeraj Chopra</h2>
            <p>Silver Medalist in Javelin Throw, Paris 2024 Olympics</p>
            <p>Date: August 1, 2024</p>
        </article>
        <article>
            <img src="images/athlete2.jpg" alt="Manu Bhakar, Shooting">
            <h2>Manu Bhakar</h2>
            <p>Bronze Medalist in Shooting, Paris 2024 Olympics</p>
            <p>Date: August, 2024</p>
        </article>
        <!-- Add more winners as needed -->
    </section>
    <footer>
        <p>Page created to honor the achievements of Indian athletes at the Olympic games.</p>
    </footer>
</body>
</html>

EOF
# Restart Apache to serve the new index page
sudo systemctl restart httpd

