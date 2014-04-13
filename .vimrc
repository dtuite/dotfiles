" Vim Settings
" Author David Tuite
" 
" Resources
"  - Many of the cool parts of this document come from Gary Bernhardt's .vimrc
"    which can be found on Github: 
"    https://github.com/garybernhardt/dotfiles/blob/master/.vimrc

set nocompatible
filetyp off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Plugin 'gmarik/vundle'
Plugin 'kchmck/vim-coffee-script'
Plugin 'fsouza/go.vim'
Plugin 'othree/html5.vim'
Plugin 'briancollins/vim-jst'
Plugin 'groenewege/vim-less'
Plugin 'jinfield/vim-nginx'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tpope/vim-surround'
Plugin 'kien/ctrlp.vim'
Plugin 'mattn/emmet-vim'
Plugin 'AndrewRadev/vim-eco'
Plugin 'mustache/vim-mustache-handlebars'
Bundle 'SirVer/ultisnips'
Bundle 'honza/vim-snippets'

filetype plugin indent on


" """""
" Rules
" """""

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

" Locate the .netrwhist file in the home directory, not under .vim.
" INFO: http://goo.gl/GhFU8H
let g:netrw_home=$HOME

" This guifont setting only makes a difference in MacVim or
" similar. In terminal VIM, the terminal's setting will
" be used. For example, change the font in iTerm2's preferences
" pane and the font in VIM will change too.
set guifont=SourceCodePro-Regular:h12 " set the default font

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
" Make tab completion and the CtrlP plugin ignore these dirs.
set wildignore+=*/tmp/*,*.so,*.swp,*.zip

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

" Always show tab bar
set showtabline=2

" List of directories to ignore when searching with the CtrlP plugin.
" Main aim with this was to ignore the vendor/bundle in Rails apps because
" it gets filled full of gem code when you use RBenv and slows down
" CtrlP a lot.
let g:ctrlp_custom_ignore = '\v([\/]\.(git|hg|svn|bundle|sass-cache)|vendor/bundle)$'
" Not entierly sure what this does. Got it from here: http://goo.gl/KbxtXo
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
let g:ctrlp_use_caching = 0

" Ultisnips configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

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
set background=dark
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

" TODO: DOesn't seem to be working
" Jump to last cursor position unless it's in an event handler
autocmd BufReadPost * 
  \ if line("'\"") > 1 && line("'\"") <= line("$") | 
  \ exe "normal! g`\"" | 
  \ endif

" File Type Recognition
" ---------------------

" Recognise eruby files as html files
" NOTE: The period separates multiple filetypes.
autocmd BufRead,BufNewFile *.erb set filetype=eruby.html

" NOTE: This line must come after the previous one since it's matcher is
" more specific. The one above will clobber it if it comes second.
autocmd BufRead,BufNewFile *.html.erb set filetype=eruby-rails.eruby.html

" Recognise all Ruby files ending in _spec.rb as RSpec files
autocmd BufRead,BufNewFile *_spec.rb set filetype=ruby-rspec.ruby

" Highlight various files as Ruby
au BufRead,BufNewFile *.rabl,Gemfile,Guardfile set filetype=ruby

" Highlight JSON files list JavaScript
autocmd BufNewFile,BufRead *.json set ft=javascript


" Speed up loading of Ruby and ERuby files.
" INFO: http://stackoverflow.com/a/13261715/574190 

if !empty($MY_RUBY_HOME)
 let g:ruby_path = join(split(glob($MY_RUBY_HOME.'/lib/ruby/*.*')."\n".glob($MY_RUBY_HOME.'/lib/rubysite_ruby/*'),"\n"),',')
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CUSTOM KEYMAPS AND VARIABLES
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Change the keymap for the CtrlP plugin
" INFO: https://github.com/kien/ctrlp.vim
let g:ctrlp_map = '<c-t>'

" Change the default mapleader key.
let mapleader = ","

"change expander shortcut for Emmet plugin.
let g:user_emmet_expandabbr_key = '<C-e>'

" Create Blank Newlines and stay in Normal mode
nnoremap <silent> zj o<Esc>
nnoremap <silent> zk O<Esc>

" Easily edit and source the vimrc
nnoremap <leader>ev :vsp $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
noremap N Nzz
noremap n nzz

" Swap ; and :  Convenient.
nnoremap ; :
nnoremap : ;

" Map jj to exit insert mode
inoremap jj <Esc>

" Use Ctrl-u to change the word you're in the middle of typing to uppercase
inoremap <c-u> <esc>viwUea

" Copy current file name to clipboard
nnoremap <leader>f :let @+=expand('%')<cr>

" Access common rails files.
nnoremap <leader>ro :e config/routes.rb<cr>
nnoremap <leader>ac :e config/app_config.yml<cr>
nnoremap <leader>sc :e db/schema.rb<cr>

map Y y$

" Remove all erb tags in the visual selection.
" Stands for <leader> remove erb
" nnoremap <leader>re :'<,'>s/<%=\s//g | '<,'>s/\s-%>//g | '<,'>s/<%\s//g | '<,'>s/\s%>//g

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MACROS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Instructions on using spcial chars such as <Esc> or backspace in Vimrc
" stored macros: http://stackoverflow.com/q/2943555/574190

"  == the Escape key. Gotten by pressing <Ctrl-v>{Esc> while in insert mode.
let @s = 'El3xi:bhx'

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

" NOTE: This won't work when using 'nmap' or 'map' (haven't tried others).
" Only way I've found a way to make it work is if defined with a non-recursive
" map. What they all mean: http://stackoverflow.com/a/3776182/574190
nnoremap <leader>n :call RenameFile()<cr>

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
nnoremap <leader>p :PromoteToLet<cr>

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
  let in_app = match(current_file, '\<controllers\>') != -1 || match(current_file, '\<models\>') != -1 || match(current_file, '\<views\>') != -1 || match(current_file, '\<mailers\>') != -1
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

nnoremap <leader>t :call RunTestFile()<cr>
nnoremap <leader>T :call RunNearestTest()<cr>
nnoremap <leader>a :call RunTests('')<cr>
nnoremap <leader>c :w\|:!script/features<cr>
nnoremap <leader>w :w\|:!script/features --profile wip<cr>

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
