let g:fzf_command_prefix = 'Fzf'

nnoremap \ :FzfRg<CR>
nnoremap <Leader>, :call FzfOmniFiles()<CR>
" nnoremap <Leader>t :Files<cr>
nnoremap <Leader>; :FzfBuffers<cr>
nnoremap <Leader>l :FzfBLines<cr>

fun! FzfOmniFiles()
  let is_git = system('git status')
  if v:shell_error
    :FzfFiles
  else
    :FzfGitFiles
  endif
endfun
