FROM renovate/renovate:44.51.2@sha256:dd5a8ca92b2f3cbb8e3c8de35c63ae46494b074463c5e2488ed43e128b22f32e

# renovate sets user/group to 12021:12021 (ubuntu:ubuntu)
# https://docs.renovatebot.com/release-notes-for-major-versions/#new-docker-user-id-for-all-docker-images
# We need root access on docker-entrypoint.sh, lets put back initial user 0 and
# we'll execute renovate with gosu.
# hadolint ignore=DL3002
USER 0

# hadolint ignore=DL3008
RUN set -ex; \
	apt-get update; \
	apt-get install -y --no-install-recommends gosu; \
	rm -rf /var/lib/apt/lists/*

COPY --chmod=775 /rootfs/docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["renovate"]
