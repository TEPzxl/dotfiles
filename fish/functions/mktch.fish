function mktch
    mkdir -p (dirname -- $argv[1]); and touch $argv[1]
end
