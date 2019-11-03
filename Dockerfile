FROM alpine AS consul-template

ADD https://releases.hashicorp.com/consul-template/0.22.0/consul-template_0.22.0_linux_amd64.tgz /consul-template.tgz
RUN tar -xzf /consul-template.tgz
RUN rm /consul-template.tgz

FROM postgrest/postgrest:v6.0.2

USER root
COPY --from=consul-template /consul-template /

COPY ./conf /opt/conf


ENTRYPOINT [ "/consul-template", "-config", "/opt/conf/config.hcl"]