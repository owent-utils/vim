
#export http_proxy=http://dev-proxy.oa.com:8080
#export https_proxy=http://dev-proxy.oa.com:8080

which zsh > /dev/null 2>&1 ;

if [ 0 -eq $? ]; then
    zsh ;
fi

