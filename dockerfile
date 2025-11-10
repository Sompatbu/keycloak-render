FROM quay.io/keycloak/keycloak:26.0.5

ENV KEYCLOAK_ADMIN=admin
ENV KEYCLOAK_ADMIN_PASSWORD=admin

ENV KC_DB=postgres
ENV KC_DB_URL=jdbc:postgresql://dpg-d48t1j8gjchc73f2urn0-a:5432/keycloak_db_3a3c
ENV KC_DB_USERNAME=keycloak_db_3a3c_user
ENV KC_DB_PASSWORD=GwDazTrX4tzOKxNl4dD6UT0LtKvrUTLc

ENV KC_HEALTH_ENABLED=true
ENV KC_METRICS_ENABLED=true
ENV KC_HOSTNAME_STRICT=false
ENV PORT=8080

RUN /opt/keycloak/bin/kc.sh build

EXPOSE 8080

ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start", "--optimized", "--http-port=8080", "--http-host=0.0.0.0"]
