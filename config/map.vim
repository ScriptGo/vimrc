scriptencoding utf-8

"" 主leader绑定为 <Space>
"" 副leader绑定为 ,

let g:mapleader="\<Space>"
let g:maplocalleader=','

"" 将 : 映射为 ;
nnoremap ; :
xnoremap ; :

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" 保存与退出 {{{

    "" :W sudo saves the file
    "" (useful for handling the permission-denied error)
    command! W w !sudo tee % > /dev/null

    "" 保存
    nnoremap <leader>w :w<CR>
    inoremap <C-s> <C-o>:w<CR>

    "" 关闭
    nnoremap <leader>q :q<CR>
    inoremap <C-q> <ESC>:wq<CR>

    "" 使用 jj替代Esc
    inoremap jj <Esc>
    cnoremap jj <C-c>

"" }}}

"" Use sane regex expression (see `:h magic` for more info)
nnoremap / /\v
vnoremap / /\v

"插入模式下输入当前日期和时间
inoremap nwt <C-R>=strftime("%Y-%m-%d %H:%M:%S")<CR>
inoremap ddt <C-R>=strftime("%Y-%m-%d")<CR>



" Reselect visual block after indent/outdent
" Visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv

" Don't jump when using * for search
nnoremap * *<c-o>

" Yank to the end of line
nnoremap Y y$


"" 快速编辑
nnoremap <leader>ev <C-w>s<C-w>j:e $MYVIMRC<CR>
nnoremap <leader>eg <C-w>s<C-w>j:e ~/.gitconfig<CR>
nnoremap <leader>ez <C-w>s<C-w>j:e ~/.zshrc<CR>
nnoremap <leader>et <C-w>s<C-w>j:e ~/.tmux.conf<CR>

" 打开当前光标所在单词的vim帮助文档
nnoremap <leader>H :execute ":help " . expand("<cword>")<CR>

" 复制当前选中到系统剪切板
vmap <leader><leader>y "+y

" 将系统剪切板内容粘贴到vim
nnoremap <leader><leader>p "+p

" 打开文件自动定位到最后编辑的位置
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g'\"" | endif



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Easy window split; C-w v -> vv, C-w - s -> ss
nnoremap <silent> vv <C-w>v
nnoremap <silent> ss <C-w>s

" Move half page faster
nnoremap <Leader>d  <C-d>
nnoremap <Leader>u  <C-u>
"" {{{

    "" 移动到行首/行尾
    nnoremap H ^
    nnoremap L $

    "" 按 wrap 逻辑换行进行跳转
    nnoremap j gj
    nnoremap k gk
    
    vnoremap j gj
    vnoremap k gk

"" }}}

"" 插入模式 {{{

    "" 移动到行首/行尾
    inoremap <C-a> <Home>
    inoremap <C-e> <End>

    "" 向左/右移动一个字符
    inoremap <A-h> <Left>
    inoremap <A-l> <Right>

    "" 向上/下直线移动一个字符(行)
    inoremap <C-k> <C-\><C-o>gk
    inoremap <C-j> <C-\><C-o>gj

    "" 向左/右移动一个word
    inoremap <C-b> <C-o>b
    inoremap <C-f> <C-o>w

"" }}}

"" {{{

    "" 移动到行首/行尾
    cnoremap <C-a> <Home>
    cnoremap <C-e> <End>

    "" 向左/右移动一个字符
    cnoremap <C-h> <Left>
    cnoremap <C-l> <Right>

    "" 向左/右移动一个word
    cnoremap <C-b> <C-Left>
    cnoremap <C-f> <C-Right>

"" }}}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" 编辑

"" 向左/右删除一个字符(BS/Del)
inoremap <C-h> <BS>
inoremap <C-l> <Del>

cnoremap <A-h> <BS>
cnoremap <A-l> <Del>

"" 向左/右删除一个word
inoremap <A-b> <C-o>db
inoremap <A-f> <C-o>dw

cnoremap <A-b> <C-w>
cnoremap <A-f> d<C-Right>

"" 删除当前行
nnoremap <A-d> d$
inoremap <C-d> <C-o>dd
cnoremap <C-u> <C-E><C-U>

"" 在当前行的下方/上方插入新行
if has('gui_running')
     inoremap <C-enter> <C-o>o
     inoremap <C-Down> <C-o>O
   else
     inoremap <s-enter> <C-o>o
     inoremap <s-Down> <C-o>O
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Windows
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 窗口切换：ALT+SHIFT+hjkl
" 传统的 CTRL+hjkl 移动窗口不适用于 vim 8.1 的终端模式，CTRL+hjkl 在
" bash/zsh 及带文本界面的程序中都是重要键位需要保留，不能 tnoremap 的

    nnoremap <A-H> <c-w>h
    nnoremap <A-L> <c-w>l
    nnoremap <A-J> <c-w>j
    nnoremap <A-K> <c-w>k

    inoremap <A-H> <ESC><c-w>h
    inoremap <A-L> <ESC><c-w>l
    inoremap <A-J> <ESC><c-w>j
    inoremap <A-K> <ESC><c-w>k

if has('terminal') && exists(':terminal') == 2 && has('patch-8.1.1')
    " vim 8.1 支持 termwinkey ，不需要把 terminal 切换成 normal 模式
    " 设置 termwinkey 为 CTRL 加减号（GVIM），有些终端下是 CTRL+?
    " 后面四个键位是搭配 termwinkey 的，如果 termwinkey 更改，也要改
    set termwinkey=<C-_>
    tnoremap <A-H> <C-_>h
    tnoremap <A-L> <C-_>l
    tnoremap <A-J> <C-_>j
    tnoremap <A-K> <C-_>k
    tnoremap <A-q> <C-\><C-n>
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Tab
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nnoremap <silent> <leader>tw :tabnew<CR>
nnoremap <silent> <leader>to :tabclose<CR>
nnoremap <silent> <leader>te :tabedit <c-r>=expand("%:p:h")<CR>/
nnoremap <silent> <leader>tm :tabmove<CR>

nnoremap <silent> <C-t> :tabnew<CR>
inoremap <silent> <C-t> <C-o>:tabnew<CR>


"" 切换Tab
nnoremap <silent> <C-Tab>  :tabnext<CR>
nnoremap <silent> <A-Tab>  :tabprev<CR>

inoremap <silent> <C-Tab>  <C-O>:tabnext<CR>
inoremap <silent> <A-Tab>  <C-O>:tabprev<CR>

nnoremap <silent> <leader>tn :tabnext<CR>
nnoremap <silent> <leader>tp :tabprev<CR>


noremap <silent><A-1> :tabn 1<CR>
noremap <silent><A-2> :tabn 2<CR>
noremap <silent><A-3> :tabn 3<CR>

inoremap <silent><A-1> <ESC>:tabn 1<CR>
inoremap <silent><A-2> <ESC>:tabn 2<CR>
inoremap <silent><A-3> <ESC>:tabn 3<CR>



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Buffer
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""{{{

nnoremap <silent> <S-Right>  :bnext<CR>
nnoremap <silent> <S-Left>   :bprevious<CR>

"设置切换Buffer快捷键
nnoremap <C-tab> :bn<CR>
nnoremap <C-s-tab> :bp<CR>

"映射切换buffer的键位
nnoremap [b :bp<CR>
nnoremap ]b :bn<CR>
nnoremap ]b :bnext<cr>
nnoremap [b :bprev<cr>
"""关闭
nnoremap <C-x>  :bd<CR>

"""}}}

" Buffer {

nnoremap <silent> <Leader>bp :bprevious<CR>
nnoremap <silent> <Leader>bn :bnext<CR>
nnoremap <silent> <Leader>bf :bfirst<CR>
nnoremap <silent> <Leader>bl :blast<CR>
nnoremap <silent> <Leader>bd :bd<CR>
nnoremap <silent> <Leader>bk :bw<CR>

" }

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" 功能键配置
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"" F1 废弃这个键，防止调出系统帮助
noremap <F1> <ESC>

"" F2 普通模式下相对行号和绝对行号的切换
function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber number
  else
    set relativenumber
  endif
endfunc
nnoremap <silent> <F2> :call NumberToggle()<CR>

"" F3 显示/隐藏缩进线
nnoremap <silent> <F3> :IndentLinesToggle<CR>:set list! lcs=tab:\\|\<Space><CR>

"" F4 显示/隐藏 Fern
nnoremap <silent> <F4> :Fern . -drawer -toggle -width=25 -reveal=%<CR>

"" F5 运行当前文件：根据文件类型判断方法，并且输出到 quickfix 窗口
nnoremap <silent> <F5> :call ExecuteFile()<CR>

function! ExecuteFile()
	let cmd = ''
	if index(['c', 'cpp', 'rs', 'go'], &ft) >= 0
		" native 语言，把当前文件名去掉扩展名后作为可执行运行
		" 写全路径名是因为后面 -cwd=? 会改变运行时的当前路径，所以写全路径
		" 加双引号是为了避免路径中包含空格
		let cmd = '"$(VIM_FILEDIR)/$(VIM_FILENOEXT)"'
	elseif &ft == 'python'
		let $PYTHONUNBUFFERED=1 " 关闭 python 缓存，实时看到输出
		let cmd = 'python "$(VIM_FILEPATH)"'
	elseif &ft == 'javascript'
		let cmd = 'node "$(VIM_FILEPATH)"'
	elseif &ft == 'zsh'
		let cmd = 'zsh "$(VIM_FILEPATH)"'
	elseif &ft == 'sh'
		let cmd = 'bash "$(VIM_FILEPATH)"'
	else
		return
	endif
	
	" -raw: 输出内容直接显示到 quickfix window 不匹配 errorformat
	" -save=2: 保存所有改动过的文件
	" -cwd=$(VIM_FILEDIR): 运行初始化目录为文件所在目录
	if has('unix')
		exec 'AsyncRun -cwd=$(VIM_FILEDIR) -raw -save=2 -mode=0 '. cmd
	endif
endfunc

"" F6 打开QuickFix
nnoremap <silent> <F6> :call asyncrun#quickfix_toggle(6)<CR>

"" F7
"" F8

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" 插件按键配置
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""



