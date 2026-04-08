function gl --wraps='git log --graph --all' --description 'alias gl=git log --graph --all'
  git log --graph --all $argv
        
end
