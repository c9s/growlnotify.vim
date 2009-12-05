

" helper function
fun! s:growl_notify_msg(msg)
  let opt = growl#opt()
  let opt.message = a:msg
  cal growl#notify(opt)
endf

" helper command
com! -nargs=1 GrowlNotifyMsg  :cal s:growl_notify_msg( <f-args> )

" :GrowlNotifyMsg "Hello World"
