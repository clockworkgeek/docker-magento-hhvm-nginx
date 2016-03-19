Docker for Magento
==================

Built on [webdevops/hhvm-nginx](https://hub.docker.com/r/webdevops/hhvm-nginx/) for speed and stability.
Has useful extras like cron and supervisord.
Specifically designed for securely serving Magento sites.

Setting up
----------

Configure your site in `/etc/nginx/sites-enabled/` like this:

```
server {
    server_name        yoursite.com;
    root               /var/www;
    include            magento_server;
    set $mage_run_code "default";
    set $mage_run_type "website";
}
```

Copy your project files to the server root, `/var/www` in this example.
Instead of copying you could mount project files as a data volume,
this means a smaller image and changes are preserved too.

Cron
----

Add an executable file to `/etc/cron.d/` like this:

```
MAILTO=""
* * * * * application /var/www/cron.sh
```

Mail
----

Mail is a work in progress.
