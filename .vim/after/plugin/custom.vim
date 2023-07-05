" 第一行设置tab键为4个空格，第二行设置当行之间交错时使用4个空格 
set tabstop=2
set shiftwidth=2

" 用空格键替换制表符 
set expandtab

" 设置匹配模式，类似当输入一个左括号时会匹配相应的那个右括号 
set showmatch

" 背景及配色方案 
" if has('gui_running')
"     set background=light
" else
"     set background=dark
" endif

" 设置配色，这里选择的是desert，也有其他方案，在vim中输入:color 在敲tab键可以查看 
" color desert
" colorscheme solarized

if has('gui_running')
    set background=dark
    " https://github.com/tomasr/molokai/blob/master/colors/molokai.vim
    color molokai
    set termguicolors
endif

"传说中的去掉边框用下边这一句
set go=

" 有时中文会显示乱码，用一下几条命令解决 
let &termencoding=&encoding
set fileencodings=utf-8,gb18030,gbk

" 高亮搜索
set hlsearch

" GUI版本中的toolbar 
if has('gui_running')
    set guioptions+=T
    set guioptions+=m
	map <silent> <F2> :if &guioptions =~# 'T' <Bar>
        \set guioptions-=T <Bar>
        \set guioptions-=m <Bar>
    \else <Bar>
        \set guioptions+=T <Bar>
        \set guioptions+=m <Bar>
    \endif<CR>
	
	source $VIMRUNTIME/delmenu.vim
    source $VIMRUNTIME/menu.vim
endif

" GUI尝试使用自定义字体
if has('gui_running')
    " set guifont=* 选择字体
    " set guifont?  查看当前字体
    set guifont=等距更纱黑体_SC:h18:cDEFAULT,Noto_Mono:h18:cDEFAULT,Noto_Sans_Mono_CJK_SC:h18:cDEFAULT,Microsoft_Yahei:h18:cDEFAULT,Yahei_Mono:h18:cDEFAULT,simhei:h18:cDEFAULT
    set guifontwide=等距更纱黑体_SC:h18:cDEFAULT,Noto_Mono:h18:cDEFAULT,Noto_Sans_Mono_CJK_SC:h18:cDEFAULT,Yahei_Mono:h18:cDEFAULT,Microsoft_Yahei_UI:h18:cDEFAULT,simhei:h18:cDEFAULT
endif

" GUI设置窗口大小
if has('gui_running')
    set lines=48 columns=200
endif
