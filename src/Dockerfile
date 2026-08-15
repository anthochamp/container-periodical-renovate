FROM renovate/renovate:44.30.3@sha256:d3d60a87bab73203327dd664f94f11e83091441ee4964c920662d83023446395

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
