FROM renovate/renovate:39@sha256:ab3fee4aaa44c38f9dcd87ee46b44d658fa5022372ba8a586bba3da27044080f

# renovate sets user to 1000 (ubuntu), we need root for apt & chown later
# hadolint ignore=DL3002
USER 0

COPY --chmod=775 /rootfs/docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["renovate"]
