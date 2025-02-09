#!/usr/bin/env sh
set -eu

# shellcheck disable=SC2120,SC3043
replaceEnvSecrets() {
	# replaceEnvSecrets 1.0.0
	# https://gist.github.com/anthochamp/d4d9537f52e5b6c42f0866dd823a605f
	local prefix="${1:-}"

	for envSecretName in $(export | awk '{print $2}' | grep -oE '^[^=]+' | grep '__FILE$'); do
		if [ -z "$prefix" ] || printf '%s' "$envSecretName" | grep "^$prefix" >/dev/null; then
			local envName
			envName=$(printf '%s' "$envSecretName" | sed 's/__FILE$//')

			local filePath
			filePath=$(eval echo '${'"$envSecretName"':-}')

			if [ -n "$filePath" ]; then
				if [ -f "$filePath" ]; then
					echo Using content from "$filePath" file for "$envName" environment variable value.

					export "$envName"="$(cat -A "$filePath")"
					unset "$envSecretName"
				else
					echo ERROR: Environment variable "$envSecretName" is defined but does not point to a regular file. 1>&2
					exit 1
				fi
			fi
		fi
	done
}

replaceEnvSecrets

# /tmp/renovate is the default
# https://docs.renovatebot.com/self-hosted-configuration/#basedir
export RENOVATE_BASE_DIR="${RENOVATE_BASE_DIR:-/tmp/renovate}"

# RENOVATE_BASE_DIR/cache is the default
# https://docs.renovatebot.com/self-hosted-configuration/#cachedir
export RENOVATE_CACHE_DIR="${RENOVATE_CACHE_DIR:-$RENOVATE_BASE_DIR/cache}"

if [ -d "$RENOVATE_BASE_DIR" ]; then
	chown ubuntu:ubuntu "$RENOVATE_BASE_DIR"
fi

if [ -d "$RENOVATE_CACHE_DIR" ]; then
	chown ubuntu:ubuntu "$RENOVATE_CACHE_DIR"
fi

while
	runuser -u ubuntu -- /usr/local/sbin/renovate-entrypoint.sh "$@"

	if [ "$1" != 'renovate' ]; then
		break
	fi

	sleep "${SLEEP_TIMEOUT:-30m}"
do :; done
