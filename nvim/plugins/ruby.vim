Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
Plug 'tpope/vim-rails', { 'for': 'ruby' }
Plug 'tpope/vim-haml', { 'for': 'ruby' }
Plug 'slim-template/vim-slim', { 'for': 'ruby' }

let ruby_fold = 1
let g:ruby_path = system('which ruby')
let g:ruby_indent_assignment_style = 'variable'

au BufEnter *.rb syn match error contained "\<binding.pry\>"
