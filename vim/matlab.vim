imap <C-c> <C-o>v
vmap <C-c> y
imap <C-v> <Esc>"*pi
nmap <C-c> v
nmap <C-v> "*p

nmap <C-f> <C-s>:let @+ = expand("%:p")<CR>
imap <C-f> <Esc><C-s>:let @+ = expand("%:p")<CR>i
