"=============================================================================
" File: bijump.vim
" Author: sumoooru2
" Created: 2017-05-05
"=============================================================================

" :[line number] -> f [character] ;;... may be better! :)

scriptencoding utf-8

if exists('s:loaded_bijump')
    finish
endif
let s:loaded_bijump = 1

let s:save_cpo = &cpo
set cpo&vim

" nnoremap <silent> <Plug>(simplehl::toggle) :SimplehlToggle<CR>
" nnoremap <silent> <Plug>(simplehl::reset) :SimplehlReset<CR>
"
" command! -nargs=0 SimplehlToggle call simplehl#toggle(expand('<cword>'))
" command! -nargs=0 SimplehlReset call simplehl#init()

" TODO
let s:bil = 0
let s:bir = 0
let s:bib = 0
let s:bit = 0

function! bijump#jump()
    call cursor((s:bit + s:bib) / 2, (s:bir + s:bil) / 2)
    " echo getpos('.')
    " echo [s:bil, s:bir, s:bit, s:bib]
endfunction

" bad?
function! bijump#reset()
    nunmap j
    nunmap k
    nunmap h
    nunmap l
    nunmap <ESC>
endfunction

function! bijump#tes()
    " call cursor(40, 40)
    let s:bil = col('0')
    let s:bir = col('$')
    let s:bit = line('w0')
    let s:bib = line('w$')
    call bijump#jump()
    nmap <silent> j :call bijump#j()<CR>
    nmap <silent> k :call bijump#k()<CR>
    nmap <silent> h :call bijump#h()<CR>
    nmap <silent> l :call bijump#l()<CR>
    nnoremap <ESC> :call bijump#reset()<CR><ESC>
    " nnoremap <C-[> :call bijump#reset()<CR><C-[>
    " nnoremap <C-c> :call bijump#reset()<CR><C-c>
endfunction

function! bijump#j()
    let s:bit = line('.')
    call bijump#jump()
    let s:bil = col('0')
    let s:bir = col('$')
endfunction

function! bijump#k()
    let s:bib = line('.')
    call bijump#jump()
    let s:bil = col('0')
    let s:bir = col('$')
endfunction

function! bijump#h()
    let s:bir = col('.')
    call bijump#jump()
endfunction

function! bijump#l()
    let s:bil = col('.')
    call bijump#jump()
endfunction

" call bijump#tes()
nnoremap <silent> <Plug>(bijump::tes) :BijumpTes<CR>
command! -nargs=0 BijumpTes call bijump#tes()
" nnoremap <silent> <Plug>(bijump::j) echo 1

"bijump
nmap go <Plug>(bijump::tes)
nmap gq :call bijump#reset()<CR>

let &cpo = s:save_cpo
unlet s:save_cpo

