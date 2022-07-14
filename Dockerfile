FROM debian:stable-slim

RUN apt-get update \
    && apt-get -y --no-install-recommends install cron \
    && apt-get clean -q && rm -rf /var/lib/apt/lists/* && rm -drf /var/cache/apt /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN touch /var/log/test.log

RUN ( echo "0 */1 * * * echo 1 >> /var/log/test.log 2>&1 " ) | crontab

CMD cron && tail -f /var/log/test.log