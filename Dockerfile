FROM odoo:11.0

USER root

COPY ./entrypoint.sh /
COPY ./odoo.conf /etc/odoo/
RUN chown odoo /etc/odoo/odoo.conf

RUN mkdir -p /mnt/extra-addons \
        && chown -R odoo /mnt/extra-addons

RUN set -x; \
        apt-get update \
        && apt-get install -y --no-install-recommends procps

USER odoo

ENTRYPOINT ["/entrypoint.sh", "odoo"]
