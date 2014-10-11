if exists('g:loaded_cmdbundle')
  finish
endif

let s:save_cpo = &cpo
set cpo&vim

function! cmdbundle#load()
  " TODO: let filter what is allowed and what is not
  if s:enabled('g:loaded_fugitive')
    call cmd#define('Git: Status', ":Gstatus<CR>", ",gs")
    call cmd#define('Git: Diff', ":Gdiff<CR>", ",gd")

    call cmd#define('Git: Log', ':call <SNR>' . s:SID() .'_showGitLog()<CR>', ",gl")
    call cmd#define('Git: Blame', ":Gblame<CR>", ",gb")
    call cmd#define('Git: Push', ":Git push<CR>", ",gp")
  endif

  if s:enabled('unimpared')
  endif
endfunction

function s:showGitLog()
  let suffix = ''
  let uniteSources = unite#get_all_sources()
  if has_key(uniteSources, 'quickfix')
    execute 'normal :Unite quickfix\<CR>'
    let suffix = '| Unite quickfix'
  endif
  execute "normal :silent Glog ". suffix . "\<CR>"
endfunction

function s:SID()
  return matchstr(expand('<sfile>'), '<SNR>\zs\d\+\ze_SID$')
endfun

function! s:enabled(name)
  return 1
endfunction


let &cpo = s:save_cpo
unlet s:save_cpo

let g:loaded_cmdbundle = 1
