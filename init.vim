lua require('init')

call plug#begin()
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'

" Make sure you use single quotes

Plug 'justinmk/vim-sneak'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'junegunn/seoul256.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'azabiong/vim-highlighter'
Plug 'dominikduda/vim_current_word'
Plug 'preservim/tagbar'

" Initialize plugin system
call plug#end()

" sneak
let g:sneak#label = 1
let g:sneak#use_ic_scs = 1

" seoul256
let g:seoul256_background=233
colo seoul256

" vim highlight
let HiSet   = 'f<CR>'
let HiErase = 'f<BS>'
let HiClear = 'f<C-L>'
let HiFind  = 'f<Tab>'
nnoremap - :Hi><CR>
nnoremap _ :Hi<<CR>

" vim-bookmarks
" highlight BookmarkLine guifg=160 guibg=21
highlight BookmarkLine guifg=white guibg=darkcyan
let g:bookmark_save_per_working_dir = 1
let g:bookmark_auto_save = 1
let g:bookmark_highlight_lines = 1

" vim-current-word
hi CurrentWordTwins guifg=#000000 guibg=#afff00 ctermfg=0 ctermbg=154

command! -bang -nargs=* BLines 
  \ call fzf#vim#grep(
  \   'rg --with-filename --column --line-number --no-heading --color=always --smart-case . '.fnameescape(expand('%:p')), 1,
  \   fzf#vim#with_preview(), <bang>0)
