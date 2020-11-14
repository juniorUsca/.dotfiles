let g:ale_fix_on_save = 1
let g:ale_linters = {
	\ 'c': ['clang'],
	\ 'javascript': ['eslint'],
	\ 'python': ['pylint', 'flake8'],
	\ 'typescript': ['prettier'],
	\ 'ruby': ['rubocop'],
	\ 'vue': ['eslint', 'stylelint', 'vls'],
	\ 'vuejs': ['eslint', 'stylelint', 'vls'],
	\ }
let g:ale_fixers = {
	\ 'c': ['clang-format'],
	\ 'javascript': ['prettier', 'eslint'],
	\ 'python': ['black'],
	\ 'typescript': ['prettier', 'eslint', 'tslint'],
	\ 'ruby': ['rubocop'],
	\ 'vue': ['prettier'],
	\ 'vuejs': ['prettier'],
	\ }



" https://github.com/dense-analysis/ale/issues/1810
let g:ale_set_loclist=0
let g:ale_set_quickfix=0

function! OpenALEResults()
  let l:bfnum = bufnr('')
  let l:items = ale#engine#GetLoclist(l:bfnum)
  call filter(l:items, '!(has_key(v:val, "bufnr") && v:val["bufnr"] == -1)')
  call setqflist([], 'r', {'items': l:items, 'title': 'ALE results'})
  botright cwindow
endfunction"

function! RunALELint()
  if empty(ale#engine#GetLoclist(bufnr('')))
    let b:ale_enabled = 1
    augroup ALEProgress
      autocmd!
      autocmd User ALELintPost call OpenALEResults() | au! ALEProgress
    augroup end
    call ale#Queue(0, 'lint_file')
  else
    call OpenALEResults()
  endif
endfunction

nnoremap <leader>erw :call OpenALEResults()<CR>
