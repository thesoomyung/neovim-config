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

Plug 'easymotion/vim-easymotion'
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-easymotion.vim'
Plug 'haya14busa/incsearch-fuzzy.vim'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'junegunn/seoul256.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'azabiong/vim-highlighter'
Plug 'dominikduda/vim_current_word'
Plug 'preservim/tagbar'
Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins' }

" Initialize plugin system
call plug#end()

" easy-motion
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-overwin-f2)

" Turn on case-insensitive feature
let g:EasyMotion_smartcase = 1

" incsearch-fuzzy
map z/ <Plug>(incsearch-fuzzy-/)
map z? <Plug>(incsearch-fuzzy-?)
map zg/ <Plug>(incsearch-fuzzy-stay)


" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)



" seoul256
let g:seoul256_background=234
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

" fzf
command! -bang -nargs=* BLines 
  \ call fzf#vim#grep(
  \   'rg --with-filename --column --line-number --no-heading --color=always --smart-case . '.fnameescape(expand('%:p')), 1,
  \   fzf#vim#with_preview(), <bang>0)

function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction
command! -nargs=* -bang RG call RipgrepFzf(expand('<cword>'), <bang>0)

" cursorline
set cursorline
hi cursorline guibg=#000000 ctermbg=0
autocmd InsertEnter * hi cursorline cterm=underline
autocmd InsertLeave * hi cursorline guibg=#000000 ctermbg=0 cterm=NONE

set foldmethod=indent
set foldlevel=99
