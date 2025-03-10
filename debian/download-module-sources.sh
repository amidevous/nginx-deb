#!/bin/bash

# Usage: download_github_repo -b branch user/repo
#     or download_github_repo -c commit user/repo
download_github_repo() {
  local branch_or_commit_opt=$1
  local branch_or_commit=$2
  local user_repo=$3

  local user=${user_repo%%/*}
  local repo=${user_repo##*/}

  if [ -d $repo ]; then
    rm -rf ${repo}
  fi

  local commit
  case "$branch_or_commit_opt" in
  -b)
    git clone --depth 1 -b ${branch_or_commit} --recurse-submodules https://github.com/${user}/${repo}.git > /dev/null 2>&1
    commit=$(cd ${repo} && git rev-parse HEAD)
    (cd ${repo} && find . -name .git -exec rm -rf {} +)
    ;;
  -c)
    mkdir ${repo}
    curl -sSL https://github.com/$user/$repo/archive/${commit}.tar.gz | tar zxf - --strip-component 1 -C ${repo}
    ;;
  esac

  echo $user/$repo $commit
}

download_github_repo -b master openresty/echo-nginx-module
download_github_repo -b master openresty/headers-more-nginx-module
download_github_repo -b master openresty/lua-nginx-module
download_github_repo -b master openresty/lua-upstream-nginx-module
download_github_repo -b master openresty/memc-nginx-module
download_github_repo -b master openresty/redis2-nginx-module
download_github_repo -b master openresty/set-misc-nginx-module
download_github_repo -b master openresty/srcache-nginx-module
download_github_repo -b master openresty/stream-lua-nginx-module
download_github_repo -b master openresty/lua-resty-balancer
download_github_repo -b master openresty/lua-resty-core
download_github_repo -b master openresty/lua-resty-dns
download_github_repo -b master openresty/lua-resty-lock
download_github_repo -b master openresty/lua-resty-limit-traffic
download_github_repo -b master openresty/lua-resty-lrucache
download_github_repo -b master openresty/lua-resty-memcached
download_github_repo -b master openresty/lua-resty-memcached-shdict
download_github_repo -b master openresty/lua-resty-mysql
download_github_repo -b master openresty/lua-resty-redis
download_github_repo -b master openresty/lua-resty-shdict-simple
download_github_repo -b master openresty/lua-resty-shell
download_github_repo -b master openresty/lua-resty-signal
download_github_repo -b master openresty/lua-resty-string
download_github_repo -b master openresty/lua-resty-upload
download_github_repo -b master openresty/lua-resty-upstream-healthcheck
download_github_repo -b master openresty/lua-resty-websocket
download_github_repo -b master cloudflare/lua-resty-cookie
download_github_repo -b master zmartzone/lua-resty-openidc
download_github_repo -b master bungle/lua-resty-session
download_github_repo -b master cdbattags/lua-resty-jwt
download_github_repo -b master jkeys089/lua-resty-hmac

download_github_repo -b master pintsized/lua-resty-http
download_github_repo -b master FRiCKLE/ngx_cache_purge
download_github_repo -b master arut/nginx-rtmp-module
download_github_repo -b master arut/nginx-dav-ext-module
download_github_repo -b master bpaquet/ngx_http_enhanced_memcached_module
download_github_repo -b master replay/ngx_http_secure_download
download_github_repo -b master simplresty/ngx_devel_kit
download_github_repo -b master hnakamur/nginx-sorted-querystring-module
download_github_repo -b master pandax381/ngx_http_pipelog_module
download_github_repo -b master nginx-shib/nginx-http-shibboleth
download_github_repo -b master hnakamur/nginx-lua-saml-service-provider
download_github_repo -b master hnakamur/nginx-lua-session
download_github_repo -b master hamishforbes/lua-ffi-zlib
download_github_repo -b master Phrogz/SLAXML
rm -rf ngx_http_geoip2_module
download_github_repo -b master leev/ngx_http_geoip2_module
download_github_repo -b master e98cuenc/ngx_upstream_jdomain
download_github_repo -b main google/nginx-sxg-module
download_github_repo -b master woothee/lua-resty-woothee
download_github_repo -b master ruoshan/lua-resty-jump-consistent-hash
download_github_repo -b master nginx/njs
wget https://github.com/openssl/openssl/archive/refs/tags/OpenSSL_1_1_1t.tar.gz -qO OpenSSL_1_1_1t.tar.gz
tar -xf OpenSSL_1_1_1t.tar.gz
rm -f OpenSSL_1_1_1t.tar.gz
