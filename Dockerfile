FROM webdevops/hhvm-nginx
MAINTAINER daniel@clockworkgeek.com

# Remove unwanted example
RUN ["rm","/etc/nginx/conf.d/10-docker.conf"]
RUN ["cp","/opt/docker/etc/nginx/php.conf","/etc/nginx/conf.d/"]

# Enable cron and mail, because cron uses mail
RUN ["sed", "-i", "s/autostart = false/autostart = true/", "/opt/docker/etc/supervisor.d/cron.conf", "/opt/docker/etc/supervisor.d/postfix.conf"]

# Add Magento specific instructions
COPY etc/nginx /etc/nginx
