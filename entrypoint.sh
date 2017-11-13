#!/bin/sh

set -xe

cat << EOF > /etc/saslauthd.conf
${LDAP_AUTH_METHOD:+"ldap_auth_method: $LDAP_AUTH_METHOD"}
${LDAP_BIND_DN:+"ldap_bind_dn: $LDAP_BIND_DN"}
${LDAP_BIND_PW:+"ldap_bind_pw: $LDAP_BIND_PW"}
${LDAP_DEFAULT_REALM:+"ldap_default_realm: $LDAP_DEFAULT_REALM"}
${LDAP_DEREF:+"ldap_deref: $LDAP_DEREF"}
${LDAP_FILTER:+"ldap_filter: $LDAP_FILTER"}
${LDAP_GROUP_ATTR:+"ldap_group_attr: $LDAP_GROUP_ATTR"}
${LDAP_GROUP_DN:+"ldap_group_dn: $LDAP_GROUP_DN"}
${LDAP_GROUP_FILTER:+"ldap_group_filter: $LDAP_GROUP_FILTER"}
${LDAP_GROUP_MATCH_METHOD:+"ldap_group_match_method: $LDAP_GROUP_MATCH_METHOD"}
${LDAP_GROUP_SEARCH_BASE:+"ldap_group_search_base: $LDAP_GROUP_SEARCH_BASE"}
${LDAP_GROUP_SCOPE:+"ldap_group_scope: $LDAP_GROUP_SCOPE"}
${LDAP_PASSWORD:+"ldap_password: $LDAP_PASSWORD"}
${LDAP_PASSWORD_ATTR:+"ldap_password_attr: $LDAP_PASSWORD_ATTR"}
${LDAP_REFERRALS:+"ldap_referrals: $LDAP_REFERRALS"}
${LDAP_RESTART:+"ldap_restart: $LDAP_RESTART"}
${LDAP_ID:+"ldap_id: $LDAP_ID"}
${LDAP_AUTHZ_ID:+"ldap_authz_id: $LDAP_AUTHZ_ID"}
${LDAP_MECH:+"ldap_mech: $LDAP_MECH"}
${LDAP_REALM:+"ldap_realm: $LDAP_REALM"}
${LDAP_SCOPE:+"ldap_scope: $LDAP_SCOPE"}
${LDAP_SEARCH_BASE:+"ldap_search_base: $LDAP_SEARCH_BASE"}
${LDAP_SERVERS:+"ldap_servers: $LDAP_SERVERS"}
${LDAP_START_TLS:+"ldap_start_tls: $LDAP_START_TLS"}
${LDAP_TIME_LIMIT:+"ldap_time_limit: $LDAP_TIME_LIMIT"}
${LDAP_TIMEOUT:+"ldap_timeout: $LDAP_TIMEOUT"}
${LDAP_TLS_CHECK_PEER:+"ldap_tls_check_peer: $LDAP_TLS_CHECK_PEER"}
${LDAP_TLS_CACERT_FILE:+"ldap_tls_cacert_file: $LDAP_TLS_CACERT_FILE"}
${LDAP_TLS_CACERT_DIR:+"ldap_tls_cacert_dir: $LDAP_TLS_CACERT_DIR"}
${LDAP_TLS_CIPHERS:+"ldap_tls_ciphers: $LDAP_TLS_CIPHERS"}
${LDAP_TLS_CERT:+"ldap_tls_cert: $LDAP_TLS_CERT"}
${LDAP_TLS_KEY:+"ldap_tls_key: $LDAP_TLS_KEY"}
${LDAP_USE_SASL:+"ldap_use_sasl: $LDAP_USE_SASL"}
${LDAP_VERSION:+"ldap_version: $LDAP_VERSION"}
EOF

mkdir -p $SASLAUTHD_PATH
/usr/local/sbin/saslauthd -m$SASLAUTHD_PATH -aldap -d $*
