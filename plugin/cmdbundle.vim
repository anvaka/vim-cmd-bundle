if exists('g:loaded_cmdbundle')
  finish
endif

let s:save_cpo = &cpo
set cpo&vim

function! cmdbundle#load()

endfunction

let &cpo = s:save_cpo
unlet s:save_cpo

let g:loaded_cmdbundle = 1
