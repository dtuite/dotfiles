set nocompatible

call pathogen#infect()
call pathogen#helptags()

set ruler " show the cursor position all the time

" reduce the timeout length to speed up the 'O' command.
" See :help esckeys for more information
set timeoutlen=500

" Allow backgrounding buffers without writing them, 
" and remember marks/undo for backgrounded buffers
set hidden

" highlight current line
set cursorline

" Fold based on rules in syntax files
set foldmethod=manual

set clipboard=unnamed

" Remember more commands and search history
set history=1000

set number "line numbers
" relative line numbers rather than absolute
" set relativenumber

" Added this bacause I was having problems getting
" backspace to work properly in terminal vim
set backspace=2 " make backspace work like most other apps

if version >= 700
   set spl=en spell " use english dictionary for spellchecking
   set nospell " but turn it off by default
endif

" This guifont setting only makes a difference in MacVim or
" similar. In terminal VIM, the terminal's setting will
" be used. For example, change the font in iTerm2's preferences
" pane and the font in VIM will change too.
set guifont=SourceCodePro-Regular:h13 " set the default font

set tabstop=2 "one tab = 2 spaces
set expandtab "when I tab, really do spaces
set shiftwidth=2
set softtabstop=2

" enable mouse support in console
set mouse=a

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

" Always show tab bar
set showtabline=2

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" AUTOCOMMANDS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" COLOR DEFINITION SECTION
" autocmd ColorScheme * highlight <ColorName> ctermbg=<TerminalBackgroundColour> guibg=<GuiBackgroundColour> ctermfg=<TerminalFontColor> guifg=<GuiFontColour>
" Solarized color palate: https://github.com/altercation/solarized/blob/master/vim-colors-solarized/colors/solarized.vim

" cterm colours must be from predeterminged list. See :help cterm-colors for more info.
" Gui colours may be any HEX colour

" Define autocmd for some highlighting *before* the colorscheme is loaded
" if !exists("autocmd_colorscheme_loaded")
"   let autocmd_colorscheme_loaded = 1
"   autocmd ColorScheme * highlight GoodNews     ctermbg=black guibg=#002b37 ctermfg=Green     guifg=#12C934
"   autocmd ColorScheme * highlight WarningPurp  ctermbg=black guibg=#002b37 ctermfg=DarkRed     guifg=#B543B3
"   autocmd ColorScheme * highlight TodoOrange   ctermbg=black guibg=#002b37 ctermfg=Red     guifg=#E0841B
" endif

" settings needed for solarized colorscheme
syntax enable
set background=light
" Use the degraded 256 color scheme in terminal vim
" INFO: http://ethanschoonover.com/solarized/vim-colors-solarized#important-note-for-terminal-users
" let g:solarized_termcolors=256
colorscheme solarized

" Highlight labels. NOTE: This has to come after we set our colorscheme
" if has("autocmd")
"   " Highlight TODO, FIXME, XXX, NOTE, INFO, IDEA, TODO1, TODO2, .
"   if v:version > 701
"     " Build-in colours: Todo, Debug (not-comprehensive!)
"     autocmd Syntax * call matchadd('TodoOrange',  '\W\zs\(???\|TODO\|FIXME\|XXX\)')
"     autocmd Syntax * call matchadd('GoodNews', '\W\zs\(INFO\|IDEA\|NOTE\)')
"     " autocmd Syntax * call matchadd('TodoRed', '\W\zs\(TODO1\)')
"     " autocmd Syntax * call matchadd('TodoOrange', '\W\zs\(NOTE\)')
"     " autocmd Syntax * call matchadd('TodoYellow', '\W\zs\(TODO3\)')
"   endif
" endif

" Jump to last cursor position unless it's in an event handler
autocmd BufReadPost * 
  \ if line("'\"") > 1 && line("'\"") <= line("$") | 
  \ exe "normal! g`\"" | 
  \ endif

" Recognise eruby files as html files
" autocmd BufRead,BufNewFile *.erb set filetype=eruby.html

" Only load the closetag plugin for HTML and XML files
" NOTE: Commented out since I uninstalled the closetag plugin
" autocmd FileType html,htmldjango,jinjahtml,eruby,mako let b:closetag_html_style=1
" autocmd FileType html,xhtml,xml,htmldjango,jinjahtml,eruby,mako source ~/.vim/bundle/closetag/plugin/closetag.vim

" Highlight Rabl files as Ruby
" au BufRead,BufNewFile *.rabl,Gemfile,Guardfile set filetype=ruby

" Highlight JSON files list JavaScript
autocmd BufNewFile,BufRead *.json set ft=javascript

"source the .vimrc automatically after saving it
if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CUSTOM KEYMAPS AND VARIABLES
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Change the keymap for the CtrlP plugin
" INFO: https://github.com/kien/ctrlp.vim
let g:ctrlp_map = '<c-t>'

let mapleader = ","

" Switch splits withiyt the 'w'
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
nnoremap <c-h> <c-w>h

"change zen coding expander shortcut
let g:user_zen_expandabbr_key = '<C-e>'

" Create Blank Newlines and stay in Normal mode
nnoremap <silent> zj o<Esc>
nnoremap <silent> zk O<Esc>

" Space will toggle folds!
nnoremap <space> za

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
map N Nzz
map n nzz

" map jj to esc in insert mode
inoremap jj <Esc>

" Swap ; and :  Convenient.
nnoremap ; :
nnoremap : ;

"create an abbreviation for insert mode
"iabbrev abbreviation expansion
"create an abbreviation for normal mode
"abbrev abbreviation expansion
"nmap -> normal mode keymap
"imap -> insert mode keymap

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RENAME CURRENT FILE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction
map <leader>n :call RenameFile()<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PROMOTE VARIABLE TO RSPEC LET
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn 'post = Facto..' into 'let(:post){ Facto...'
" Taken from Gary Bernhart's .vimrc
" https://github.com/garybernhardt/dotfiles/blob/master/.vimrc
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
nmap <leader>p :PromoteToLet<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SWITCH BETWEEN TEST AND PRODUCTION CODE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! OpenTestAlternate()
  let new_file = AlternateForCurrentFile()
  exec ':e ' . new_file
endfunction
function! AlternateForCurrentFile()
  let current_file = expand("%")
  let new_file = current_file
  let in_spec = match(current_file, '^spec/') != -1
  let going_to_spec = !in_spec
  let in_app = match(current_file, '\<controllers\>') != -1 || match(current_file, '\<models\>') != -1 || match(current_file, '\<views\>') != -1
  if going_to_spec
    if in_app
      let new_file = substitute(new_file, '^app/', '', '')
    end
    let new_file = substitute(new_file, '\.rb$', '_spec.rb', '')
    let new_file = 'spec/' . new_file
  else
    let new_file = substitute(new_file, '_spec\.rb$', '.rb', '')
    let new_file = substitute(new_file, '^spec/', '', '')
    if in_app
      let new_file = 'app/' . new_file
    end
  endif
  return new_file
endfunction
nnoremap <leader>. :call OpenTestAlternate()<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RUNNING TESTS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>t :call RunTestFile()<cr>
map <leader>T :call RunNearestTest()<cr>
map <leader>a :call RunTests('')<cr>
map <leader>c :w\|:!script/features<cr>
map <leader>w :w\|:!script/features --profile wip<cr>

function! RunTestFile(...)
    if a:0
        let command_suffix = a:1
    else
        let command_suffix = ""
    endif

    " Run the tests for the previously-marked file.
    let in_test_file = match(expand("%"), '\(.feature\|_spec.rb\)$') != -1
    if in_test_file
        call SetTestFile()
    elseif !exists("t:grb_test_file")
        return
    end
    call RunTests(t:grb_test_file . command_suffix)
endfunction

function! RunNearestTest()
    let spec_line_number = line('.')
    call RunTestFile(":" . spec_line_number . " -b")
endfunction

function! SetTestFile()
    " Set the spec file that tests will be run for.
    let t:grb_test_file=@%
endfunction

function! RunTests(filename)
    " Write the file and run tests for the given filename
    :w
    :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
    :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
    :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
    :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
    :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
    :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
    if match(a:filename, '\.feature$') != -1
        exec ":!script/features " . a:filename
    else
        if filereadable("script/test")
            exec ":!script/test " . a:filename
        elseif filereadable("Gemfile")
            exec ":!bundle exec rspec --color " . a:filename
        else
            exec ":!rspec --color " . a:filename
        end
    end
endfunction
