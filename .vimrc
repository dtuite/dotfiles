set nocompatible

call pathogen#infect()
call pathogen#helptags()

set ruler " show the cursor position all the time

" reduce the timeout length to speed up the 'O' command.
" See :help esckeys for more information
set timeoutlen=100

" Allow backgrounding buffers without writing them, 
" and remember marks/undo for backgrounded buffers
set hidden

set clipboard=unnamed

" Remember more commands and search history
set history=1000

set number "line numbers
" relative line numbers rather than absolute
" set relativenumber

" Added this bacause I was having problems getting
" backspace to work properly in terminal vim
set backspace=2 " make backspace work like most other apps

" COLOR DEFINITION SECTION
" autocmd ColorScheme * highlight <ColorName> ctermbg=<TerminalBackgroundColour> guibg=<GuiBackgroundColour> ctermfg=<TerminalFontColor> guifg=<GuiFontColour>
" Solarized color palate: https://github.com/altercation/solarized/blob/master/vim-colors-solarized/colors/solarized.vim

" cterm colours must be from predeterminged list. See :help cterm-colors for
" more info.
" Gui colours may be any HEX colour

" Define autocmd for some highlighting *before* the colorscheme is loaded
" if !exists("autocmd_colorscheme_loaded")
"   let autocmd_colorscheme_loaded = 1
"   autocmd ColorScheme * highlight GoodNews     ctermbg=brblack guibg=#002b37 ctermfg=DarkGreen     guifg=#12C934
"   autocmd ColorScheme * highlight WarningPurp  ctermbg=brblack guibg=#002b37 ctermfg=DarkRed     guifg=#B543B3
"   autocmd ColorScheme * highlight TodoRed      ctermbg=brblack guibg=#002b37 ctermfg=DarkMagenta     guifg=#E01B1B
"   autocmd ColorScheme * highlight TodoOrange   ctermbg=brblack guibg=#002b37 ctermfg=LightRed     guifg=#E0841B
"   autocmd ColorScheme * highlight TodoYellow   ctermbg=brblack guibg=#002b37 ctermfg=DarkYellow     guifg=#E0D91B
" endif

" settings needed for solarized colorscheme
syntax enable
set background=dark
" Use the degraded 256 color scheme in terminal vim
" INFO: http://ethanschoonover.com/solarized/vim-colors-solarized#important-note-for-terminal-users
" let g:solarized_termcolors=256
colorscheme solarized

" Highlight labels. NOTE: This has to come after we set our colorscheme
" if has("autocmd")
"   " Highlight TODO, FIXME, XXX, NOTE, INFO, IDEA, TODO1, TODO2, .
"   if v:version > 701
"     " Build-in colours: Todo, Debug (not-comprehensive!)
"     autocmd Syntax * call matchadd('WarningPurp',  '\W\zs\(???\|NOTE\|TODO\|FIXME\|XXX\)')
"     autocmd Syntax * call matchadd('GoodNews', '\W\zs\(INFO\|IDEA\)')
"     autocmd Syntax * call matchadd('TodoRed', '\W\zs\(TODO1\)')
"     autocmd Syntax * call matchadd('TodoOrange', '\W\zs\(TODO2\)')
"     autocmd Syntax * call matchadd('TodoYellow', '\W\zs\(TODO3\)')
"   endif
" endif

if version >= 700
   set spl=en spell " use english dictionary for spellchecking
   set nospell " but turn it off by default
endif

" Recognise eruby files as html files
autocmd BufRead,BufNewFile *.erb set filetype=eruby.html

" Only load the closetag plugin for HTML and XML files
" NOTE: Commented out since I uninstalled the closetag plugin
" autocmd FileType html,htmldjango,jinjahtml,eruby,mako let b:closetag_html_style=1
" autocmd FileType html,xhtml,xml,htmldjango,jinjahtml,eruby,mako source ~/.vim/bundle/closetag/plugin/closetag.vim

" Highlight Rabl files as Ruby
au BufRead,BufNewFile *.rabl setf ruby

" Highlight JSON files list JavaScript
autocmd BufNewFile,BufRead *.json set ft=javascript

set guifont=Monaco:h13 " set the default font

set tabstop=2 "one tab = 2 spaces
set expandtab "when I tab, really do spaces
set shiftwidth=2
set softtabstop=2

" enable mouse support in console
set mouse=a

" location of ctags files
let Tlist_Ctags_Cmd='/usr/local/bin/ctags' 
" omnicompletion
set ofu=syntaxcomplete#Complete

" Make searches case-sensitive only if they contain upper-case characters
set ignorecase
set smartcase

" hide the toolbar in GUI mode
if has("gui_running")
    set go-=T
end

"smart indenting
set smartindent
set autoindent

" Make tab completion for files/buffers act like bash
set wildmenu
set wildmode=list:longest,full

" don't scan included files when autocompleting
" It takes too long
set complete-=i

" remove the buffer when I close a tab
set nohidden

" map jj to esc in insert mode
inoremap jj <Esc>

set laststatus=2

"higher linespacing than default
set linespace=3

"move new split pane to bottom
set splitbelow
"split pane to RHS
set splitright

" highlight mstching search 
" set hlsearch

"allow code folding. shortcuts: zc zo
set foldenable

"needed so NERDcommenter knows what file it's dealing with
filetype plugin on
"not sure
filetype indent on

"change zen coding expander shortcut
let g:user_zen_expandabbr_key = '<C-e>'

" set <leader> = ','
" let mapleader=","

" Instruction for how to turn on indent guides
" Press leader key (\ by default) then type 'ig'

"source the .vimrc automatically after saving it
if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
endif

" highlight current line
set cursorline

" Create Blank Newlines and stay in Normal mode
nnoremap <silent> zj o<Esc>
nnoremap <silent> zk O<Esc>

" Space will toggle folds!
nnoremap <space> za

"map :NERDTreeToggle to Ctrl-D
noremap <silent> <C-D> :NERDTreeToggle<CR>

noremap <C-T> :CommandT<CR>

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
map N Nzz
map n nzz

" Swap ; and :  Convenient.
nnoremap ; :
nnoremap : ;

" Always show tab bar
set showtabline=2

" Disable arrow keys
"noremap  <Up> ""
"noremap! <Up> <Esc>
"noremap  <Down> ""
"noremap! <Down> <Esc>
"noremap  <Left> ""
"noremap! <Left> <Esc>
"noremap  <Right> ""
"noremap! <Right> <Esc>

"create an abbreviation for insert mode
"iabbrev abbreviation expansion
"create an abbreviation for normal mode
"abbrev abbreviation expansion
"nmap -> normal mode keymap
"imap -> insert mode keymap

" Turn 'post = Facto..' into 'let(:post){ Facto...'
" Taken from Gary Bernhart's .vimrc
" https://github.com/garybernhardt/dotfiles/blob/master/.vimrc
" NOTE: Doesn't work
function! PromoteToLet()
  :normal! dd
  " :exec '?^\s*it\>'
  :normal! P
  :.s/\(\w\+\) = \(.*\)$/let(:\1) { \2 }/
  :normal ==
  " :normal! <<
  " :normal! ilet(:
  " :normal! f 2cl) {
  " :normal! A }
endfunction
:command! PromoteToLet :call PromoteToLet()
" :map <leader>p :PromoteToLet<cr>
