"" 全局配置 {{{

set nocompatible           "" 关闭兼容模式
set shortmess=atI          "" 不显示援助乌干达儿童的提示
set encoding=utf-8         "" 内部编码
set termencoding=utf-8     "" 终端编码
set fileencoding=utf-8     "" 编辑及保存文件时使用的编码

"" 自动识别文件编码
set fileencodings=ucs-bom,utf-8,cp936,gb18030,gbk,gb2312,big5,euc-jp,latin1

set fileformats=unix,dos,mac        "" 文件格式
set helplang=cn                     "" 中文帮助

"" }}}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"" 禁用内置插件，提高性能 {{{

let g:loaded_python_provider = 0
let g:loaded_perl_provider = 0
let g:loaded_ruby_provider = 0
let g:loaded_node_provider = 0
let g:did_install_default_menus = 1

let g:loaded_netrw = 1
let g:loaded_netrwPlugin = 1

let g:loaded_2html_plugin = 1
let g:loaded_zipPlugin = 1
let loaded_gzip = 1
let g:loaded_logipat = 1
let g:loaded_tarPlugin = 1
let g:loaded_getscriptPlugin = 1
let g:loaded_vimballPlugin = 1
let g:loaded_rrhelper = 1
let g:loaded_spellfile_plugin = 1
let g:loaded_tutor_mode_plugin = 1
let g:loaded_matchit = 1
let g:loaded_matchparen = 1

"" }}}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"" 加载配置 {{{

"" 防止重复加载
if get(s:, 'loaded', 0) != 0
    finish
else
    let s:loaded = 1
endif

"" 定义配置文件目录

let $VIMCONFIG=$HOME.'/.vim'
let s:config = $VIMCONFIG.'/config'

"" 定义LoadScript命令加载配置文件

command! -nargs=1 LoadScript exec 'source '.s:config.'/'.'<args>'

"" 加载配置文件

LoadScript config.vim        "" 基础配置
LoadScript plugin.vim        "" 插件配置
LoadScript style.vim         "" 界面样式
LoadScript map.vim           "" 按键映射

"" }}}
