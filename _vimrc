set nocp
syntax enable
" filetype plugin on
set nocp ts=3 sw=3 incsearch hlsearch listchars=tab:>-,eol:$,precedes:> scrolloff=2 ic encoding=utf8 visualbell ai nowrap
set cm=blowfish
set wildmenu wildmode=list:longest,full
map <F12> :NERDTree<CR>

if exists('$TMUX')
  function! TmuxOrSplitSwitch(wincmd, tmuxdir)
    let previous_winnr = winnr()
    silent! execute "wincmd " . a:wincmd
    if previous_winnr == winnr()
      call system("tmux select-pane -" . a:tmuxdir)
      redraw!
    endif
  endfunction

  let previous_title = substitute(system("tmux display-message -p '#{pane_title}'"), '\n', '', '')
  let &t_ti = "\<Esc>]2;vim\<Esc>\\" . &t_ti
  let &t_te = "\<Esc>]2;". previous_title . "\<Esc>\\" . &t_te

  nnoremap <silent> <C-h> :call TmuxOrSplitSwitch('h', 'L')<cr>
  nnoremap <silent> <C-j> :call TmuxOrSplitSwitch('j', 'D')<cr>
  nnoremap <silent> <C-k> :call TmuxOrSplitSwitch('k', 'U')<cr>
  nnoremap <silent> <C-l> :call TmuxOrSplitSwitch('l', 'R')<cr>
else
  map <C-h> <C-w>h
  map <C-j> <C-w>j
  map <C-k> <C-w>k
  map <C-l> <C-w>l
endif

"
" Pathogen
" curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
execute pathogen#infect()
execute pathogen#helptags()

" Checkout following to ~/.vim/bundle
"
" For Tree browsing support
" git clone https://github.com/scrooloose/nerdtree.git
"
" For GIT support
" git clone https://github.com/tpope/vim-fugitive
