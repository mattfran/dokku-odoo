FROM odoo:11.0

USER root

ADD ./nginx.conf.sigil /app

COPY ./entrypoint.sh /
COPY ./odoo.conf /etc/odoo/
RUN chown odoo /etc/odoo/odoo.conf

RUN mkdir -p /mnt/extra-addons \
        && chown -R odoo /mnt/extra-addons

USER odoo

ENTRYPOINT ["/entrypoint.sh", "odoo"]