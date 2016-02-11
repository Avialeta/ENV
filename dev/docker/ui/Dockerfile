FROM nginx:latest

COPY default.conf /etc/nginx/conf.d/default.conf

ADD https://github.com/Avialeta/UI/archive/DEV.tar.gz /tmp/ui-DEV.tar.gz
RUN tar \
		--gunzip \
		--extract \
		--directory=/usr/share/nginx/html \
		--strip-components=1 \
		--file=/tmp/ui-DEV.tar.gz && \
	find /usr/share/nginx/html -type f -exec chmod 644 {} \; && \
	find /usr/share/nginx/html -type d -exec chmod 755 {} \; &&\
	rm --recursive /tmp/*
