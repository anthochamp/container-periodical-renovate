FROM renovate/renovate:40.51.0@sha256:1b2eeaf075ee13714f31bc00e0af5eeec86de6e1f565f27724ea5c637b551699

# renovate sets user/group to 12021:12021 (ubuntu:ubuntu)
# https://docs.renovatebot.com/release-notes-for-major-versions/#new-docker-user-id-for-all-docker-images
# We need root access on docker-entrypoint.sh, lets put back initial user 0 and
# we'll execute renovate with runuser.
# hadolint ignore=DL3002
USER 0

COPY --chmod=775 /rootfs/docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["renovate"]
