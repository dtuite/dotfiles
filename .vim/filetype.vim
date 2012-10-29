" Highlight nginx.conf files.
" Will highlight any file in the default nginx conf file location,
" and any file called nginx.conf regardless of location.
au BufRead,BufNewFile /usr/local/nginx/conf/*,nginx.conf set ft=nginx
