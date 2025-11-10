FROM quay.io/keycloak/keycloak:26.0.5

# Run in production mode
ENV KC_DB=dev-mem
ENV KC_HEALTH_ENABLED=true
ENV KC_METRICS_ENABLED=true
ENV KC_HOSTNAME_STRICT=false
ENV KEYCLOAK_ADMIN=admin
ENV KEYCLOAK_ADMIN_PASSWORD=admin

# Build and run Keycloak
RUN /opt/keycloak/bin/kc.sh build
EXPOSE 8080
ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start-dev", "--http-port=8080", "--http-host=0.0.0.0"]
