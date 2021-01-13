Plug 'tmhedberg/SimpylFold', { 'for': 'python' }
Plug 'davidhalter/jedi-vim', { 'for': 'python' }

let g:jedi#rename_command = ""
let g:jedi#goto_assignments_command = ""
let g:jedi#goto_stubs_command = ""

let g:neomake_python_enabled_makers = ['pep8', 'flake8', 'pylint', 'python', 'vulture', 'mypy']
