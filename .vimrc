

"""""""""""""""""""""""""vim-plug Setting"""""""""""""""""""
" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

Plug 'connorholyday/vim-snazzy'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'chazy/cscope_maps' "map cscope shortcuts
Plug 'ctrlpvim/ctrlp.vim'
"Plug 'scrooloose/syntastic'
"Plug 'Valloric/YouCompleteMe'
"Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
"Plug 'ycm-core/YouCompleteMe'
Plug 'Shougo/deoplete.nvim'  
Plug 'roxma/nvim-yarp' 
Plug 'roxma/vim-hug-neovim-rpc'
let g:deoplete#enable_at_startup = 1
" Using a non-master branch
"Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
"Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }


" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
"Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
"Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
"Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Unmanaged plugin (manually installed and updated)
"Plug '~/my-prototype-plugin'

" Initialize plugin system
call plug#end()

"""""""""""""""""""""""""vim-plug Setting Ending"""""""""""""""""""

""""""""""""""""""""""""""""""
" ctrlp setting
""""""""""""""""""""""""""""""
"Change the default mapping and the default command to invoke CtrlP
let g:ctrlp_map = ',,'
"let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

let g:ctrlp_working_path_mode = 'ra' " When invoked without an explicit starting directory, CtrlP will set its local working directory according to this variable:

set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

""""""""""""""""""""""""""""""
" ctrlp setting ending
""""""""""""""""""""""""""""""



""""""""""""""""""""""""""""""
" cscope setting
""""""""""""""""""""""""""""""
"cs add scope.out " add any database in current directory
"
"set cscopequickfix=s-,c-,d-,i-,t-,e-,a-
if has("cscope")
	set csprg=/usr/bin/cscope
"	set csto=0 " cscope database first, and then tag files 
	set csto=1
	set cst
	set nocsverb
" add any database in current directory
"	if filereadable("cscope.out")
"		cs add cscope.out 
"	elseif $CSCOPE_DB != ""
"		cs add $CSCOPE_DB
"	endif
	set csverb
endif
set cscoperelative "用 cscope.out 路径目录名作为前缀

nmap <C-\>s :cs find s <C-R>=expand"<cword>")<CR><CR>
nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>
"""""""""""""""""""""""""cscope Setting Ending"""""""""""""""""""



""""""""""""""""""""""""""""""
" taglist(ctags) setting
""""""""""""""""""""""""""""""
nmap <silent> <leader>tl :Tlist<cr>

let Tlist_Ctags_Cmd = '/usr/bin/ctags'  
let Tlist_Show_One_File = 1  "不同时显示多个文件的tag，只显示当前文件的 
"let Tlist_File_Fold_Auto_Close=1 "同时显示多个文件中的tag时，可使taglist只显示当前文件tag，其它文件的tag都被折叠
let Tlist_Exit_OnlyWindow = 1  "如果taglist窗口是最后一个窗口，则退出vim  

let Tlist_Auto_Open=1    "在启动VIM后，自动打开taglist窗口 
let Tlist_Use_SingleClick= 1    " 缺省情况下，在双击一个tag时，才会跳到该tag定义的位置
"let Tlist_Process_File_Always=1  "taglist始终解析文件中的tag，不管taglist窗口有没有打开 
"set tags=/你的目录/tags,tags;$HOM

"set tags=tagPath
set tags=tags;
set autochdir "注: 第一个命令里的分号是必不可少的。这个命令让vim首先在当前目录里寻找tags文件，如果没有找到tags文件，或者没有找到对应的目标，就到父目录中查找，一直向上递归。因为tags文件中记录的路径总是相对于tags文件所在的路径，所以要使用第二个设置项来改变vim的当前目录
let Tlist_Enable_Fold_Column = 0
let Tlist_WinWidth=20 "设置taglist宽度
let Tlist_Use_Right_Window=1    "在VIM窗口右侧显示taglist窗口                                                             


"""""""""""""""""""""""""Taglist Setting Ending"""""""""""""""""""





""""""""""""""""""""""""""""""
" NERDTree setting
""""""""""""""""""""""""""""""
"open a NERDTree automatically when vim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1 
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"open NERDTree automatically when vim starts up on opening a directory?  does not work by cheng
"autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

" close vim if the only window left open is a NERDTree?
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"load NERDTree when you start vim
"autocmd VimEnter * NERDTree

let g:NERDTreeWinSize=40 "set width
"let g:NERDTreeWinSize=25 "set width
let NERDTreeShowHidden=1 "show the hidden file or not

"let g:NERDTreeDirArrowExpandable = '▸'
"let g:NERDTreeDirArrowCollapsible = '▾'

let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''
let NERDTreeDirArrows = 1
"let NERDTreeDirArrows = 0
nmap <silent> <leader>tt :NERDTreeToggle<cr>
nmap <silent> <leader>e. :e %:p:h<cr>

let NERDTreeWinPos="left"
"let NERDTreeWinPos="right"
let NERDTreeShowBookmarks=1 

"set shortcut key
"map <F4> :NERDTreeMirror<CR>
"map <F4> :NERDTreeToggle<CR>

"open NERDTree with Ctrl+n
map <C-n> :NERDTreeToggle<CR>  

"----------------------------"
"--------   NERDTree Setting Ending -------"
"----------------------------"


"----------------------------"
"--------    CtrlP    -------"
"----------------------------"
"let g:ctrlp_map = ',,'
"let g:ctrlp_open_multiple_files = 'v'

"set wildignore+=*/tmp/*,*.so,*.swp,*.zip
"let g:ctrlp_custom_ignore = {
"  \ 'dir':  '\v[\/]\.(git)$',
"  \ 'file': '\v\.(log|jpg|png|jpeg)$',
"  \ }


"----------------------------"
"--------  Syntastic  -------"
"----------------------------"
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"let b:syntastic_cpp_cflags = '-std=c++11 -w'

"----------------------------"
"------ YouCompleteMe -------"
"----------------------------"
"以下为YCM设置
"let g:ycm_server_python_interpreter='/usr/local/bin/python3.8'
let g:ycm_python_binary_path = '/usr/bin/python3'

let g:ycm_global_ycm_extra_conf='~/.vim/plugged/YouCompleteMe/.ycm_extra_conf.py'
"let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'

"离开插入模式后自动关闭预览窗口    
autocmd InsertLeave * if pumvisible() == 0|pclose|endif 
"让vim补全菜单行为与一般IDE一致
set completeopt=longest,menu       
                                   
"关闭加载.ycm_extra_conf.py提示    
let g:ycm_confirm_extra_conf=0     
" 开启 YCM 基于标签引擎            
let g:ycm_collect_identifiers_from_tags_files=1
" 从第2个键入字符就开始罗列匹配项  
let g:ycm_min_num_of_chars_for_completion=2
" 禁止缓存匹配项,每次都重新生成匹配项 
let g:ycm_cache_omnifunc=0         
" 语法关键字补全                   
let g:ycm_seed_identifiers_with_syntax=1
                                   
"通过诊断功能强制重新编译     
nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>    
"回车即选中当前项
inoremap <expr> <CR>  pumvisible() ? "\<C-y>" : "\<CR>" 
"在注释输入中也能补全              
let g:ycm_complete_in_comments = 1 
"在字符串输入中也能补全            
let g:ycm_complete_in_strings = 1  
"注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 0


"----------------------------"
"--------Global Config-------"
"----------------------------"
syntax on
set nu
"set nonu # for wide split width
set scrolloff=5
set norelativenumber

"set relativenumber
"colorscheme darkblue
set mouse=a
"use mouse too change tab in vim environment
"set mouse=c

filetype on

set history=1000
set cursorline
"set cursorcolumn

set autoindent
set cindent
set smartindent

"set expandtab " space grid replace tab
set backspace=2
set tabstop=4
set shiftwidth=4
set softtabstop=4

set linebreak
set showmatch

set fileencodings=utf-8,gb2312,gbk,gb18030
set termencoding=utf-8
"set fileformats=unix
"set encoding=prc
set encoding=utf-8

set hlsearch
set incsearch

set laststatus=2
set ruler

"no \n
set nowrap


autocmd BufNewFile *.[ch],*.hpp,*.cpp,*.cc exec ":call Addreadme()"

function Addreadme()
	call setline(1, " ///")
	call append(1, " /// @file    " .expand("%:t"))
	call append(2, " /// @author  ChengWANG(cheng.wang.801@gmail.com)")
	call append(3, " /// @date    ".strftime("%Y-%m-%d %H:%M:%S"))
	call append(4, " ///")
	call append(5, " ")
	call append(6, "#include <iostream>")
	call append(7, "using namespace std;")
	"	call append(7, "using std::cout;")
	"	call append(8, "using std::endl;")
endf


"set maplearder
let  mapleader = ","
map <silent> <leader>ee :!vim ~/.vimrc<cr>

"set updatetime=5000
"set updatetime=20000
"set updatecount=200

"set noswapfile
"set noundofile
"set nobackup
"
"set swapfile
"set backup
"set undofile
"set undodir=~/.vim/undodir
"set backupdir=~/.vim/backupdir
"set directory=~/.vim/swapdir

"let $VIMTEMP = $VIMFILES.'/tmp'
"set undolevels=1000 "maximum number of changes that can be undone
"set undoreload=10000 "maximum number lines to save for undo on a buffer


set autowrite
"set ignorecase smartcase
set foldcolumn=4 "set fold zone width # for wide split width
"set foldcolumn=0 "set fold zone width # for wide split width
set foldmethod=syntax
"set foldmethod=indent
set foldlevel=1
filetype indent on
"source $VIMRUNTIME/ftplugin/man.vim
"

"source /usr/share/vim/vim74/ftplugin/man.vim

""""""""""""""""""""""""""""""
" C/C++
"""""""""""""""""""""""""""""""
"   autocmd FileType c,cpp,xml  map <buffer> <leader><space> :make<cr>
"autocmd FileType c,cpp  setl foldmethod=syntax | setl fen

" map to <Leader>ff in C++ code
"  let g:clang_format#detect_style_file = 1
"  autocmd FileType c,cpp nnoremap <buffer><Leader>ff :<C-u>ClangFormat<CR>
"  autocmd FileType c,cpp vnoremap <buffer><Leader>ff :ClangFormat<CR>
" if you install vim-operator-user
"  autocmd FileType c,cpp map <buffer><Leader>x <Plug>(operator-clang-format)
" Toggle auto formatting:
"nmap <Leader>C :ClangFormatAutoToggle<CR>

"set showcmd

"set clipboard+=unnamed "共享剪贴板

