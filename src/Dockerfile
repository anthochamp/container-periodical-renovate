FROM renovate/renovate:39.248.1@sha256:c2b0f46a7ec3b15f265241c2052a11de8d0aae935a760192e47a4e83076c27ad

# renovate sets user/group to 12021:12021 (ubuntu:ubuntu)
# https://docs.renovatebot.com/release-notes-for-major-versions/#new-docker-user-id-for-all-docker-images
# We need root access on docker-entrypoint.sh, lets put back initial user 0 and
# we'll execute renovate with runuser.
# hadolint ignore=DL3002
USER 0

COPY --chmod=775 /rootfs/docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["renovate"]
