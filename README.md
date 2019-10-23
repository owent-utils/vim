# 自己用的编辑器/终端配置和脚本


## zsh 构建流程

```bash
# require ncurses-devel/ncurses-static/libncurses5-dev/libncursesw5-dev
ZSH_VERSION=5.7.1 ;

# https://github.com/zsh-users/zsh
curl -k -L https://dl.sourceforge.net/project/zsh/zsh/$ZSH_VERSION/zsh-$ZSH_VERSION.tar.xz -O zsh-$ZSH_VERSION.tar.xz ;
tar -axvf zsh-$ZSH_VERSION.tar.xz ;
cd zsh-$ZSH_VERSION ;

autoreconf --install ;

SUFFIX_FLAGS="";
PREFIX_OPTIONS=;

# # musl 套件编译不止需要musl-libc还需要ld，可以用 https://buildroot.org/ 来创建构建工具或者 https://toolchains.bootlin.com/ 直接下载一个
# if [ "x" != "x${CC}" ]; then
#     CC_BASE=$(basename $CC);
#     if [ "x$CC_BASE" == "xmusl-gcc" ]; then
#         SUFFIX_FLAGS="--enable-libc-musl" ;
#         PREFIX_OPTIONS="CC=$CC" ;
#     fi
# fi

$PREFIX_OPTIONS ./configure --prefix=/usr/local/zsh-$ZSH_VERSION \
    --enable-cap --enable-pcre --enable-multibyte --enable-unicode9 $SUFFIX_FLAGS ;
make -j$(cat /proc/cpuinfo | grep process | awk 'BEGIN{MAX_CORE=4}{if ($3 >= MAX_CORE) { MAX_CORE=$3+1; } }END {print MAX_CORE}') ;

```
