" =============================================================================
" URL: https://github.com/sainnhe/edge/
" Filename: autoload/airline/themes/edge.vim
" Author: Sainnhepark
" Email: sainnhe@gmail.com
" License: MIT License & Anti-996 License
" =============================================================================

"{{{Palette
let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}

if get(g:, 'edge_style', 'default') ==# 'default'
    if &background ==# 'dark'
        let s:foreground = [ '#bcc4d1', 250 ]
        let s:background = [ '#262729', 235 ]
        let s:background_alt = [ '#2c2e34', 236 ]
        let s:background_grey = [ '#3b3e48', 238 ]
        let s:red_sel = [ '#f27a7a', 203 ]
        let s:purple_sel = [ '#d597e7', 176 ]
        let s:green_sel = [ '#a2be8a', 107 ]
        let s:blue_sel = [ '#72b1e5', 110 ]
        let s:red_fg = [ '#f27a7a', 203 ]
        let s:purple_fg = [ '#d597e7', 176 ]
        let s:green_fg = [ '#a3bc8d', 107 ]
        let s:blue_fg = [ '#77b3e4', 110 ]
    else
        let s:foreground = [ '#4b505b', 241 ]
        let s:background = [ '#fafafa', 231 ]
        let s:background_alt = [ '#eef1f4', 255 ]
        let s:background_grey = [ '#dde2e7', 253 ]
        let s:red_sel = [ '#e17373', 167 ]
        let s:purple_sel = [ '#bf75d6', 134 ]
        let s:green_sel = [ '#76af6f', 107 ]
        let s:blue_sel = [ '#6996e0', 68 ]
        let s:red_fg = [ '#d15f5f', 167 ]
        let s:purple_fg = [ '#b05ccc', 134 ]
        let s:green_fg = [ '#608e32', 107 ]
        let s:blue_fg = [ '#5079be', 68 ]
    endif
elseif get(g:, 'edge_style', 'default') ==# 'neon'
    if &background ==# 'dark'
        let s:foreground = [ '#bcc3d2', 250 ]
        let s:background = [ '#23252e', 235 ]
        let s:background_alt = [ '#2b2d3a', 236 ]
        let s:background_grey = [ '#393e53', 238 ]
        let s:red_sel = [ '#f27a7a', 203 ]
        let s:purple_sel = [ '#d597e7', 176 ]
        let s:green_sel = [ '#a2be8a', 107 ]
        let s:blue_sel = [ '#7eb4e7', 110 ]
        let s:red_fg = [ '#f27a7a', 203 ]
        let s:purple_fg = [ '#d597e7', 176 ]
        let s:green_fg = [ '#a4be8e', 107 ]
        let s:blue_fg = [ '#7eb4e7', 110 ]
    else
        let s:foreground = [ '#4b505b', 241 ]
        let s:background = [ '#fafafa', 231 ]
        let s:background_alt = [ '#eef2f6', 255 ]
        let s:background_grey = [ '#dde4ea', 253 ]
        let s:red_sel = [ '#e17373', 167 ]
        let s:purple_sel = [ '#bf75d6', 134 ]
        let s:green_sel = [ '#76af6f', 107 ]
        let s:blue_sel = [ '#6996e0', 68 ]
        let s:red_fg = [ '#d15f5f', 167 ]
        let s:purple_fg = [ '#b05ccc', 134 ]
        let s:green_fg = [ '#608e32', 107 ]
        let s:blue_fg = [ '#5079be', 68 ]
    endif
endif
"}}}

"{{{Definition
let s:accents = s:red_fg

let s:normal_side_fg = s:background
let s:normal_side_bg = s:purple_sel
let s:normal_sub_fg = s:foreground
let s:normal_sub_bg = s:background_grey
let s:normal_mid_fg = s:foreground
let s:normal_mid_bg = s:background_alt
let s:normal_mod_fg = s:purple_fg
let s:normal_mod_bg = s:background_alt

let s:insert_side_fg = s:background
let s:insert_side_bg = s:blue_sel
let s:insert_sub_fg = s:foreground
let s:insert_sub_bg = s:background_grey
let s:insert_mid_fg = s:foreground
let s:insert_mid_bg = s:background_alt
let s:insert_mod_fg = s:blue_fg
let s:insert_mod_bg = s:background_alt

let s:visual_side_fg = s:background
let s:visual_side_bg = s:red_sel
let s:visual_sub_fg = s:foreground
let s:visual_sub_bg = s:background_grey
let s:visual_mid_fg = s:foreground
let s:visual_mid_bg = s:background_alt
let s:visual_mod_fg = s:red_fg
let s:visual_mod_bg = s:background_alt

let s:replace_side_fg = s:background
let s:replace_side_bg = s:green_sel
let s:replace_sub_fg = s:foreground
let s:replace_sub_bg = s:background_grey
let s:replace_mid_fg = s:foreground
let s:replace_mid_bg = s:background_alt
let s:replace_mod_fg = s:green_fg
let s:replace_mod_bg = s:background_alt

let s:inactive_side_fg = s:background
let s:inactive_side_bg = s:background_grey
let s:inactive_sub_fg = s:foreground
let s:inactive_sub_bg = s:background_grey
let s:inactive_mid_fg = s:foreground
let s:inactive_mid_bg = s:background_alt
let s:inactive_mod_fg = s:foreground
let s:inactive_mod_bg = s:background_alt
"}}}

"{{{Implementation
let g:airline#themes#edge#palette = {}
let g:airline#themes#edge#palette.accents = {
            \ 'red': [ s:accents[0] , '' , s:accents[1] , '' , '' ],
            \ }

" Normal mode
let s:N1 = [ s:normal_side_fg[0] , s:normal_side_bg[0] , s:normal_side_fg[1] , s:normal_side_bg[1] ]
let s:N2 = [ s:normal_sub_fg[0] , s:normal_sub_bg[0] , s:normal_sub_fg[1] , s:normal_sub_bg[1] ]
let s:N3 = [ s:normal_mid_fg[0] , s:normal_mid_bg[0] , s:normal_mid_fg[1] , s:normal_mid_bg[1] ]

let g:airline#themes#edge#palette.normal = airline#themes#generate_color_map(s:N1, s:N2, s:N3)
let g:airline#themes#edge#palette.normal_modified = {
            \ 'airline_c': [ s:normal_mod_fg[0] , s:normal_mod_bg[0] , s:normal_mod_fg[1] , s:normal_mod_bg[1] ] ,
            \ }

" Insert mode
let s:I1 = [ s:insert_side_fg[0] , s:insert_side_bg[0] , s:insert_side_fg[1] , s:insert_side_bg[1] ]
let s:I2 = [ s:insert_sub_fg[0] , s:insert_sub_bg[0] , s:insert_sub_fg[1] , s:insert_sub_bg[1] ]
let s:I3 = [ s:insert_mid_fg[0] , s:insert_mid_bg[0] , s:insert_mid_fg[1] , s:insert_mid_bg[1] ]

let g:airline#themes#edge#palette.insert = airline#themes#generate_color_map(s:I1, s:I2, s:I3)
let g:airline#themes#edge#palette.insert_modified = {
            \ 'airline_c': [ s:insert_mod_fg[0] , s:insert_mod_bg[0] , s:insert_mod_fg[1] , s:insert_mod_bg[1] ] ,
            \ }

" Replace mode
let s:R1 = [ s:replace_side_fg[0] , s:replace_side_bg[0] , s:replace_side_fg[1] , s:replace_side_bg[1] ]
let s:R2 = [ s:replace_sub_fg[0] , s:replace_sub_bg[0] , s:replace_sub_fg[1] , s:replace_sub_bg[1] ]
let s:R3 = [ s:replace_mid_fg[0] , s:replace_mid_bg[0] , s:replace_mid_fg[1] , s:replace_mid_bg[1] ]

let g:airline#themes#edge#palette.replace = airline#themes#generate_color_map(s:R1, s:R2, s:R3)
let g:airline#themes#edge#palette.replace_modified = {
            \ 'airline_c': [ s:replace_mod_fg[0] , s:replace_mod_bg[0] , s:replace_mod_fg[1] , s:replace_mod_bg[1] ] ,
            \ }

" Visual mode
let s:V1 = [ s:visual_side_fg[0] , s:visual_side_bg[0] , s:visual_side_fg[1] , s:visual_side_bg[1] ]
let s:V2 = [ s:visual_sub_fg[0] , s:visual_sub_bg[0] , s:visual_sub_fg[1] , s:visual_sub_bg[1] ]
let s:V3 = [ s:visual_mid_fg[0] , s:visual_mid_bg[0] , s:visual_mid_fg[1] , s:visual_mid_bg[1] ]

let g:airline#themes#edge#palette.visual = airline#themes#generate_color_map(s:V1, s:V2, s:V3)
let g:airline#themes#edge#palette.visual_modified = {
            \ 'airline_c': [ s:visual_mod_fg[0] , s:visual_mod_bg[0] , s:visual_mod_fg[1] , s:visual_mod_bg[1] ] ,
            \ }

" Inactive
let s:IA1 = [ s:inactive_side_fg[0] , s:inactive_side_bg[0] , s:inactive_side_fg[1] , s:inactive_side_bg[1] ]
let s:IA2 = [ s:inactive_sub_fg[0] , s:inactive_sub_bg[0] , s:inactive_sub_fg[1] , s:inactive_sub_bg[1] ]
let s:IA3 = [ s:inactive_mid_fg[0] , s:inactive_mid_bg[0] , s:inactive_mid_fg[1] , s:inactive_mid_bg[1] ]

let g:airline#themes#edge#palette.inactive = airline#themes#generate_color_map(s:IA1, s:IA2, s:IA3)
let g:airline#themes#edge#palette.inactive_modified = {
            \ 'airline_c': [ s:inactive_mod_fg[0] , s:inactive_mod_bg[0] , s:inactive_mod_fg[1] , s:inactive_mod_bg[1] ] ,
            \ }
"}}}

