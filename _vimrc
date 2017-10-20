:set background=dark
:set laststatus=2
:set ruler
:set showmode
:set autoindent
:set shiftwidth=4
:set expandtab
:set shiftround
:set hlsearch
:syntax on
:set noic

:abbr #i #include
:abbr #d #define
:abbr ## #----------------------------------------
:abbr 2# ##
:abbr 3# ###
:abbr 4# ####
:abbr 5# #####
:abbr 6# ###### 

:set pastetoggle=<F12>
:let loaded_matchparen = 1
:set completeopt=preview
:nmap <silent> <F2> :silent noh<CR>

:nmap <F5> :!mydef_run %<CR>
