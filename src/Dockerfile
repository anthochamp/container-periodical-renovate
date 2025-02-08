FROM renovate/renovate:38

# renovate sets user to 1000 (ubuntu), we need root for apt & chown later
# hadolint ignore=DL3002
USER 0

COPY --chmod=775 /rootfs/docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["renovate"]
