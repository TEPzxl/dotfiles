function my --wraps='mysql -u dev -p' --description 'alias my=mysql -u dev -p'
  mysql -u dev -p $argv
        
end
