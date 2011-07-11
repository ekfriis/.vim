function! Dollar(inner)
  call search('\$', 'bW')
  if a:inner
    " The following is simply my emulation of execute "normal \<Space>"
    " which does not exist and for which I haven't found an alternative.
    let tmp_pos = getpos('.')
    normal! l
    if getpos('.') == tmp_pos
      normal! j0
    endif
  endif
  normal! v
  call search('\$', 'W')
  if a:inner
    execute "normal! \<BS>"
  endif
endfunction
onoremap <silent>i$ :<C-u>call Dollar(1)<CR>
onoremap <silent>a$ :<C-u>call Dollar(0)<CR>
vnoremap <silent>i$ <Esc>:call Dollar(1)<CR><Esc>gv
vnoremap <silent>a$ <Esc>:call Dollar(0)<CR><Esc>gv
