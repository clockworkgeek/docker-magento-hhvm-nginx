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

The variables `$mage_run_code` and `$mage_run_type` are passed to Magento as environment variables.
Use this to control frontend stores instead of hacking `index.php`.

For development sites it is possible to add `set $mage_is_developer_mode true;` as well,
this will stop on any error and print in full.

For production sites it is possible to hide some implementation details like this:

```
    server_tokens       off;
    fastcgi_hide_header "X-Powered-By";
```

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
