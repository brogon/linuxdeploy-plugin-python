#! /bin/bash

DEFAULT_CONFIG_FLAGS="shared no-ssl2 no-ssl3"
if [ -n "${OPENSSL_CONFIG_FLAGS}" ]; then
    OPENSSL_CONFIG_FLAGS="$DEFAULT_CONFIG_FLAGS $OPENSSL_CONFIG_FLAGS"
else
    OPENSSL_CONFIG_FLAGS=$DEFAULT_CONFIG_FLAGS
fi

CONFIG_HASH=$(echo "$OPENSSL_CONFIG_FLAGS" | sha1sum | sed 's/ .*$//')
OPENSSL_DIR="${HOME}/openssl/${OPENSSL}${CONFIG_HASH}"
