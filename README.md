dokku-odoo
==========

NOTE: If you get a strange screen and JS error after dokku deploy, run this SQL:
DELETE FROM ir_attachment WHERE url LIKE '/web/content/%';

A Odoo image ready to be deployed on dokku mini-PaaS

Based on official docker-odoo image this image is just changing the exposed port to port 5000 to be ready to go with dokku defaults.

Configuration vars
-------------------
 - DB_HOST: Database host name, default `db`
 - DB_PORT: Database port, default `5432`
 - DB_USER: Database username, default `odoo`
 - DB_NAME: Set the database name, default `odoo`
 - DB_PASSWORD: Database password, default `odoo`


Volumes settings in dokku
-------------------------

    sudo mkdir -p /var/lib/dokku/data/storage/$APP-{addons,filestore}
    sudo chmod a+rw -R /var/lib/dokku/data/storage/$APP-{addons,filestore}
    dokku storage:mount $APP /var/lib/dokku/data/storage/$APP-filestore:/var/lib/odoo
    dokku storage:mount $APP /var/lib/dokku/data/storage/$APP-addons:/mnt/addons
