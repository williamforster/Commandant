Commandant displays time-based geoJSON on a map

![Screenshot of application](screenshot.png?raw=true "Screenshot")

# Usage

Download xampp or a similar software and find the website directory (htdocs)

Remove the default xampp webpage so the htdocs directory is empty.
Navigate to htdocs and clone into the current directory.

    git clone https://github.com/williamforster/Commandant.git .

Download and install node.
Then install the project dependencies.

    npm install

Open your web browser and type 'localhost/phpmyadmin' in the address bar. Add a new database and run the sql in create_test_datatable.sql - or at least create a table with similar columns.

Add a user account in phpmyadmin and grant them Data priveleges.

Make a credentials.php file and enter the new fields. Credentials.php is in the .gitignore file so it won't be uploaded to the git repo.

    cp credentials_example.php credentials.php
    nano credentials.php

Build bundle.js with browserify. Bundles include only the js needed by the website.

    npm run build

Open localhost in your web browser