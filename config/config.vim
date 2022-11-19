scriptencoding utf-8

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""文本格式

"" 告诉Vim怎么处理东亚二义性宽度字符类，例如破折号、五角星符号等等,防止特殊符号无法正常显示
set ambiwidth=double

"" 允许在两个汉字之间断行，即使汉字之间没有出现空格
set formatoptions+=m

"" 合并两行中文时，不在中间加空格
set formatoptions+=B

"" 自动格式化
set formatoptions=1jqn
set breakindentopt = "shift:2,min:20"

"" 设退格键和光标键跨越行边界
set backspace=indent,eol,start
set whichwrap+=<,>,h,l

set nowrap                  "" 关闭自动折行
set breakat=\ \	;:,!?       "" 长行折行标记字符
set linebreak               "" 只有遇到在breakat指定的符号处才折行
set showbreak=↳             "" 设置set nowrap命令后, 对于超出屏幕范围的行, 会在边界显示↪

set iskeyword+=_,$,@,%,#,-  "" 带有如下符号的单词不要被换行分割

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" 保存，备份，历史记录
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set browsedir=buffer         "" 设定文件浏览器目录为当前目录
set autochdir                "" 自动切换当前目录为当前文件所在的目录

set confirm                  "" 修改只读文件时发出提示
set autoread                 "" 文件修改之后自动载入
set autowrite                "" 自动保存

set nobackup                 "" 取消备份
set noswapfile               "" 关闭swap文件

set undofile                 "" 保留撤销记录
set undodir=~/.vim/undo
set bufhidden=hide           "" 当buffer被丢弃的时候隐藏它
set history=9999             "" 记住多少次历史操作记录数
set viminfo^=%               "" Remember info about open buffers on close
set viminfo+=!               "" 保存全局变量

"" 搜索替换 {{{

set hlsearch      "" 搜索高亮
set incsearch     "" 即时搜索
set ignorecase    "" 搜索时忽略大小写
set smartcase     "" 有一个或一个以上大写字母时仍保持对大小写敏感
set nowrapscan    "" 禁止在搜索到文件两端时重新搜索
set gdefault      "" 替换时，缺省启用g标志，即同一行里的所有匹配都会被替换

"" }}}

"" 括号匹配 {{{

set showmatch       ""显示匹配的括号
set matchtime=3     ""高亮匹配括号时间
set matchpairs+=<:>,(:),{:},[:]     ""匹配括号的规则

"" }}}

"" 剪贴板 {{{

if has('unnamedplus')    ""vim寄存器和系统剪贴板共享
  set clipboard& clipboard+=unnamedplus
else
  set clipboard& clipboard+=unnamed
endif

"" }}}

"" 其他配置 {{{

set hidden                     "" 可以在没有保存的情况下切换buffer，此时的修改由 vim 负责保存
set report=0                   "" Don't report on line changes
set magic                      "" 智能处理正则表达式中的某些符号
set visualbell errorbells      "" 出错的提示声音
set virtualedit=block          "" Virtual edit is useful for visual block edit
set display=lastline           "" Show as much as possible of the last line
set ttyfast                    "" Faster redrawing
set ttymouse=xterm2

"" }}}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"" TimeOut {{{

set timeout ttimeout     "" 打开功能键超时检测（终端下功能键为一串 ESC 开头的字符串）
set timeoutlen=300       "" Time out on mappings
set updatetime=300       "" Idle time to write swap and trigger CursorHold
set ttimeoutlen=100      "" 功能键超时检测 50 毫秒
set winaltkeys=no        "" alt键不映射到菜单栏

"" }}}

"" 缩进 {{{

set tabstop=4           "" 1 Tab = 4 spaces
set expandtab           "" 用空格替代Tab
set shiftwidth=4        "" 缩进用的空格数
set softtabstop=4       "" 软制表符宽度
set shiftround
set smarttab

set smartindent
set autoindent

"" }}}

"" 折叠 {{{
if has('folding')
    set foldenable               "" 允许代码折叠
    set foldmethod=indent        "" 默认使用缩进折叠
    set foldlevel=99             "" 默认打开所有缩进
    set foldcolumn=1             "" 折叠区域的宽度
    set foldexpr=1               "" 代码块折叠后显示的行数
endif
" 新建的文件，刚打开的文件不折叠
autocmd! BufNewFile,BufRead * setlocal nofoldenable
"" }}}

"" 自动补全 {{{

set completeopt=menu
set completeopt+=menuone
set completeopt+=popup
set completeopt+=noinsert

if has('wildmenu')
    set wildmenu
    set wildmode=list:longest,full
    set wildchar=<TAB>
    set wildoptions=tagfile
    set suffixes=.bak,~,.o,.h,.info,.swp,.obj,.pyc,.pyo,.egg-info,.class
    set wildignore=*.o,*.obj,*~,*.exe,*.a,*.pdb,*.lib
    set wildignore+=*.so,*.dll,*.swp,*.egg,*.jar,*.class,*.pyc,*.pyo,*.bin,*.dex
    set wildignore+=*.zip,*.7z,*.rar,*.gz,*.tar,*.gzip,*.bz2,*.tgz,*.xz
    set wildignore+=*.DS_Store*,*.ipch
    set wildignore+=*.gem
    set wildignore+=*.png,*.jpg,*.gif,*.bmp,*.tga,*.pcx,*.ppm,*.img,*.iso
    set wildignore+=*.so,*.swp,*.zip,*/.Trash/**,*.pdf,*.dmg,*/.rbenv/**
    set wildignore+=*/.nx/**,*.app,*.git,.git
    set wildignore+=*.wav,*.mp3,*.ogg,*.pcm
    set wildignore+=*.mht,*.suo,*.sdf,*.jnlp
    set wildignore+=*.chm,*.epub,*.pdf,*.mobi,*.ttf
    set wildignore+=*.mp4,*.avi,*.flv,*.mov,*.mkv,*.swf,*.swc
    set wildignore+=*.ppt,*.pptx,*.docx,*.xlt,*.xls,*.xlsx,*.odt,*.wps
    set wildignore+=*.msi,*.crx,*.deb,*.vfd,*.apk,*.ipa,*.bin,*.msu
    set wildignore+=*.gba,*.sfc,*.078,*.nds,*.smd,*.smc
    set wildignore+=*.linux2,*.win32,*.darwin,*.freebsd,*.linux,*.android
    inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"   ""Tab键在补全列表中跳转
    inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"    ""回车即选中当前项
    autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif   ""离开插入模式后自动关闭预览窗口
endif

"" }}}

"""=============================================================================
"" 自定义设置


"" {{{
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

"" }}}

if executable('rg')
      set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case\ --hidden
      set grepformat=%f:%l:%c:%m
endif