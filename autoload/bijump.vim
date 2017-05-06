"=============================================================================
" File: bijump.vim
" Author: sumoooru2
" Created: 2017-05-05
"=============================================================================

scriptencoding utf-8

if !exists('g:loaded_bijump')
    finish
endif
let g:loaded_bijump = 1

let s:save_cpo = &cpo
set cpo&vim


let &cpo = s:save_cpo
unlet s:save_cpo


