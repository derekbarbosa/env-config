syntax on
set nonumber
set backspace=indent,eol,start
set nocompatible              " be iMproved, required
set pastetoggle=<F2>          "PASTE TOGGLE
set showcmd
set shiftwidth=2
set autoindent
set smartindent
set textwidth=80
filetype plugin indent on    " required

" syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" syntatic settings
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"toggle syntastic mode to passive (get rid of annoying popup
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }

"ctrl+w E to check a buffer with syntastic
nnoremap <C-w>E :SyntasticCheck<CR>

"vim-cpp-settings
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_posix_standard = 1
let g:cpp_experimental_simple_template_highlight = 1
let g:cpp_experimental_template_highlight = 1
let g:cpp_concepts_highlight = 1


" Set internal encoding of vim, not needed on neovim, since coc.nvim using some
" unicode characters in the file autoload/float.vim
set encoding=utf-8

" TextEdit might fail if hidden is not set.
set hidden

" Adding FZF Support
nmap <C-F> :FZF<CR>

" NERDTree Settings
nnoremap <C-t> :NERDTreeToggle<CR>

" NERDCommenter Settings Create default mappings
let g:NERDCreateDefaultMappings = 1

" Changing system clipboard value
let clipboard = "unnamedplus"

" Mapping Highlight Toggle on Insert Mode
nnoremap i :noh<cr>i

" Statusline map for vim fugitive
set statusline+=%{FugitiveStatusline()}

" Mapping leader+b to open buffer list and search
:nnoremap <Leader>b :buffers<CR>:buffer<Space>

" Tab configs to make my life easier
nmap <leader>tn :tabnew<cr>
nmap <leader>tb :tabprevious<cr>
nmap <leader>t  :tabnext<cr>
nmap <leader>tm :tabmove<cr>
nmap <leader>tc :tabclose<cr>
nmap <leader>to :tabonly<cr>

" Force saving files that require root permission
cnoremap w!! w !sudo tee > /dev/null %
