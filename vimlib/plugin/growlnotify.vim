

fun! s:check_bin()
  let pathstr = expand('$PATH')
  let path = split(pathstr,":")
  for p in path 
    let bin = expand(p . '/growlnotify')  " prevent tile path ~/
    if strlen(bin) > 0 && filereadable( bin ) && executable( bin )
      return 1
    endif
  endfor
  return 0
endf


fun! s:opt_growl_param(opt)
  let param = []
  for k in keys(a:opt) 
    cal add(param, printf("--%s %s", k, a:opt[ k ] ) )
  endfor
  return param
endf

" growl#notify
"   opt: growl option variable
fun! s:growl_notify(opt)
  " check if growlnotify installed.
  if ! s:check_bin() 
    echoerr "growlnotify not found. please install it via jGrowl package."
    return 
  endif

  " build notify command 
  let cmd = [ 'growlnotify' ]
  cal extend( cmd , s:opt_growl_param( a:opt ) )

  let ret = system(join(cmd," "))
  if v:shell_error 
    echoerr v:shell_error
    echoerr ret
  endif
endf

" external helper functions
" =========================
fun! g:growl_notify_msg(msg)
  let opt = growl#default_opt()
  let opt.message = a:msg
  cal s:growl_notify(opt)
endf

" helper command
com! -nargs=1 GrowlNotifyMsg  :cal g:growl_notify_msg( <f-args> )

" :GrowlNotifyMsg "Hello World"
