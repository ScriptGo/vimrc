scriptencoding utf-8

call plug#begin('~/.vim/plugged')
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"" 启动页 {{{

    Plug 'mhinz/vim-startify'

"" }}}

"" 主题 {{{

    Plug 'joshdick/onedark.vim'
    Plug 'lifepillar/vim-gruvbox8'
    Plug 'sonph/onehalf', { 'rtp': 'vim' }
    Plug 'dracula/vim', { 'as': 'dracula' }

"" }}}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"" 文件管理 {{{

    Plug 'lambdalisue/fern.vim'
    Plug 'yuki-yano/fern-preview.vim'
    Plug 'lambdalisue/nerdfont.vim'
    Plug 'lambdalisue/fern-renderer-nerdfont.vim'
    Plug 'lambdalisue/glyph-palette.vim'

"" }}}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"" 实用插件 {{{

    Plug 'andymass/vim-matchup'
    Plug 'yianwillis/vimcdoc'
    Plug 'lilydjwg/colorizer'
    Plug 'gko/vim-coloresque'
    Plug 'tpope/vim-surround'
    Plug 'liuchengxu/graphviz.vim'
    Plug 'junegunn/vim-easy-align', { 'on': ['<Plug>(EasyAlign)', 'EasyAlign'] }
    Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!', 'WhichKeyVisual', 'WhichKeyVisual!'] }

"" }}}

"" 文本对象 {{{

    	" 基础插件：提供让用户方便的自定义文本对象的接口
	Plug 'kana/vim-textobj-user'

	" indent 文本对象：ii/ai 表示当前缩进，vii 选中当缩进，cii 改写缩进
	Plug 'kana/vim-textobj-indent'

	" 语法文本对象：iy/ay 基于语法的文本对象
	Plug 'kana/vim-textobj-syntax'

	" 函数文本对象：if/af 支持 c/c++/vim/java
	Plug 'kana/vim-textobj-function', { 'for':['vim'] }

	" 参数文本对象：i,/a, 包括参数或者列表元素
	Plug 'sgur/vim-textobj-parameter'

	" 提供 uri/url 的文本对象，iu/au 表示
	Plug 'jceb/vim-textobj-uri'
	
"" }}}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"" Markdown {{{

    " 表格对齐，使用命令 Tabularize
    Plug 'godlygeek/tabular', { 'on': 'Tabularize' }
    Plug 'mzlogin/vim-markdown-toc',  { 'on': ['GenTocGFM', 'GenTocRedcarpet', 'GenTocGitLab', 'UpdateToc', 'RemoveToc'] }

"" }}}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"" Coding {{{

    Plug 'rebolek/vim-red'
    Plug 'Yggdroot/indentLine', { 'for': ['vim', 'sh'] }
    Plug 'luochen1990/rainbow'
    Plug 'jiangmiao/auto-pairs'
    Plug 'dense-analysis/ale'
    Plug 'skywind3000/asynctasks.vim'
    Plug 'skywind3000/asyncrun.vim'

    
    Plug 'prabirshrestha/asyncomplete.vim'
    Plug 'prabirshrestha/vim-lsp'
    Plug 'mattn/vim-lsp-settings'
    Plug 'rhysd/vim-lsp-ale'
    Plug 'prabirshrestha/asyncomplete-lsp.vim'
    
"" }}}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#end()
filetype plugin indent on

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" UI {{{

    set termguicolors
    colorscheme dracula
    set background=dark

"" }}}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" 文件管理
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"" Fern {{{

"" 显示隐藏文件
let g:fern#default_hidden=1
let g:fern#renderer = 'nerdfont'

"" 关闭默认按键绑定
let g:fern#disable_default_mappings = 1

function! FernInit() abort
  nmap <buffer><expr>
        \ <Plug>(fern-my-open-expand-collapse)
        \ fern#smart#leaf(
        \   "\<Plug>(fern-action-open:select)",
        \   "\<Plug>(fern-action-expand)",
        \   "\<Plug>(fern-action-collapse)",
        \ )
  nmap <buffer><nowait> <CR> <Plug>(fern-my-open-expand-collapse)
  nmap <buffer><nowait> a <Plug>(fern-action-collapse)
  nmap <buffer><nowait> o <Plug>(fern-action-open)
  nmap <buffer><nowait> l <Plug>(fern-action-expand)
  nmap <buffer><nowait> n <Plug>(fern-action-new-path)
  nmap <buffer><nowait> N <Plug>(fern-action-new-file)
  nmap <buffer><nowait> c <Plug>(fern-action-copy)
  nmap <buffer><nowait> d <Plug>(fern-action-remove)
  nmap <buffer><nowait> m <Plug>(fern-action-move)
  nmap <buffer><nowait> r <Plug>(fern-action-rename)
  nmap <buffer><nowait> R <Plug>(fern-action-reload)
  nmap <buffer><nowait> h <Plug>(fern-action-hidden:toggle)
  nmap <buffer><nowait> t <Plug>(fern-action-mark)
  nmap <buffer><nowait> b <Plug>(fern-action-open:split)
  nmap <buffer><nowait> v <Plug>(fern-action-open:vsplit)
  nmap <buffer><nowait> < <Plug>(fern-action-leave)
  nmap <buffer><nowait> > <Plug>(fern-action-enter)
endfunction

augroup FernGroup
  autocmd! *
  autocmd FileType fern setlocal norelativenumber | setlocal nonumber | call FernInit()
augroup END

"" 预览
function! s:fern_settings() abort
    nmap <silent> <buffer> p     <Plug>(fern-action-preview:toggle)
    nmap <silent> <buffer> <C-p> <Plug>(fern-action-preview:auto:toggle)
    nmap <silent> <buffer> <C-d> <Plug>(fern-action-preview:scroll:down:half)
    nmap <silent> <buffer> <C-u> <Plug>(fern-action-preview:scroll:up:half)
endfunction

augroup fern-settings
    autocmd!
    autocmd FileType fern call s:fern_settings()
augroup END

"" }}}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" 实用插件
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"" vim-matchup {{{
" Improve performance
let g:matchup_matchparen_deferred = 1
let g:matchup_matchparen_timeout = 100
let g:matchup_matchparen_insert_timeout = 30

" Enhanced matching with matchup plugin
let g:matchup_override_vimtex = 1

" Whether to enable matching inside comment or string
let g:matchup_delim_noskips = 0

" Show offscreen match pair in popup window
let g:matchup_matchparen_offscreen = {'method': 'popup'}

"" }}}


"" vim-surround {{{

"- ds 删除一个配对符号
"- cs 修改一个配对符号
"- ys 增加一个配对符号

"" }}}

"" vim-easy-align {{{

xnoremap <silent> ga <Plug>(EasyAlign)
nnoremap <silent> ga <Plug>(EasyAlign)
" Align GitHub-flavored Markdown tables
au FileType markdown vmap <Leader><Bslash> :EasyAlign*<Bar><Enter>

"" }}}

"" which-key {{{
nnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :<c-u>WhichKeyVisual '<Space>'<CR>

nnoremap <silent> <localleader> :<c-u>WhichKey ','<CR>
vnoremap <silent> <localleader> :<c-u>WhichKeyVisual ','<CR>
"" }}}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Codeing
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"" indentLine {{{

let g:indentLine_enabled = 1
let g:indentLine_char_list = ['|', '¦', '┆', '┊', '▏']

if has('gui_running')
    let g:indentLine_color_gui = '#A4E57E'
else
    let g:indentLine_color_term = 239
endif

"" }}}

"" rainbow {{{

let g:rainbow_active = 1 ""启用rainbow

"" }}}


"" ALE {{{

let g:ale_fix_on_save = 1

"" 始终显示列标记
let g:ale_sign_column_always = 1

"" 打开文件时不进行检查
let g:ale_lint_on_enter = 0
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_on_text_chaged = 'normal'

"" 自定义error和warning图标
let g:ale_sign_error = '✖'
let g:ale_sign_warning = '⚠'

"" 显示Linter名称,出错或警告等相关信息
let g:ale_echo_msg_error_str = '✖ '
let g:ale_echo_msg_warning_str = '⚠ '
let g:ale_echo_msg_format = ' [ %severity% : %code% ] %s [ %linter% ]'

"" 使用指定的Linter
let g:ale_linters_explicit = 1
let g:ale_linters = {
\   'vim': ['language-server'],
\   'sh': ['language_server'],
\}


"" 关闭本地列表,使用 quickfix
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1

"" sp前往上一个错误或警告，sn前往下一个错误或警告
nmap sp <Plug>(ale_previous_wrap)
nmap sn <Plug>(ale_next_wrap)

"" <Leader>s触发/关闭语法检查
nmap <Leader>s :ALEToggle<CR>
"" <Leader>d查看错误或警告的详细信息
nmap <Leader>d :ALEDetail<CR>

"" }}}

"" AsyncRun {{{

let g:asyncrun_open = 8    "" 自动打开 quickfix window ，高度为 8
let g:asyncrun_bell = 1    "" 任务结束时候响铃提醒


"" }}}

"" Lsp {{{

"" vim-language-server
"" bash-language-sever

"" }}}
