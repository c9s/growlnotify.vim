
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





