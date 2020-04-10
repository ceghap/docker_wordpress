#!/bin/bash
set -euo pipefail

if [ -e /usr/src/wordpress/wp-config-sample.php ]; then
	sed -i '/WP_DEBUG/a \
// Cache all the things \
global $memcached_servers; \
$memcached_servers = array( \
	array( \
		"memcached", \
		"11211" \
		) \
	); \
define( "WP_CACHE", true );' /usr/src/wordpress/wp-config-sample.php

fi