FROM ruby:2.3.1

# AUTHOR...
MAINTAINER Jeremie CUADRADO<@redbeard28>


# Listen port
ENV PORT 3030

RUN apt-get update && apt-get install -y --no-install-recommends apt-utils
RUN apt-get update && \
    apt-get -y install nodejs git vim && \
    apt-get -y clean
RUN gem install bundle smashing rest-client mqtt json date
RUN mkdir /smashing && \
    smashing new smashing && \
    cd /smashing && \
    bundle && \
    ln -s /smashing/dashboards /dashboards && \
    ln -s /smashing/jobs /jobs && \
    ln -s /smashing/assets /assets && \
    ln -s /smashing/lib /lib-smashing && \
    ln -s /smashing/public /public && \
    ln -s /smashing/widgets /widgets && \
    mkdir /smashing/config && \
    mv /smashing/config.ru /smashing/config/config.ru && \
    ln -s /smashing/config/config.ru /smashing/config.ru && \
    ln -s /smashing/config /config

COPY dashboards/* /smashing/dashboard/
COPY jobs/* /smashing/jobs/
COPY assets/* /smashing/assets/
COPY widgets/server_status/* /smashing/widgets/server_status/
COPY widgets/haproxy_down_hosts/* /smashing/widgets/haproxy_down_hosts/
COPY config/* /smashing/config/



COPY run.sh /

EXPOSE $PORT
WORKDIR /smashing

CMD ["/run.sh"]
