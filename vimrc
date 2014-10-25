"{{{ ===== 一般设置=====
" 映射<Leader>为英文逗号
let mapleader = ","
let g:mapleader = ","


" set foldlevel=100     " 禁止自动折叠
" set list              " 显示特殊字符，其中Tab使用高亮竖线代替，尾部空白使用高亮点号代替
" set listchars=tab:\|\ ,trail:.
" set nowrap                  " 设置不自动换行
" set tabline=%{tabpagenr()}.%t\ %m "设置tab栏显示的信息
" set go=egmLrtT "设置回默认的显示方式，可用
" set guioptions-=T " 隐藏工具栏
" set guioptions-=m " 隐藏菜单栏
set autochdir         " 设定文件浏览器目录为当前目录
set autoindent        " 自动对齐
set autoread          " 当文件在外部被修改时自动更新该文件
set backspace=2       " 设置退格键可用
set cmdheight=2       " 命令行的高度，默认为1，这里设为2
set cursorcolumn      " 高亮显示当前列
set cursorline        " 高亮显示当前行
set expandtab         " 将Tab自动转化成空格 [需要输入真正的Tab键时，使用 Ctrl+V + Tab]
set fdm=syntax        " 修改折叠类型manual syntax indent marker
set guioptions=       "设置界面超简洁模式，无菜单，工具栏，无所有滚动条
set guitablabel=[%{tabpagenr()}]\ %t\ %m "设置tab栏显示的信息
set hidden            " 允许在有未保存的修改时切换缓冲区
set hlsearch          " 开启高亮显示结果
set incsearch         " 开启实时搜索功能
set laststatus=2      " 开启状态栏信息
set mouse=a           " 启用鼠标
set nobackup          " 关闭备份文件
set nocompatible      " 关闭兼容模式
set nowrapscan        " 搜索到文件两端时不重新搜索
set nu!               " 显示行号
set relativenumber    " 开启相对行号
set ruler             " 右下角显示光标位置的状态行
set shiftwidth=4      " 设置通用缩进策略
set showcmd           " 在屏幕最后一行显示未输入完成的命令
set showmatch         " 显示括号配对情况
set smartindent       " 智能自动缩进
set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\%0(%{&fileformat}\ %{&encoding}\:%{&fileencoding}\ [%c%V:%l/%L-%p%%]%) " 设置在状态行显示的信息
set tabstop=4         " 设置通用缩进策略
set writebackup       " 设置无备份文件
"}}}

"{{{  ===== 自定义快捷键 =====

" Alt  + H           bufswitch
imap <ESC>h <ESC>:bp<CR>
nmap <ESc>h <ESC>:bp<CR>
vmap <ESC>h <ESC>:bp<CR>

" Alt  + L           bufswitch
imap <ESC>l <ESC>:bn<CR>
nmap <ESC>l <ESC>:bn<CR>
vmap <ESC>l <ESC>:bn<CR>

" \c                  复制至公共剪贴板
vmap <leader>c "+y

" \v                  从公共剪贴板粘贴
imap <leader>v <ESC>"+p
nmap <leader>v "+p
vmap <leader>v "+p

" \16                 十六进制格式查看
nmap <leader>16 <ESC>:%!xxd<ESC>

" \r16                返回普通格式
nmap <leader>r16 <ESC>:%!xxd -r<ESC>

" \rb                 一键去除所有尾部空白
imap <leader>rb <ESC>:let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
nmap <leader>rb <ESC>:let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
vmap <leader>rb <ESC>:let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" \rt                 一键替换全部Tab为空格
func! RemoveTabs()
    if &shiftwidth == 2
        exec "%s/    /  /g"
    elseif &shiftwidth == 4
        exec "%s/    /    /g"
    elseif &shiftwidth == 6
        exec "%s/    /      /g"
    elseif &shiftwidth == 8
        exec "%s/    /        /g"
    else
        exec "%s/    / /g"
    end
endfunc

imap <leader>rt <ESC>:call RemoveTabs()<CR>
nmap <leader>rt :call RemoveTabs()<CR>
vmap <leader>rt <ESC>:call RemoveTabs()<CR>

" \th                 一键生成与当前编辑文件同名的HTML文件 [不输出行号]
imap <leader>th <ESC>:set nonumber<CR>:set norelativenumber<CR><ESC>:TOhtml<CR><ESC>:w %:r.html<CR><ESC>:q<CR>:set number<CR>:set relativenumber<CR>
nmap <leader>th <ESC>:set nonumber<CR>:set norelativenumber<CR><ESC>:TOhtml<CR><ESC>:w %:r.html<CR><ESC>:q<CR>:set number<CR>:set relativenumber<CR>
vmap <leader>th <ESC>:set nonumber<CR>:set norelativenumber<CR><ESC>:TOhtml<CR><ESC>:w %:r.html<CR><ESC>:q<CR>:set number<CR>:set relativenumber<CR>
"}}}

"{{{ ===== 设置字体及语法高亮颜色(全平台全版本通用)=====

" if has("gui_running")  "若以gvim(带GUI)形式运行

    " set lines=46
    " set columns=57
    " if has("gui_macvim") || has("mac")  "Mac平台的设置
    "     set lazyredraw  "启用延迟重绘
    "     set transparency=20  "设置透明，0-100之间
    "     set go=TRrgme "设置MacVim专有的显示工具栏及右滚动条
    "     "因mac也属于unix，故要先判断系统是否MacOS,
    "     "不是mac之后再用elseif判断是否unix
    "     "否则Mac平台设置会被unix平台设置所覆盖不会生效
    " elseif has("unix")  "Linux, Unix平台的设置
    "     "因linux字体名称不一，安装的字体也不一，故有几个可选
    "     "若不好看，可用:set gfn=* 弹出字体选择框手动重选
    "     set go=e
    "     "解决Linux gvim菜单乱码
    "     set langmenu=zh_CN.UTF-8
    "     source $VIMRUNTIME/delmenu.vim
    "     source $VIMRUNTIME/menu.vim
    "     language messages zh_CN.utf-8
    " endif
    " if has("win32") "Windows平台的设置
    " endif

    " colorscheme molokai   "设置配色方案
    " set background=light
    set background=dark
    colorscheme solarized
    "以无gui方式即shell下运行vim时的颜色，
    "因shell下无法调整字体，故不需设置字体
" else
    " colorscheme desert
    " colorscheme slate
    " colorscheme tango2
" endif

" 设置文件编码和文件格式
set fenc=utf-8
set encoding=utf-8
set fileencodings=utf-8,gbk,cp936,latin-1
set fileformat=unix
set fileformats=unix,dos,mac

"字体"
" set gfw=Microsoft\ Yahei:h10.5:cGB2312
" set gfw=幼圆:h14:cGB2312
" set guifont=Bitstream_Vera_Sans_Mono:h11.8:cANSI
" set guifont=consolas:h14   "字体设置
" set guifont=Consolas_for_Powerline_FixedD:h14:cANSI
" set guifont=DejaVu_Sans_Mono_for_Powerline:h14:cANSI
" set guifont=monaco:h13:cANSI
" set guifont=文泉驿等宽正黑\ Medium\ 14
" set guifontwide=WenQuanYi\ Micro\ Hei\ Mono:h14
" set guifontwide=文泉驿等宽正黑\ Medium\ 14
" set guifont=Monaco\ for\ Powerline:h14:cANSI " windows
set guifont=Monaco\ for\ Powerline\ 11  "linux
" set guifont=Inconsolata_for_Powerline:h14:cANSI
set guifontwide=Microsoft\ YaHei\ 13
" set guifontwide=Microsoft_YaHei_Mono:h12:cANSI
" set guifontwide=YaHei_Consolas_Hybrid:h12:cGB2312
"设置光标在输入法IME关闭时显示浅蓝色，而在开启时显示绿色。
"以上设置只在Normal模式下才有用，而且有时也不准，
"而在Insert模式下都是显示CursorIM的设置，也就是绿色
"注意，在切换了syntax状态和coloscheme之后该设置可能会失效
if has("multi_byte_ime")
    highlight Cursor guibg=LightBlue guifg=NONE
    highlight CursorIM guibg=Green guifg=NONE
endif
"}}}

"{{{ ===== 加载pathogen插件管理器=====
filetype off

execute pathogen#infect()
call pathogen#infect()
call pathogen#helptags()


syntax enable                " 打开语法高亮
syntax on                    " 开启文件类型侦测
filetype indent on           " 针对不同的文件类型采用不同的缩进格式
filetype plugin on           " 针对不同的文件类型加载对应的插件
filetype plugin indent on    " 启用自动补全

" 根据后缀名指定文件类型
au BufRead,BufNewFile *.h   setlocal ft=c
au BufRead,BufNewFile *.sql setlocal ft=mysql
au BufRead,BufNewFile *.txt setlocal ft=txt

" 对部分语言设置单独的缩进
au filetype coffee,jade,sh set shiftwidth=2
au FileType coffee,jade,sh set tabstop=2
"surround,减号,用surround命令增加fold marker,比如V选几行,S-
autocmd FileType vim let g:surround_45 = "\"{{{ \r\"}}}"
autocmd FileType C let g:surround_45 = "/*{{{ */\r/*}}}*/"
autocmd FileType CPP let g:surround_45 = "//{{{ \r//}}}"

"}}}

"{{{ ===== 界面优化=====
" fencview.vim 自动识别编码
" colorizer-master  可以显示#rgb
" vim-trailing-whitespace-master将代码行最后无效的空格标红
" vim-better-whitespace 更好的空格标红版本

"{{{ ===== " vim-indent-guides 高亮缩进=====
"缩进插件——vim-indent-guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size=1
"}}}

"{{{ ===== "airline状态栏=====
" vim-airline-master 状态栏插件
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='light'                " 设置主题
"}}}

"{{{ ===== " rainbow 括号高亮 各种颜色=====
" let g:rainbow_active = 1 " 0 if you want to enable it later via :RainbowToggle
"}}}

"}}}

"{{{ ===== 语法高亮和语法检查=====
"{{{ ===== jsbeautify 自动检测并格式化javascript  <leader>ff=====
" jsbeautify配置
let g:jsbeautify = {"indent_size": 4, "indent_char": "\t"}
"}}}

"{{{ =====" python-syntax python语法高亮=====
let python_highlight_all = 1
"}}}

"{{{ ===== " vim-css3-syntax 修正=====
augroup VimCSS3Syntax
    autocmd!

    autocmd FileType css setlocal iskeyword+=-
augroup END

"}}}

" vim-json 高亮json
" syntastic语法检查
" vim-javascript 支持语法高亮和缩进
"}}}

"{{{ ===== 快速查找 定位 编辑=====
" vim-easymotion 快速定位 <leader><leader>w  f
" :CtrlP 快速查找
" pydoc.vim :Pydoc int    <leader>pw
" bufexplorer.zip <leader>be bs bv 编辑缓存
" ListToggle 快速定位quickfix  listtoggle <leader>l and <leader>q, respectively.
" VisIncr 列编辑 Ctrl-v  :I
" vim-mark <leader>m　标记<Leader># or * 重复 *or#  :Marks
" matchit.vim 扩展 " %"  的匹配功能

"{{{ =====  vim-easy-align 快速对齐，  vmap <Enter> <Plug>(EasyAlign)  nmap <Leader>a <Plug>(EasyAlign)=====
" Start interactive EasyAlign in visual mode
vmap <Enter> <Plug>(EasyAlign)

" Start interactive EasyAlign with a Vim movement
nmap <Leader>a <Plug>(EasyAlign)
"}}}

"}}}

"{{{ ===== 目录管理，标签管理，文档管理=====
" vim-nerdtree-tabs 使NERDTree看起来更真实，独立于tab
" auto_mkdir :w自动创建文件夹
" renamer.vim "  :Renamer 当前文件所在文件夹下内容显示在一个新窗口:Ren 开始重命名
" tagbar 配合ctag 浏览源文件
"{{{ Plugin Config: tagbar
nmap <leader>tb :TagbarToggle<CR>
if has('macunix')
	let g:tagbar_ctags_bin = '/usr/local/bin/ctags'
elseif has('win32')
	let $CTAGS=expand('$VIM/.ctags')
	if has('win64')
		let g:tagbar_ctags_bin = "$VIM/ctags64.exe"
	else
		let g:tagbar_ctags_bin = "$VIM/ctags32.exe"
	endif
endif
"}}}
" nnoremap <silent> <F9> :TagbarToggle<CR>
" ccvext.vim 自动生成当前文件的tag 利用ctags，cscope 盘符根目录的.symbs " linux下 ~/.symbs
" <Leader>sy 自动生成tags与cscope文件并连接
" <Leader>sc 连接已存在的tags与cscope文件
"{{{ "  < cscope 工具配置 >
" 用Cscope自己的话说 - "你可以把它当做是超过频的ctags"
if has("cscope")
    "设定可以使用 quickfix 窗口来查看 cscope 结果
    set cscopequickfix=s-,c-,d-,i-,t-,e-
    "使支持用 Ctrl+]  和 Ctrl+t 快捷键在代码间跳转
    set cscopetag
    "如果你想反向搜索顺序设置为1
    set csto=0
    "在当前目录中添加任何数据库
    if filereadable("cscope.out")
        cs add cscope.out
        "否则添加数据库环境中所指出的
    elseif $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    endif
    set cscopeverbose
    "快捷键设置
    nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
    nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>
endif
"}}} 
"  < ctags 工具配置 >"{{{
" 对浏览代码非常的方便,可以在函数,变量之间跳转等
set tags=./tags;                            "向上级目录递归查找tags文件（好像只有在Windows下才有用）"}}}

"{{{ ===== NerdTree  目录管理=====
" 设置NerdTree
" \nt                 打开NERDTree窗口，在左侧栏显示
" nmap <leader>nt :NERDTree<CR>
" map <Leader>nt <plug>NERDTreeTabsToggle<CR>
map <leader>nt :NERDTreeMirror<CR>
map <leader>nt :NERDTreeToggle<CR>
"vim-nerdtree-tabs 使NERDTree看起来更真实，独立于tab
let g:nerdtree_tabs_open_on_console_startup=1
let g:nerdtree_tabs_open_on_gui_startup=0
"}}}

"}}}

"{{{ ===== 快速生成代码=====
" vim-surround  ds{ 删除大括号 dst 删除标签 cs{  cst 修改 ysiw)   yss 整行括起来
" vim-expand-region-master 增量选择代码 +-
" delimitMate  自动补全({['"
" tcommenter 快速添加注释  gcc
" xml.vim 标记的自动闭合. 标记换行＋闭合>>第一个标记连写实现.标记的快速输入;;实现.快速修改标记名\c

"{{{ =====  emmet.vim html代码生成=====
" div>p#foo$*3>a 然后按快捷键 <c-y>,  V   <c-y>,   键入ul>li*，然后按 Enter   n / A D  I  J 仿CSS选择器的语法来快速开发HTML和CSS
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
"}}}

"{{{ ===== neocomplete 自动补全=====
" neosnippet.vim 速写代码
" neosnippet-snippets 配置代码
"neocomplete
"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
            \ 'default' : '',
            \ 'vimshell' : $HOME.'/.vimshell_hist',
            \ 'scheme' : $HOME.'/.gosh_completions'
            \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
    return neocomplete#close_popup() . "\<CR>"
    " For no inserting <CR> key.
    "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplete#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplete#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplete#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplete#enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplete#enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

"neosnippet
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
            \ "\<Plug>(neosnippet_expand_or_jump)"
            \: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
            \ "\<Plug>(neosnippet_expand_or_jump)"
            \: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
    set conceallevel=2 concealcursor=i
endif
" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='F:\Program Files\Vim\vimfiles\snippets'
"}}}

"}}}

"{{{ ===== mutt =====
" set tmpdir="~/.tmp"
au BufRead /tmp/mutt-* set tw=72
" set rfc2047_parameters=yes

"}}}

"{{{ ===== Vimwiki =====

let g:vimwiki_w32_dir_enc     = 'utf-8' " 设置编码
let g:vimwiki_camel_case = 0        "禁用驼峰
" let g:vimwiki_use_mouse=1         " 使用鼠标映射
let g:vimwiki_valid_html_tags = 'a,img,b,i,s,u,sub,sup,br,hr,div,del,code,red,center,left,right,h1,h2,h3,h4,h5,h6,pre,script,style'
" 声明可以在wiki里面使用的HTML标签
let blog                      = {}
let blog.path                 = '~/diary/wiki/'
let blog.path_html            = '~/diary/html/'
let blog.template_path        = '~/diary/templates/'
let blog.template_default     = 'site'
let blog.template_ext         = '.html'
let blog.auto_export          = 1
let Blog                      = {}
let Blog.path                 = 'D:\mywiki\wiki'
let Blog.path_html            = 'D:\mywiki\html'
let blog.template_default     = 'default.tpl'
let blog.template_ext         = '.html'
let g:vimwiki_list            = [blog,Blog]
"}}}


" vim:fdm=marker:ts=4
