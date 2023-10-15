"###############    FERN    ###############"
nmap <silent> <Leader>2 :Fern %:h<CR>
noremap <silent> <Leader>1 :Fern . -drawer -reveal=% -toggle -width=35<CR><C-w>=
let g:fern#disable_default_mappings = 1

function! s:init_fern() abort
  nmap <buffer><expr>
        \ <Plug>(fern-my-open-expand-collapse)
        \ fern#smart#leaf(
        \   "\<Plug>(fern-action-open:select)",
        \   "\<Plug>(fern-action-expand)",
        \   "\<Plug>(fern-action-collapse)",
        \ )
  nmap <buffer> <CR> <Plug>(fern-my-open-expand-collapse)
  nmap <buffer> d <Plug>(fern-action-remove)<CR>
  nmap <buffer> n <Plug>(fern-action-new-path)<CR>
  nmap <buffer> r <Plug>(fern-action-reload)<CR>
  nmap <buffer> m <Plug>(fern-action-rename)<CR>
  nmap <buffer> h <Plug>(fern-action-hidden:toggle)
  nmap <buffer> K <Plug>(fern-action-mark:toggle)
  nmap <buffer> v <Plug>(fern-action-open:vsplit)
  nmap <buffer> s <Plug>(fern-action-open:split)

  nmap <buffer><silent> <Leader>1 :q<CR> 

  nmap <buffer><nowait> < <Plug>(fern-action-leave)
  nmap <buffer><nowait> > <Plug>(fern-action-enter)
endfunction

augroup fern-custom
  autocmd! *
  autocmd FileType fern call s:init_fern()
augroup END

