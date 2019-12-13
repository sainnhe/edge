let g:airline#themes#edge#palette = {}
let g:airline#themes#edge#palette.accents = {
      \ 'red': [ '#ef7f7f' , '' , 203 , '' , '' ],
      \ }

" Normal mode
let s:N1 = [ '#262729' , '#d898eb' , 235 , 176 ] " mode
let s:N2 = [ '#bcc4d1' , '#3b3e48' , 250 , 238 ] " info
let s:N3 = [ '#bcc4d1' , '#2c2d33' , 250 , 236 ] " statusline

let g:airline#themes#edge#palette.normal = airline#themes#generate_color_map(s:N1, s:N2, s:N3)
let g:airline#themes#edge#palette.normal_modified = {
      \ 'airline_c': [ '#d898eb' , '#2c2d33' , 176 , 236 ] ,
      \ }

" Insert mode
let s:I1 = [ '#262729' , '#72b1e5' , 235 , 110 ] " mode
let s:I2 = [ '#bcc4d1' , '#3b3e48' , 250 , 238 ] " info
let s:I3 = [ '#bcc4d1' , '#2c2d33' , 250 , 236 ] " statusline

let g:airline#themes#edge#palette.insert = airline#themes#generate_color_map(s:I1, s:I2, s:I3)
let g:airline#themes#edge#palette.insert_modified = {
      \ 'airline_c': [ '#72b1e5' , '#2c2d33' , 176 , 110 ] ,
      \ }

" Replace mode
let s:R1 = [ '#262729' , '#98be72' , 235 , 107 ] " mode
let s:R2 = [ '#bcc4d1' , '#3b3e48' , 250 , 238 ] " info
let s:R3 = [ '#bcc4d1' , '#2c2d33' , 250 , 236 ] " statusline

let g:airline#themes#edge#palette.replace = airline#themes#generate_color_map(s:R1, s:R2, s:R3)
let g:airline#themes#edge#palette.replace_modified = {
      \ 'airline_c': [ '#98be72' , '#2c2d33' , 176 , 107 ] ,
      \ }

" Visual mode
let s:V1 = [ '#262729' , '#ef7f7f' , 235 , 203 ] " mode
let s:V2 = [ '#bcc4d1' , '#3b3e48' , 250 , 238 ] " info
let s:V3 = [ '#bcc4d1' , '#2c2d33' , 250 , 236 ] " statusline

let g:airline#themes#edge#palette.visual = airline#themes#generate_color_map(s:V1, s:V2, s:V3)
let g:airline#themes#edge#palette.visual_modified = {
      \ 'airline_c': [ '#ef7f7f' , '#2c2d33' , 176 , 203 ] ,
      \ }

" Inactive
let s:IA = [ '#bcc4d1' , '#2c2d33' , 250 , 236, '' ]
let g:airline#themes#edge#palette.inactive = airline#themes#generate_color_map(s:IA, s:IA, s:IA)
let g:airline#themes#edge#palette.inactive_modified = {
      \ 'airline_c': [ '#bcc4d1' , '#2c2d33' , 250 , 203 ] ,
      \ }

