This is a fork of [Jekkos OSPOS](https://github.com/jekkos/opensourcepos)
Open Source Point of Sale is a web based point of sale system written in the PHP language. It uses MySQL as the data storage back-end and has a simple user interface.

[![Build Status](https://travis-ci.org/jekkos/opensourcepos.svg?branch=master)](https://travis-ci.org/jekkos/opensourcepos)

How to Install
--------------
1. Create/locate a new mysql database to install open source point of sale into
2. Execute the file database/database.sql to create the tables needed
3. unzip and upload Open Source Point of Sale files to web server
4. Copy application/config/database.php.tmpl to application/config/database.php
5. Modify application/config/database.php to connect to your database
6. Modify application/config/config.php encryption key with your own
7. Go to your point of sale install via the browser
8. LOGIN using
username: admin 
password:pointofsale
9. Enjoy

A more extensive setup guide can be found at [this site](http://www.opensourceposguide.com/guide/gettingstarted/installation)

