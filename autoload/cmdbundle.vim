if exists('g:loaded_cmdbundle')
  finish
endif

let s:save_cpo = &cpo
set cpo&vim

function! cmdbundle#load()
  " TODO: let filter what is allowed and what is not
  if s:enabled('fugitive')
    call cmd#define('Git: Status', ":Gstatus<CR>")
    call cmd#define('Git: Diff', ":Gdiff<CR>")

    let uniteSources = unite#get_all_sources()
    let suffix = ''
    if has_key(uniteSources, 'quickfix')
      let suffix = ' | Unite quickfix'
    endif
    call cmd#define('Git: Log', ':exe "silent Glog' . suffix . '"<CR>')
    call cmd#define('Git: Blame', ":Gblame<CR>")
  endif
endfunction

function! s:enabled(name)
  return 1
endfunction


let &cpo = s:save_cpo
unlet s:save_cpo

let g:loaded_cmdbundle = 1
