FROM renovate/renovate:39.188.1@sha256:5b0dc2bdf817b1b2ffe71dbafe4b5708cb3c6bb707a7b7b4c486e9b3caf7a787

# renovate sets user/group to 12021:12021 (ubuntu:ubuntu)
# https://docs.renovatebot.com/release-notes-for-major-versions/#new-docker-user-id-for-all-docker-images
# We need root access on docker-entrypoint.sh, lets put back initial user 0 and
# we'll execute renovate with runuser.
# hadolint ignore=DL3002
USER 0

COPY --chmod=775 /rootfs/docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["renovate"]
