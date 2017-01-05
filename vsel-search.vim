" Search for selected text.
"
" http://vim.wikia.com/wiki/Search_for_visually_selected_text#Advanced
" 
" Features:
"
" - Press * to search forwards for selected text, or # to search backwards.
" - As normal, press n for next search, or N for previous.
" - Handles multiline selection and search.
" - Whitespace in the selection matches any whitespace when searching (searching
"   for "hello world" will also find "hello" at the end of a line, with "world"
"   at the start of the next line).
" - Each search is placed in the search history allowing you to easily repeat
"   previous searches.
" - No registers are changed.
"
" Extra:
"
" - A global variable (g:VeryLiteral) controls whether selected whitespace
"   matches any whitespace (by default, VeryLiteral is off, so any whitespace
"   is found).
" - Type \vl to toggle VeryLiteral to turn whitespace matching off/on
"   (assuming the default backslash leader key).
" - When VeryLiteral is off, any selected leading or trailing whitespace will
"   not match newlines, which is more convenient, and avoids false search
"   hits.

let s:save_cpo = &cpo | set cpo&vim
if !exists('g:VeryLiteral')
  let g:VeryLiteral = 0
endif
function! s:VSetSearch(cmd)
  let old_reg = getreg('"')
  let old_regtype = getregtype('"')
  normal! gvy
  if @@ =~? '^[0-9a-z,_]*$' || @@ =~? '^[0-9a-z ,_]*$' && g:VeryLiteral
    let @/ = @@
  else
    let pat = escape(@@, a:cmd.'\')
    if g:VeryLiteral
      let pat = substitute(pat, '\n', '\\n', 'g')
    else
      let pat = substitute(pat, '^\_s\+', '\\s\\+', '')
      let pat = substitute(pat, '\_s\+$', '\\s\\*', '')
      let pat = substitute(pat, '\_s\+', '\\_s\\+', 'g')
    endif
    let @/ = '\V'.pat
  endif
  normal! gV
  call setreg('"', old_reg, old_regtype)
endfunction
vnoremap <silent> * :<C-U>call <SID>VSetSearch('/')<CR>/<C-R>/<CR>
vnoremap <silent> # :<C-U>call <SID>VSetSearch('?')<CR>?<C-R>/<CR>
vmap <kMultiply> *
nmap <silent> <Plug>VLToggle :let g:VeryLiteral = !g:VeryLiteral
  \\| echo "VeryLiteral " . (g:VeryLiteral ? "On" : "Off")<CR>
if !hasmapto("<Plug>VLToggle")
  nmap <unique> <Leader>vl <Plug>VLToggle
endif
let &cpo = s:save_cpo | unlet s:save_cpo

