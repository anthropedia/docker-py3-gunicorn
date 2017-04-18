FROM python:3-alpine

RUN apk add --update --no-cache \
		build-base bash git openssh python-dev py-gunicorn && \
		pip install gunicorn && \
		# Fix numpy
		ln -s /usr/include/locale.h /usr/include/xlocale.h

ENV APP_DIR /app
RUN mkdir ${APP_DIR}
VOLUME [${APP_DIR}]
WORKDIR ${APP_DIR}

# Enable git to fetch from any host without prompting
RUN echo $'Host *\n		StrictHostKeyChecking no' >> /etc/ssh/ssh_config
VOLUME /root/.ssh

EXPOSE 80

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
