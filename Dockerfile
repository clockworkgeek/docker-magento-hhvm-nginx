FROM webdevops/hhvm-nginx
MAINTAINER daniel@clockworkgeek.com

# Add Magento specific instructions
COPY etc/nginx /etc/nginx

# Enable cron and mail, because cron uses mail
RUN ["sed", "-i", "s/autostart = false/autostart = true/", "/opt/docker/etc/supervisor.d/cron.conf", "/opt/docker/etc/supervisor.d/postfix.conf"]
