function proxy_off --description "Disable proxy for current fish session"
    set -e http_proxy
    set -e https_proxy
    set -e HTTP_PROXY
    set -e HTTPS_PROXY
    set -e ALL_PROXY

    echo "代理已关闭"
end
