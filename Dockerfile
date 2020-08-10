FROM nginx:mainline
RUN mkdir -p /var/www/static/

COPY nginx.conf /etc/nginx/

# Copy the site configs
COPY iqps.conf /etc/nginx/sites-enabled/
COPY wiki.conf /etc/nginx/sites-enabled/
COPY static.conf /etc/nginx/sites-enabled/

RUN rm /etc/nginx/conf.d/default.conf
