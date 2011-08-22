" get pathogen working
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

set nocompatible

set ruler " line numbers
set hidden

" settings needed for solarized colorscheme
syntax enable
set background=dark
colorscheme solarized
" / solarized settings

set guifont=Monaco:h13
"tab = 3 spaces
set tabstop=2
set expandtab
"tab key style paragraph indent
set shiftwidth=2
"line numbers
set number
"smart indenting
set smartindent
set autoindent
"Allows autocomplete in file names
set wildmode=list:longest
set laststatus=2
"higher linespacing than default
set linespace=3
"move new split pane to bottom
set splitbelow
"split pane to RHS
set splitright
"highlight mstching search 
set hlsearch
"allow code folding. shortcuts: zc zo
set foldenable
"needed so NERDcommenter knows what file it's dealing with
filetype plugin on
"not sure
filetype indent on
"map :NERDTreeToggle to Ctrl-D
nmap <silent> <C-D> :NERDTreeToggle<CR>
"change zen coding expander shortcut
let g:user_zen_expandabbr_key = '<C-e>'

" Instruction for how to turn on indent guides
" Press leader key (\ by default) then type 'ig'

"source the .vimrc automatically after saving it
if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
endif

" Code to make peepopen launch on new Tab
" Doesn't seem to work though??
" if has("gui_macvim")
"   macmenu &File.New\ Tab key=<nop>
"   map <D-t> <Plug>PeepOpen
" end

if has("autocmd")
  " Highlight TODO, FIXME, NOTE, etc.
  if v:version > 701
    autocmd Syntax * call matchadd('Todo',  '\W\zs\(TODO\|FIXME\|CHANGED\|XXX\|BUG\|HACK\)')
    autocmd Syntax * call matchadd('Debug', '\W\zs\(NOTE\|INFO\|IDEA\)')
  endif
endif

"create an abbreviation for insert mode
"iabbrev abbreviation expansion
"create an abbreviation for normal mode
"abbrev abbreviation expansion
"nmap -> normal mode keymap
"imap -> insert mode keymap
