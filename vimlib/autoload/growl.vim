
" Plugin:  growl-notify.vim
"          growlnotify script wrapper for vim.
" Version: 0.1
" License: MIT

" default growl option 
fun! growl#default_opt()
  let growl_opt = {}
  let growl_opt.name = 'vim'
  let growl_opt.image = expand('~/.vim/icon/vim-icon.png')
  return growl_opt
endf

" growl#notify
"   opt: growl option variable
fun! growl#notify(opt)
  " check if growlnotify installed.

  " build notify command 
  let cmd = [ 'growlnotify' ]
  for k in keys(a:opt) 
    cal add(cmd, printf("--%s %s", k, a:opt[ k ] ) )
  endfor

  let ret = system(join(cmd," "))
  if v:shell_error 
    echoerr v:shell_error
    echoerr ret
  endif
endf




