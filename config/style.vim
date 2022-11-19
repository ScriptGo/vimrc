scriptencoding utf-8

"" GUI {{{

if has('gui_running')
   set guioptions-=m                      "" 隐藏菜单栏
   set guioptions-=T                      "" 隐藏工具条
   set guioptions-=L                      "" 隐藏滚动条
   set guioptions-=r
   set title                              "" 标题栏显示的信息
   set titlestring=%{hostname()}\ -\ %F
   set showtabline=2                      "" 显示标签页
   set guitablabel=[%N]\ %t               "" 为标签页添加数字
   set guifont=FiraCode\ Nerd\ Font\ Mono\ 12             "" Linux字体设置
   set guifontwide=Sarasa\ Mono\ SC\ 12
endif

"" }}}


"" 显示 {{{

set fillchars=fold:\ ,vert:\|,stl:\ ,stlnc:\  ""在被分割的窗口间显示空白，便于阅读

set equalalways                       "" 分割窗口时保持平衡
set splitright                        "" 水平切割窗口时，默认在右边显示新窗口
set lazyredraw                        "" 在执行宏命令时，不进行显示重绘；在宏命令执行完成后，一次性重绘，以便提高性能
set switchbuf=useopen,usetab,newtab   "" 跳转会先复用已有文件的窗口，再复用已有标签，最后没有的话新建标签
set signcolumn=yes                    "" 始终显示列标记
set nostartofline                     "" 光标滚动后将光标保留在同一列中
set scrolloff=3                       "" 上下移动光标时，光标的上方或下方至少会保留显示的行数
set sidescrolloff=5                   "" Keep at least 5 lines left/right
set linespace=3                       "" 行间距，如果默认值太小，代码会非常纠结
set scrolljump=5                      "" lines to scroll when cursor leaves screen
set synmaxcol=999                     "" stop syntax highlight after x lines for performance
set textwidth=81                      "" 设置行宽，即一行显示多少个字符。
set wrapmargin=2                      "" 指定折行处与编辑窗口的缘之间空出的字符数
set cmdheight=2                       "" 命令行的高度
set cmdwinheight=5
set helpheight=12
set previewheight=12
set pumheight=12                    "补全列表中项目的个数

"" }}}

"" Statusline {{{

set laststatus=2           "" 总是显示状态栏
set ruler                  "" 显示当前的行号列号
set showcmd                "" 在状态栏显示正在输入的命令

set statusline=%<[%F]                  "" 文件名
set statusline+=\ [%1*%M%*%n%R%H]      "" buffer 编号和状态
set statusline+=\ [文件类型:\ %Y]                            
set statusline+=\ [格式:\ %{&ff}\ \|\ 编码:\ %{(&fenc!=''?&fenc:&enc).(&bomb!=''?'\ With\ Bom':'\ No\ Bom')}]
set statusline+=%=[\ 第%l行,\ 第%c列\ 总计:\ %L行]

"" }}}

"" 鼠标 {{{

set mouse=a                "" 启用鼠标
set selectmode=mouse,key   "" 使用鼠标或按键进行选择
set selection=inclusive    "" 从光标处进行选择
set mousemodel=popup       "" Set the behaviour of mouse
set mousehide              "" 键入时隐藏鼠标光标

"" }}}

"" 光标 {{{

if has('gui_running')
  set guicursor=n-v-c-sm:block,i-ci-ve:block,r-cr-o:blocks
endif

"" }}}

"" 行号

set number            "" 显示行号
set numberwidth=4     "" 行号栏的宽度
set relativenumber    "" 相对行号

"插入模式下用绝对行号, 普通模式下用相对
autocmd InsertEnter * :set norelativenumber number
autocmd InsertLeave * :set relativenumber

"" 高亮

set cursorline                    "" 高亮当前行
set colorcolumn=79                "" 高亮显示第79列
autocmd InsertLeave * se nocul    "" 用浅色显示当前行
autocmd InsertEnter * se cul      "" 用浅色高亮当前行


"" 空白字符视觉提示

set list
set listchars=extends:↷,precedes:↶,tab:»»,space:˽,eol:↵
highlight LeaderTab guifg = yellow                         "" 设定行首tab为黄色
match LeaderTab /^\t/                                      "" 匹配行首tab

"----------------------------------------------------------------------
" 更改样式
"----------------------------------------------------------------------

" 更清晰的错误标注：默认一片红色背景，语法高亮都被搞没了
" 只显示红色或者蓝色下划线或者波浪线

hi! clear SpellBad
hi! clear SpellCap
hi! clear SpellRare
hi! clear SpellLocal

if has('gui_running')
	hi! SpellBad gui=undercurl guisp=red
	hi! SpellCap gui=undercurl guisp=blue
	hi! SpellRare gui=undercurl guisp=magenta
	hi! SpellRare gui=undercurl guisp=cyan
else
	hi! SpellBad term=standout ctermfg=1 term=underline cterm=underline
	hi! SpellCap term=underline cterm=underline
	hi! SpellRare term=underline cterm=underline
	hi! SpellLocal term=underline cterm=underline
endif

" 去掉 sign column 的白色背景
hi! SignColumn guibg=NONE ctermbg=NONE

" 修改行号为浅灰色，默认主题的黄色行号很难看，换主题可以仿照修改
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE 
	\ gui=NONE guifg=DarkGrey guibg=NONE

" 修正补全目录的色彩：默认太难看
hi! Pmenu guibg=gray guifg=black ctermbg=gray ctermfg=black
hi! PmenuSel guibg=gray guifg=brown ctermbg=brown ctermfg=gray

"----------------------------------------------------------------------
" 终端设置，隐藏行号和侧边栏
"----------------------------------------------------------------------
if has('terminal') && exists(':terminal') == 2
	if exists('##TerminalOpen')
		augroup VimUnixTerminalGroup
			au! 
			au TerminalOpen * setlocal nonumber signcolumn=no
		augroup END
	endif
endif



"----------------------------------------------------------------------
" quickfix 设置，隐藏行号
"----------------------------------------------------------------------
augroup VimInitStyle
	au!
	au FileType qf setlocal nonumber
augroup END


" 错误格式
set errorformat+=[%f:%l]\ ->\ %m,[%f:%l]:%m


