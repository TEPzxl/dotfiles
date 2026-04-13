function proxy_on --description "Enable proxy for current fish session"
    set -l port $argv[1]

    if test -z "$port"
        echo "用法: proxy_on <port>"
        echo "示例: proxy_on 6984"
        return 1
    end

    set -gx http_proxy  http://127.0.0.1:$port
    set -gx https_proxy http://127.0.0.1:$port
    set -gx HTTP_PROXY  http://127.0.0.1:$port
    set -gx HTTPS_PROXY http://127.0.0.1:$port
    set -gx ALL_PROXY   socks5://127.0.0.1:$port

    echo "代理已开启: 127.0.0.1:$port"
end
