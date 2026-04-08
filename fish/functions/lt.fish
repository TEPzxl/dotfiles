function lt
    eza -T --level=3 \
        --git-ignore \
        --ignore-glob=".git|node_modules|dist|build|target|.cache|.venv" \
        $argv
end
