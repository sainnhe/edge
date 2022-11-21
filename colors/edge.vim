" -----------------------------------------------------------------------------
" Name:         Edge
" Description:  Clean & Elegant Color Scheme inspired by Atom One and Material
" Author:       Sainnhepark <i@sainnhe.dev>
" Website:      https://github.com/sainnhe/edge/
" License:      MIT && Anti-996
" -----------------------------------------------------------------------------

" Initialization: {{{
let s:configuration = edge#get_configuration()
let s:palette = edge#get_palette(s:configuration.style, s:configuration.dim_foreground, s:configuration.colors_override)
let s:path = expand('<sfile>:p') " the path of this script
let s:last_modified = 'Mon Nov 21 06:24:28 AM UTC 2022'
let g:edge_loaded_file_types = []

if !(exists('g:colors_name') && g:colors_name ==# 'edge' && s:configuration.better_performance)
  highlight clear
  if exists('syntax_on')
    syntax reset
  endif
endif

let g:colors_name = 'edge'

if !(has('termguicolors') && &termguicolors) && !has('gui_running') && &t_Co != 256
  finish
endif
" }}}
" Common Highlight Groups: {{{
" UI: {{{
if s:configuration.transparent_background >= 1
  call edge#highlight('Normal', s:palette.fg, s:palette.none)
  call edge#highlight('Terminal', s:palette.fg, s:palette.none)
  if s:configuration.show_eob
    call edge#highlight('EndOfBuffer', s:palette.bg4, s:palette.none)
  else
    call edge#highlight('EndOfBuffer', s:palette.bg0, s:palette.none)
  endif
  call edge#highlight('Folded', s:palette.grey, s:palette.none)
  call edge#highlight('ToolbarLine', s:palette.fg, s:palette.none)
  call edge#highlight('SignColumn', s:palette.fg, s:palette.none)
  call edge#highlight('FoldColumn', s:palette.grey_dim, s:palette.none)
else
  call edge#highlight('Normal', s:palette.fg, s:palette.bg0)
  call edge#highlight('Terminal', s:palette.fg, s:palette.bg0)
  if s:configuration.show_eob
    call edge#highlight('EndOfBuffer', s:palette.bg4, s:palette.bg0)
  else
    call edge#highlight('EndOfBuffer', s:palette.bg0, s:palette.bg0)
  endif
  call edge#highlight('Folded', s:palette.grey, s:palette.bg1)
  call edge#highlight('ToolbarLine', s:palette.fg, s:palette.bg2)
endif
call edge#highlight('SignColumn', s:palette.fg, s:palette.none)
call edge#highlight('FoldColumn', s:palette.grey_dim, s:palette.none)
call edge#highlight('IncSearch', s:palette.bg0, s:palette.bg_blue)
call edge#highlight('Search', s:palette.bg0, s:palette.bg_green)
call edge#highlight('ColorColumn', s:palette.none, s:palette.bg1)
call edge#highlight('Conceal', s:palette.grey_dim, s:palette.none)
if s:configuration.cursor ==# 'auto'
  call edge#highlight('Cursor', s:palette.none, s:palette.none, 'reverse')
else
  call edge#highlight('Cursor', s:palette.bg0, s:palette[s:configuration.cursor])
endif
highlight! link vCursor Cursor
highlight! link iCursor Cursor
highlight! link lCursor Cursor
highlight! link CursorIM Cursor
if &diff
  call edge#highlight('CursorLine', s:palette.none, s:palette.none, 'underline')
  call edge#highlight('CursorColumn', s:palette.none, s:palette.none, 'bold')
else
  call edge#highlight('CursorLine', s:palette.none, s:palette.bg1)
  call edge#highlight('CursorColumn', s:palette.none, s:palette.bg1)
endif
call edge#highlight('LineNr', s:palette.grey_dim, s:palette.none)
if &diff
  call edge#highlight('CursorLineNr', s:palette.grey, s:palette.none, 'underline')
else
  call edge#highlight('CursorLineNr', s:palette.grey, s:palette.none)
endif
call edge#highlight('DiffAdd', s:palette.none, s:palette.diff_green)
call edge#highlight('DiffChange', s:palette.none, s:palette.diff_blue)
call edge#highlight('DiffDelete', s:palette.none, s:palette.diff_red)
call edge#highlight('DiffText', s:palette.bg0, s:palette.blue)
call edge#highlight('Directory', s:palette.green, s:palette.none)
call edge#highlight('ErrorMsg', s:palette.red, s:palette.none, 'bold,underline')
call edge#highlight('WarningMsg', s:palette.yellow, s:palette.none, 'bold')
call edge#highlight('ModeMsg', s:palette.fg, s:palette.none, 'bold')
call edge#highlight('MoreMsg', s:palette.blue, s:palette.none, 'bold')
call edge#highlight('MatchParen', s:palette.none, s:palette.bg4)
call edge#highlight('NonText', s:palette.bg4, s:palette.none)
call edge#highlight('Whitespace', s:palette.bg4, s:palette.none)
call edge#highlight('SpecialKey', s:palette.bg4, s:palette.none)
call edge#highlight('Pmenu', s:palette.fg, s:palette.bg2)
call edge#highlight('PmenuSbar', s:palette.none, s:palette.bg2)
if s:configuration.menu_selection_background ==# 'blue'
  call edge#highlight('PmenuSel', s:palette.bg0, s:palette.bg_blue)
elseif s:configuration.menu_selection_background ==# 'green'
  call edge#highlight('PmenuSel', s:palette.bg0, s:palette.bg_green)
elseif s:configuration.menu_selection_background ==# 'purple'
  call edge#highlight('PmenuSel', s:palette.bg0, s:palette.bg_purple)
endif
highlight! link WildMenu PmenuSel
call edge#highlight('PmenuThumb', s:palette.none, s:palette.bg_grey)
call edge#highlight('NormalFloat', s:palette.fg, s:palette.bg2)
call edge#highlight('FloatBorder', s:palette.grey, s:palette.bg2)
call edge#highlight('Question', s:palette.yellow, s:palette.none)
if s:configuration.spell_foreground ==# 'none'
  call edge#highlight('SpellBad', s:palette.none, s:palette.none, 'undercurl', s:palette.red)
  call edge#highlight('SpellCap', s:palette.none, s:palette.none, 'undercurl', s:palette.yellow)
  call edge#highlight('SpellLocal', s:palette.none, s:palette.none, 'undercurl', s:palette.blue)
  call edge#highlight('SpellRare', s:palette.none, s:palette.none, 'undercurl', s:palette.purple)
else
  call edge#highlight('SpellBad', s:palette.red, s:palette.none, 'undercurl', s:palette.red)
  call edge#highlight('SpellCap', s:palette.yellow, s:palette.none, 'undercurl', s:palette.yellow)
  call edge#highlight('SpellLocal', s:palette.blue, s:palette.none, 'undercurl', s:palette.blue)
  call edge#highlight('SpellRare', s:palette.purple, s:palette.none, 'undercurl', s:palette.purple)
endif
if s:configuration.transparent_background == 2
  call edge#highlight('StatusLine', s:palette.fg, s:palette.none)
  call edge#highlight('StatusLineTerm', s:palette.fg, s:palette.none)
  call edge#highlight('StatusLineNC', s:palette.grey, s:palette.none)
  call edge#highlight('StatusLineTermNC', s:palette.grey, s:palette.none)
  call edge#highlight('TabLine', s:palette.fg, s:palette.bg4)
  call edge#highlight('TabLineFill', s:palette.grey, s:palette.none)
  call edge#highlight('TabLineSel', s:palette.bg0, s:palette.bg_purple)
else
  call edge#highlight('StatusLine', s:palette.fg, s:palette.bg2)
  call edge#highlight('StatusLineTerm', s:palette.fg, s:palette.bg2)
  call edge#highlight('StatusLineNC', s:palette.grey, s:palette.bg1)
  call edge#highlight('StatusLineTermNC', s:palette.grey, s:palette.bg1)
  call edge#highlight('TabLine', s:palette.fg, s:palette.bg4)
  call edge#highlight('TabLineFill', s:palette.grey, s:palette.bg1)
  call edge#highlight('TabLineSel', s:palette.bg0, s:palette.bg_purple)
endif
call edge#highlight('VertSplit', s:palette.black, s:palette.none)
highlight! link WinSeparator VertSplit
call edge#highlight('Visual', s:palette.none, s:palette.bg3)
call edge#highlight('VisualNOS', s:palette.none, s:palette.bg3, 'underline')
call edge#highlight('QuickFixLine', s:palette.purple, s:palette.none, 'bold')
call edge#highlight('Debug', s:palette.yellow, s:palette.none)
call edge#highlight('debugPC', s:palette.bg0, s:palette.bg_green)
call edge#highlight('debugBreakpoint', s:palette.bg0, s:palette.bg_red)
call edge#highlight('ToolbarButton', s:palette.bg0, s:palette.bg_purple)
if has('nvim')
  call edge#highlight('Substitute', s:palette.bg0, s:palette.yellow)
  highlight! link WinBarNC Grey
  highlight! link DiagnosticFloatingError ErrorFloat
  highlight! link DiagnosticFloatingWarn WarningFloat
  highlight! link DiagnosticFloatingInfo InfoFloat
  highlight! link DiagnosticFloatingHint HintFloat
  highlight! link DiagnosticError ErrorText
  highlight! link DiagnosticWarn WarningText
  highlight! link DiagnosticInfo InfoText
  highlight! link DiagnosticHint HintText
  highlight! link DiagnosticVirtualTextError VirtualTextError
  highlight! link DiagnosticVirtualTextWarn VirtualTextWarning
  highlight! link DiagnosticVirtualTextInfo VirtualTextInfo
  highlight! link DiagnosticVirtualTextHint VirtualTextHint
  highlight! link DiagnosticUnderlineError ErrorText
  highlight! link DiagnosticUnderlineWarn WarningText
  highlight! link DiagnosticUnderlineInfo InfoText
  highlight! link DiagnosticUnderlineHint HintText
  highlight! link DiagnosticSignError RedSign
  highlight! link DiagnosticSignWarn YellowSign
  highlight! link DiagnosticSignInfo BlueSign
  highlight! link DiagnosticSignHint GreenSign
  highlight! link LspDiagnosticsFloatingError DiagnosticFloatingError
  highlight! link LspDiagnosticsFloatingWarning DiagnosticFloatingWarn
  highlight! link LspDiagnosticsFloatingInformation DiagnosticFloatingInfo
  highlight! link LspDiagnosticsFloatingHint DiagnosticFloatingHint
  highlight! link LspDiagnosticsDefaultError DiagnosticError
  highlight! link LspDiagnosticsDefaultWarning DiagnosticWarn
  highlight! link LspDiagnosticsDefaultInformation DiagnosticInfo
  highlight! link LspDiagnosticsDefaultHint DiagnosticHint
  highlight! link LspDiagnosticsVirtualTextError DiagnosticVirtualTextError
  highlight! link LspDiagnosticsVirtualTextWarning DiagnosticVirtualTextWarn
  highlight! link LspDiagnosticsVirtualTextInformation DiagnosticVirtualTextInfo
  highlight! link LspDiagnosticsVirtualTextHint DiagnosticVirtualTextHint
  highlight! link LspDiagnosticsUnderlineError DiagnosticUnderlineError
  highlight! link LspDiagnosticsUnderlineWarning DiagnosticUnderlineWarn
  highlight! link LspDiagnosticsUnderlineInformation DiagnosticUnderlineInfo
  highlight! link LspDiagnosticsUnderlineHint DiagnosticUnderlineHint
  highlight! link LspDiagnosticsSignError DiagnosticSignError
  highlight! link LspDiagnosticsSignWarning DiagnosticSignWarn
  highlight! link LspDiagnosticsSignInformation DiagnosticSignInfo
  highlight! link LspDiagnosticsSignHint DiagnosticSignHint
  highlight! link LspReferenceText CurrentWord
  highlight! link LspReferenceRead CurrentWord
  highlight! link LspReferenceWrite CurrentWord
  highlight! link LspCodeLens VirtualTextInfo
  highlight! link LspCodeLensSeparator VirtualTextHint
  highlight! link LspSignatureActiveParameter Search
  highlight! link TermCursor Cursor
  highlight! link healthError Red
  highlight! link healthSuccess Green
  highlight! link healthWarning Yellow
endif
" }}}
" Syntax: {{{
if s:configuration.enable_italic
  call edge#highlight('Type', s:palette.red, s:palette.none, 'italic')
  call edge#highlight('Structure', s:palette.red, s:palette.none, 'italic')
  call edge#highlight('StorageClass', s:palette.red, s:palette.none, 'italic')
  call edge#highlight('Identifier', s:palette.cyan, s:palette.none, 'italic')
  call edge#highlight('Constant', s:palette.yellow, s:palette.none, 'italic')
else
  call edge#highlight('Type', s:palette.red, s:palette.none)
  call edge#highlight('Structure', s:palette.red, s:palette.none)
  call edge#highlight('StorageClass', s:palette.red, s:palette.none)
  call edge#highlight('Identifier', s:palette.cyan, s:palette.none)
  call edge#highlight('Constant', s:palette.yellow, s:palette.none)
endif
call edge#highlight('PreProc', s:palette.purple, s:palette.none)
call edge#highlight('PreCondit', s:palette.purple, s:palette.none)
call edge#highlight('Include', s:palette.purple, s:palette.none)
call edge#highlight('Keyword', s:palette.purple, s:palette.none)
call edge#highlight('Define', s:palette.purple, s:palette.none)
call edge#highlight('Typedef', s:palette.purple, s:palette.none)
call edge#highlight('Exception', s:palette.purple, s:palette.none)
call edge#highlight('Conditional', s:palette.purple, s:palette.none)
call edge#highlight('Repeat', s:palette.purple, s:palette.none)
call edge#highlight('Statement', s:palette.purple, s:palette.none)
call edge#highlight('Macro', s:palette.yellow, s:palette.none)
call edge#highlight('Error', s:palette.red, s:palette.none)
call edge#highlight('Label', s:palette.yellow, s:palette.none)
call edge#highlight('Special', s:palette.yellow, s:palette.none)
call edge#highlight('SpecialChar', s:palette.yellow, s:palette.none)
call edge#highlight('Boolean', s:palette.green, s:palette.none)
call edge#highlight('String', s:palette.green, s:palette.none)
call edge#highlight('Character', s:palette.green, s:palette.none)
call edge#highlight('Number', s:palette.green, s:palette.none)
call edge#highlight('Float', s:palette.green, s:palette.none)
call edge#highlight('Function', s:palette.blue, s:palette.none)
call edge#highlight('Operator', s:palette.purple, s:palette.none)
call edge#highlight('Title', s:palette.purple, s:palette.none, 'bold')
call edge#highlight('Tag', s:palette.yellow, s:palette.none)
call edge#highlight('Delimiter', s:palette.fg, s:palette.none)
if s:configuration.disable_italic_comment
  call edge#highlight('Comment', s:palette.grey, s:palette.none)
  call edge#highlight('SpecialComment', s:palette.grey, s:palette.none)
  call edge#highlight('Todo', s:palette.red, s:palette.none)
else
  call edge#highlight('Comment', s:palette.grey, s:palette.none, 'italic')
  call edge#highlight('SpecialComment', s:palette.grey, s:palette.none, 'italic')
  call edge#highlight('Todo', s:palette.red, s:palette.none, 'italic')
endif
call edge#highlight('Ignore', s:palette.grey, s:palette.none)
call edge#highlight('Underlined', s:palette.none, s:palette.none, 'underline')
" }}}
" Predefined Highlight Groups: {{{
call edge#highlight('Fg', s:palette.fg, s:palette.none)
call edge#highlight('Grey', s:palette.grey, s:palette.none)
call edge#highlight('Red', s:palette.red, s:palette.none)
call edge#highlight('Yellow', s:palette.yellow, s:palette.none)
call edge#highlight('Green', s:palette.green, s:palette.none)
call edge#highlight('Cyan', s:palette.cyan, s:palette.none)
call edge#highlight('Blue', s:palette.blue, s:palette.none)
call edge#highlight('Purple', s:palette.purple, s:palette.none)
if s:configuration.enable_italic
  call edge#highlight('RedItalic', s:palette.red, s:palette.none, 'italic')
  call edge#highlight('YellowItalic', s:palette.yellow, s:palette.none, 'italic')
  call edge#highlight('GreenItalic', s:palette.green, s:palette.none, 'italic')
  call edge#highlight('CyanItalic', s:palette.cyan, s:palette.none, 'italic')
  call edge#highlight('BlueItalic', s:palette.blue, s:palette.none, 'italic')
  call edge#highlight('PurpleItalic', s:palette.purple, s:palette.none, 'italic')
else
  call edge#highlight('RedItalic', s:palette.red, s:palette.none)
  call edge#highlight('YellowItalic', s:palette.yellow, s:palette.none)
  call edge#highlight('GreenItalic', s:palette.green, s:palette.none)
  call edge#highlight('CyanItalic', s:palette.cyan, s:palette.none)
  call edge#highlight('BlueItalic', s:palette.blue, s:palette.none)
  call edge#highlight('PurpleItalic', s:palette.purple, s:palette.none)
endif
call edge#highlight('RedSign', s:palette.red, s:palette.none)
call edge#highlight('YellowSign', s:palette.yellow, s:palette.none)
call edge#highlight('GreenSign', s:palette.green, s:palette.none)
call edge#highlight('CyanSign', s:palette.cyan, s:palette.none)
call edge#highlight('BlueSign', s:palette.blue, s:palette.none)
call edge#highlight('PurpleSign', s:palette.purple, s:palette.none)
if s:configuration.diagnostic_text_highlight
  call edge#highlight('ErrorText', s:palette.none, s:palette.diff_red, 'undercurl', s:palette.red)
  call edge#highlight('WarningText', s:palette.none, s:palette.diff_yellow, 'undercurl', s:palette.yellow)
  call edge#highlight('InfoText', s:palette.none, s:palette.diff_blue, 'undercurl', s:palette.blue)
  call edge#highlight('HintText', s:palette.none, s:palette.diff_green, 'undercurl', s:palette.green)
else
  call edge#highlight('ErrorText', s:palette.none, s:palette.none, 'undercurl', s:palette.red)
  call edge#highlight('WarningText', s:palette.none, s:palette.none, 'undercurl', s:palette.yellow)
  call edge#highlight('InfoText', s:palette.none, s:palette.none, 'undercurl', s:palette.blue)
  call edge#highlight('HintText', s:palette.none, s:palette.none, 'undercurl', s:palette.green)
endif
if s:configuration.diagnostic_line_highlight
  call edge#highlight('ErrorLine', s:palette.none, s:palette.diff_red)
  call edge#highlight('WarningLine', s:palette.none, s:palette.diff_yellow)
  call edge#highlight('InfoLine', s:palette.none, s:palette.diff_blue)
  call edge#highlight('HintLine', s:palette.none, s:palette.diff_green)
else
  highlight clear ErrorLine
  highlight clear WarningLine
  highlight clear InfoLine
  highlight clear HintLine
endif
if s:configuration.diagnostic_virtual_text ==# 'grey'
  highlight! link VirtualTextWarning Grey
  highlight! link VirtualTextError Grey
  highlight! link VirtualTextInfo Grey
  highlight! link VirtualTextHint Grey
else
  highlight! link VirtualTextWarning Yellow
  highlight! link VirtualTextError Red
  highlight! link VirtualTextInfo Blue
  highlight! link VirtualTextHint Green
endif
call edge#highlight('ErrorFloat', s:palette.red, s:palette.bg2)
call edge#highlight('WarningFloat', s:palette.yellow, s:palette.bg2)
call edge#highlight('InfoFloat', s:palette.blue, s:palette.bg2)
call edge#highlight('HintFloat', s:palette.green, s:palette.bg2)
if &diff
  call edge#highlight('CurrentWord', s:palette.bg0, s:palette.green)
elseif s:configuration.current_word ==# 'grey background'
  call edge#highlight('CurrentWord', s:palette.none, s:palette.bg2)
else
  call edge#highlight('CurrentWord', s:palette.none, s:palette.none, s:configuration.current_word)
endif
" }}}
" }}}
" Terminal: {{{
if ((has('termguicolors') && &termguicolors) || has('gui_running')) && !s:configuration.disable_terminal_colors
  " Definition
  let s:terminal = {
        \ 'black':    &background ==# 'dark' ? s:palette.bg3 : s:palette.fg,
        \ 'red':      s:palette.red,
        \ 'yellow':   s:palette.yellow,
        \ 'green':    s:palette.green,
        \ 'cyan':     s:palette.cyan,
        \ 'blue':     s:palette.blue,
        \ 'purple':   s:palette.purple,
        \ 'white':    &background ==# 'dark' ? s:palette.fg : s:palette.bg3
        \ }
  " Implementation: {{{
  if !has('nvim')
    let g:terminal_ansi_colors = [s:terminal.black[0], s:terminal.red[0], s:terminal.green[0], s:terminal.yellow[0],
          \ s:terminal.blue[0], s:terminal.purple[0], s:terminal.cyan[0], s:terminal.white[0], s:terminal.black[0], s:terminal.red[0],
          \ s:terminal.green[0], s:terminal.yellow[0], s:terminal.blue[0], s:terminal.purple[0], s:terminal.cyan[0], s:terminal.white[0]]
  else
    let g:terminal_color_0 = s:terminal.black[0]
    let g:terminal_color_1 = s:terminal.red[0]
    let g:terminal_color_2 = s:terminal.green[0]
    let g:terminal_color_3 = s:terminal.yellow[0]
    let g:terminal_color_4 = s:terminal.blue[0]
    let g:terminal_color_5 = s:terminal.purple[0]
    let g:terminal_color_6 = s:terminal.cyan[0]
    let g:terminal_color_7 = s:terminal.white[0]
    let g:terminal_color_8 = s:terminal.black[0]
    let g:terminal_color_9 = s:terminal.red[0]
    let g:terminal_color_10 = s:terminal.green[0]
    let g:terminal_color_11 = s:terminal.yellow[0]
    let g:terminal_color_12 = s:terminal.blue[0]
    let g:terminal_color_13 = s:terminal.purple[0]
    let g:terminal_color_14 = s:terminal.cyan[0]
    let g:terminal_color_15 = s:terminal.white[0]
  endif
  " }}}
endif
" }}}
" Plugins: {{{
" nvim-treesitter/nvim-treesitter {{{
call edge#highlight('TSStrong', s:palette.none, s:palette.none, 'bold')
call edge#highlight('TSEmphasis', s:palette.none, s:palette.none, 'italic')
call edge#highlight('TSUnderline', s:palette.none, s:palette.none, 'underline')
call edge#highlight('TSNote', s:palette.bg0, s:palette.blue, 'bold')
call edge#highlight('TSWarning', s:palette.bg0, s:palette.yellow, 'bold')
call edge#highlight('TSDanger', s:palette.bg0, s:palette.red, 'bold')
highlight! link TSAnnotation Purple
highlight! link TSAttribute Yellow
highlight! link TSBoolean Green
highlight! link TSCharacter Green
highlight! link TSCharacterSpecial SpecialChar
highlight! link TSComment Comment
highlight! link TSConditional Purple
highlight! link TSConstBuiltin CyanItalic
highlight! link TSConstMacro CyanItalic
highlight! link TSConstant RedItalic
highlight! link TSConstructor Blue
highlight! link TSDebug Debug
highlight! link TSDefine Define
highlight! link TSEnvironment Macro
highlight! link TSEnvironmentName Type
highlight! link TSError Error
highlight! link TSException Purple
highlight! link TSField Cyan
highlight! link TSFloat Green
highlight! link TSFuncBuiltin Blue
highlight! link TSFuncMacro Blue
highlight! link TSFunction Blue
highlight! link TSFunctionCall Blue
highlight! link TSInclude Purple
highlight! link TSKeyword Purple
highlight! link TSKeywordFunction Purple
highlight! link TSKeywordOperator Purple
highlight! link TSKeywordReturn Purple
highlight! link TSLabel Purple
highlight! link TSLiteral String
highlight! link TSMath Green
highlight! link TSMethod Blue
highlight! link TSMethodCall Blue
highlight! link TSNamespace Yellow
highlight! link TSNone Fg
highlight! link TSNumber Green
highlight! link TSOperator Purple
highlight! link TSParameter RedItalic
highlight! link TSParameterReference RedItalic
highlight! link TSPreProc PreProc
highlight! link TSProperty Cyan
highlight! link TSPunctBracket Grey
highlight! link TSPunctDelimiter Grey
highlight! link TSPunctSpecial Yellow
highlight! link TSRepeat Purple
highlight! link TSStorageClass Purple
highlight! link TSStorageClassLifetime Purple
highlight! link TSStrike Grey
highlight! link TSString Green
highlight! link TSStringEscape Yellow
highlight! link TSStringRegex Yellow
highlight! link TSStringSpecial SpecialChar
highlight! link TSSymbol Red
highlight! link TSTag RedItalic
highlight! link TSTagAttribute Blue
highlight! link TSTagDelimiter Purple
highlight! link TSText Green
highlight! link TSTextReference Constant
highlight! link TSTitle Title
highlight! link TSTodo Todo
highlight! link TSType Yellow
highlight! link TSTypeBuiltin Yellow
highlight! link TSTypeDefinition Purple
highlight! link TSTypeQualifier Purple
highlight! link TSURI markdownUrl
highlight! link TSVariable RedItalic
highlight! link TSVariableBuiltin CyanItalic
if has('nvim-0.8.0')
  highlight! link @annotation TSAnnotation
  highlight! link @attribute TSAttribute
  highlight! link @boolean TSBoolean
  highlight! link @character TSCharacter
  highlight! link @character.special TSCharacterSpecial
  highlight! link @comment TSComment
  highlight! link @conceal Grey
  highlight! link @conditional TSConditional
  highlight! link @constant TSConstant
  highlight! link @constant.builtin TSConstBuiltin
  highlight! link @constant.macro TSConstMacro
  highlight! link @constructor TSConstructor
  highlight! link @debug TSDebug
  highlight! link @define TSDefine
  highlight! link @error TSError
  highlight! link @exception TSException
  highlight! link @field TSField
  highlight! link @float TSFloat
  highlight! link @function TSFunction
  highlight! link @function.builtin TSFuncBuiltin
  highlight! link @function.call TSFunctionCall
  highlight! link @function.macro TSFuncMacro
  highlight! link @include TSInclude
  highlight! link @keyword TSKeyword
  highlight! link @keyword.function TSKeywordFunction
  highlight! link @keyword.operator TSKeywordOperator
  highlight! link @keyword.return TSKeywordReturn
  highlight! link @label TSLabel
  highlight! link @math TSMath
  highlight! link @method TSMethod
  highlight! link @method.call TSMethodCall
  highlight! link @namespace TSNamespace
  highlight! link @none TSNone
  highlight! link @number TSNumber
  highlight! link @operator TSOperator
  highlight! link @parameter TSParameter
  highlight! link @parameter.reference TSParameterReference
  highlight! link @preproc TSPreProc
  highlight! link @property TSProperty
  highlight! link @punctuation.bracket TSPunctBracket
  highlight! link @punctuation.delimiter TSPunctDelimiter
  highlight! link @punctuation.special TSPunctSpecial
  highlight! link @repeat TSRepeat
  highlight! link @storageclass TSStorageClass
  highlight! link @storageclass.lifetime TSStorageClassLifetime
  highlight! link @strike TSStrike
  highlight! link @string TSString
  highlight! link @string.escape TSStringEscape
  highlight! link @string.regex TSStringRegex
  highlight! link @string.special TSStringSpecial
  highlight! link @symbol TSSymbol
  highlight! link @tag TSTag
  highlight! link @tag.attribute TSTagAttribute
  highlight! link @tag.delimiter TSTagDelimiter
  highlight! link @text TSText
  highlight! link @text.danger TSDanger
  highlight! link @text.diff.add diffAdded
  highlight! link @text.diff.delete diffRemoved
  highlight! link @text.emphasis TSEmphasis
  highlight! link @text.environment TSEnvironment
  highlight! link @text.environment.name TSEnvironmentName
  highlight! link @text.literal TSLiteral
  highlight! link @text.math TSMath
  highlight! link @text.note TSNote
  highlight! link @text.reference TSTextReference
  highlight! link @text.strike TSStrike
  highlight! link @text.strong TSStrong
  highlight! link @text.title TSTitle
  highlight! link @text.todo TSTodo
  highlight! link @text.underline TSUnderline
  highlight! link @text.uri TSURI
  highlight! link @text.warning TSWarning
  highlight! link @todo TSTodo
  highlight! link @type TSType
  highlight! link @type.builtin TSTypeBuiltin
  highlight! link @type.definition TSTypeDefinition
  highlight! link @type.qualifier TSTypeQualifier
  highlight! link @uri TSURI
  highlight! link @variable TSVariable
  highlight! link @variable.builtin TSVariableBuiltin
endif
" }}}
" neoclide/coc.nvim {{{
call edge#highlight('CocHoverRange', s:palette.none, s:palette.none, 'bold,underline')
call edge#highlight('CocSearch', s:palette.green, s:palette.none, 'bold')
call edge#highlight('CocPumSearch', s:palette.green, s:palette.none, 'bold')
call edge#highlight('CocMarkdownHeader', s:palette.purple, s:palette.none, 'bold')
call edge#highlight('CocMarkdownLink', s:palette.green, s:palette.none, 'underline')
highlight! link CocMarkdownCode Green
highlight! link CocPumShortcut Grey
highlight! link CocPumVirtualText Grey
highlight! link CocPumMenu Pmenu
highlight! link CocMenuSel PmenuSel
highlight! link CocDisabled Grey
highlight! link CocSnippetVisual DiffAdd
highlight! link CocInlayHint LineNr
highlight! link CocNotificationProgress Green
highlight! link CocNotificationButton PmenuSel
highlight! link CocSemClass TSType
highlight! link CocSemEnum TSType
highlight! link CocSemInterface TSType
highlight! link CocSemStruct TSType
highlight! link CocSemTypeParameter TSType
highlight! link CocSemVariable TSVariable
highlight! link CocSemEnumMember TSProperty
highlight! link CocSemEvent TSLabel
highlight! link CocSemModifier TSOperator
highlight! link CocErrorFloat ErrorFloat
highlight! link CocWarningFloat WarningFloat
highlight! link CocInfoFloat InfoFloat
highlight! link CocHintFloat HintFloat
highlight! link CocFloatDividingLine Grey
highlight! link CocErrorHighlight ErrorText
highlight! link CocWarningHighlight WarningText
highlight! link CocInfoHighlight InfoText
highlight! link CocHintHighlight HintText
highlight! link CocHighlightText CurrentWord
highlight! link CocHoverRange CurrentWord
highlight! link CocErrorSign RedSign
highlight! link CocWarningSign YellowSign
highlight! link CocInfoSign BlueSign
highlight! link CocHintSign GreenSign
highlight! link CocWarningVirtualText VirtualTextWarning
highlight! link CocErrorVirtualText VirtualTextError
highlight! link CocInfoVirtualText VirtualTextInfo
highlight! link CocHintVirtualText VirtualTextHint
highlight! link CocErrorLine ErrorLine
highlight! link CocWarningLine WarningLine
highlight! link CocInfoLine InfoLine
highlight! link CocHintLine HintLine
highlight! link CocCodeLens Grey
highlight! link CocFadeOut Grey
highlight! link CocStrikeThrough Grey
highlight! link CocListMode StatusLine
highlight! link CocListPath StatusLine
highlight! link CocSelectedText Purple
highlight! link CocListsLine Fg
highlight! link CocListsDesc Grey
highlight! link HighlightedyankRegion Visual
highlight! link CocGitAddedSign GreenSign
highlight! link CocGitChangeRemovedSign PurpleSign
highlight! link CocGitChangedSign BlueSign
highlight! link CocGitRemovedSign RedSign
highlight! link CocGitTopRemovedSign RedSign
" }}}
" prabirshrestha/vim-lsp {{{
highlight! link LspErrorVirtual VirtualTextError
highlight! link LspWarningVirtual VirtualTextWarning
highlight! link LspInformationVirtual VirtualTextInfo
highlight! link LspHintVirtual VirtualTextHint
highlight! link LspErrorHighlight ErrorText
highlight! link LspWarningHighlight WarningText
highlight! link LspInformationHighlight InfoText
highlight! link LspHintHighlight HintText
highlight! link lspReference CurrentWord
highlight! link lspInlayHintsType LineNr
highlight! link lspInlayHintsParameter LineNr
highlight! link LspSemanticType TSType
highlight! link LspSemanticClass TSType
highlight! link LspSemanticEnum TSType
highlight! link LspSemanticInterface TSType
highlight! link LspSemanticStruct TSType
highlight! link LspSemanticTypeParameter TSType
highlight! link LspSemanticParameter TSParameter
highlight! link LspSemanticVariable TSVariable
highlight! link LspSemanticProperty TSProperty
highlight! link LspSemanticEnumMember TSProperty
highlight! link LspSemanticEvents TSLabel
highlight! link LspSemanticFunction TSFunction
highlight! link LspSemanticMethod TSMethod
highlight! link LspSemanticKeyword TSKeyword
highlight! link LspSemanticModifier TSOperator
highlight! link LspSemanticComment TSComment
highlight! link LspSemanticString TSString
highlight! link LspSemanticNumber TSNumber
highlight! link LspSemanticRegexp TSStringRegex
highlight! link LspSemanticOperator TSOperator
" }}}
" ycm-core/YouCompleteMe {{{
highlight! link YcmErrorSign RedSign
highlight! link YcmWarningSign YellowSign
highlight! link YcmErrorLine ErrorLine
highlight! link YcmWarningLine WarningLine
highlight! link YcmErrorSection ErrorText
highlight! link YcmWarningSection WarningText
highlight! link YcmInlayHint LineNr
if !has('nvim') && has('textprop') && !exists('g:YCM_HIGHLIGHT_GROUP')
  let g:YCM_HIGHLIGHT_GROUP = {
        \ 'typeParameter': 'TSType',
        \ 'parameter': 'TSParameter',
        \ 'variable': 'TSVariable',
        \ 'property': 'TSProperty',
        \ 'enumMember': 'TSVariableBuiltin',
        \ 'event': 'TSLabel',
        \ 'member': 'TSVariable',
        \ 'method': 'TSMethod',
        \ 'class': 'TSType',
        \ 'namespace': 'TSNamespace',
        \ }
  for tokenType in keys( g:YCM_HIGHLIGHT_GROUP )
    try
      call prop_type_add( 'YCM_HL_' . tokenType,
            \ { 'highlight': g:YCM_HIGHLIGHT_GROUP[ tokenType ] } )
    catch
    endtry
  endfor
endif
" }}}
" dense-analysis/ale {{{
highlight! link ALEError ErrorText
highlight! link ALEWarning WarningText
highlight! link ALEInfo InfoText
highlight! link ALEErrorSign RedSign
highlight! link ALEWarningSign YellowSign
highlight! link ALEInfoSign BlueSign
highlight! link ALEErrorLine ErrorLine
highlight! link ALEWarningLine WarningLine
highlight! link ALEInfoLine InfoLine
highlight! link ALEVirtualTextError VirtualTextError
highlight! link ALEVirtualTextWarning VirtualTextWarning
highlight! link ALEVirtualTextInfo VirtualTextInfo
highlight! link ALEVirtualTextStyleError VirtualTextHint
highlight! link ALEVirtualTextStyleWarning VirtualTextHint
" }}}
" neomake/neomake {{{
highlight! link NeomakeError ErrorText
highlight! link NeomakeWarning WarningText
highlight! link NeomakeInfo InfoText
highlight! link NeomakeMessage HintText
highlight! link NeomakeErrorSign RedSign
highlight! link NeomakeWarningSign YellowSign
highlight! link NeomakeInfoSign BlueSign
highlight! link NeomakeMessageSign GreenSign
highlight! link NeomakeVirtualtextError VirtualTextError
highlight! link NeomakeVirtualtextWarning VirtualTextWarning
highlight! link NeomakeVirtualtextInfo VirtualTextInfo
highlight! link NeomakeVirtualtextMessag VirtualTextHint
" }}}
" vim-syntastic/syntastic {{{
highlight! link SyntasticError ErrorText
highlight! link SyntasticWarning WarningText
highlight! link SyntasticErrorSign RedSign
highlight! link SyntasticWarningSign YellowSign
highlight! link SyntasticErrorLine ErrorLine
highlight! link SyntasticWarningLine WarningLine
" }}}
" Yggdroot/LeaderF{{{
if !exists('g:Lf_StlColorscheme')
  let g:Lf_StlColorscheme = 'one'
endif
call edge#highlight('Lf_hl_match', s:palette.green, s:palette.none, 'bold')
call edge#highlight('Lf_hl_match0', s:palette.green, s:palette.none, 'bold')
call edge#highlight('Lf_hl_match1', s:palette.blue, s:palette.none, 'bold')
call edge#highlight('Lf_hl_match2', s:palette.purple, s:palette.none, 'bold')
call edge#highlight('Lf_hl_match3', s:palette.red, s:palette.none, 'bold')
call edge#highlight('Lf_hl_match4', s:palette.yellow, s:palette.none, 'bold')
call edge#highlight('Lf_hl_matchRefine', s:palette.cyan, s:palette.none, 'bold')
call edge#highlight('Lf_hl_popup_normalMode', s:palette.bg0, s:palette.green, 'bold')
call edge#highlight('Lf_hl_popup_inputMode', s:palette.bg0, s:palette.blue, 'bold')
call edge#highlight('Lf_hl_popup_category', s:palette.fg, s:palette.bg4)
call edge#highlight('Lf_hl_popup_nameOnlyMode', s:palette.fg, s:palette.bg3)
call edge#highlight('Lf_hl_popup_fullPathMode', s:palette.fg, s:palette.bg3)
call edge#highlight('Lf_hl_popup_fuzzyMode', s:palette.fg, s:palette.bg3)
call edge#highlight('Lf_hl_popup_regexMode', s:palette.fg, s:palette.bg3)
call edge#highlight('Lf_hl_popup_lineInfo', s:palette.purple, s:palette.bg4)
call edge#highlight('Lf_hl_popup_total', s:palette.bg0, s:palette.purple)
call edge#highlight('Lf_hl_popup_cursor', s:palette.bg0, s:palette.green)
highlight! link Lf_hl_cursorline Fg
highlight! link Lf_hl_selection DiffAdd
highlight! link Lf_hl_rgHighlight Visual
highlight! link Lf_hl_gtagsHighlight Visual
highlight! link Lf_hl_popup_inputText Pmenu
highlight! link Lf_hl_popup_window Pmenu
highlight! link Lf_hl_popup_prompt Green
highlight! link Lf_hl_popup_cwd Pmenu
highlight! link Lf_hl_popup_blank Lf_hl_popup_window
highlight! link Lf_hl_popup_spin Yellow
" }}}
" liuchengxu/vim-clap {{{
call edge#highlight('ClapSelected', s:palette.red, s:palette.none, 'bold')
call edge#highlight('ClapCurrentSelection', s:palette.none, s:palette.bg0, 'bold')
call edge#highlight('ClapSpinner', s:palette.purple, s:palette.bg2, 'bold')
call edge#highlight('ClapBlines', s:palette.fg, s:palette.none)
call edge#highlight('ClapProviderId', s:palette.fg, s:palette.none, 'bold')
call edge#highlight('ClapMatches1', s:palette.red, s:palette.none, 'bold')
call edge#highlight('ClapMatches2', s:palette.yellow, s:palette.none, 'bold')
call edge#highlight('ClapMatches3', s:palette.cyan, s:palette.none, 'bold')
call edge#highlight('ClapMatches4', s:palette.blue, s:palette.none, 'bold')
call edge#highlight('ClapMatches5', s:palette.purple, s:palette.none, 'bold')
call edge#highlight('ClapFuzzyMatches', s:palette.green, s:palette.none, 'bold')
call edge#highlight('ClapNoMatchesFound', s:palette.red, s:palette.none, 'bold')
highlight! link ClapInput Pmenu
highlight! link ClapDisplay Pmenu
highlight! link ClapPreview Pmenu
highlight! link ClapFuzzyMatches1 ClapFuzzyMatches
highlight! link ClapFuzzyMatches2 ClapFuzzyMatches
highlight! link ClapFuzzyMatches3 ClapFuzzyMatches
highlight! link ClapFuzzyMatches4 ClapFuzzyMatches
highlight! link ClapFuzzyMatches5 ClapFuzzyMatches
highlight! link ClapFuzzyMatches6 ClapFuzzyMatches
highlight! link ClapFuzzyMatches7 ClapFuzzyMatches
highlight! link ClapFuzzyMatches8 ClapFuzzyMatches
highlight! link ClapFuzzyMatches9 ClapFuzzyMatches
highlight! link ClapFuzzyMatches10 ClapFuzzyMatches
highlight! link ClapFuzzyMatches11 ClapFuzzyMatches
highlight! link ClapFuzzyMatches12 ClapFuzzyMatches
highlight! link ClapBlinesLineNr Grey
highlight! link ClapProviderColon ClapBlines
highlight! link ClapProviderAbout ClapBlines
highlight! link ClapFile Fg
highlight! link ClapSearchText ClapFuzzyMatches
" }}}
" junegunn/fzf.vim {{{
let g:fzf_colors = {
      \ 'fg': ['fg', 'Normal'],
      \ 'bg': ['bg', 'Normal'],
      \ 'hl': ['fg', 'Green'],
      \ 'fg+': ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
      \ 'bg+': ['bg', 'CursorLine', 'CursorColumn'],
      \ 'hl+': ['fg', 'Green'],
      \ 'info': ['fg', 'Cyan'],
      \ 'border':  ['fg', 'Grey'],
      \ 'prompt': ['fg', 'Purple'],
      \ 'pointer': ['fg', 'Blue'],
      \ 'marker': ['fg', 'Blue'],
      \ 'spinner': ['fg', 'Yellow'],
      \ 'header': ['fg', 'Blue']
      \ }
" }}}
" Shougo/denite.nvim{{{
call edge#highlight('deniteMatchedChar', s:palette.green, s:palette.none, 'bold')
call edge#highlight('deniteMatchedRange', s:palette.green, s:palette.none, 'bold,underline')
call edge#highlight('deniteInput', s:palette.green, s:palette.bg1, 'bold')
call edge#highlight('deniteStatusLineNumber', s:palette.purple, s:palette.bg1)
call edge#highlight('deniteStatusLinePath', s:palette.fg, s:palette.bg1)
highlight! link deniteSelectedLine Green
" }}}
" kien/ctrlp.vim{{{
call edge#highlight('CtrlPMatch', s:palette.green, s:palette.none, 'bold')
call edge#highlight('CtrlPPrtBase', s:palette.grey, s:palette.none)
call edge#highlight('CtrlPLinePre', s:palette.grey, s:palette.none)
call edge#highlight('CtrlPMode1', s:palette.blue, s:palette.bg1, 'bold')
call edge#highlight('CtrlPMode2', s:palette.bg1, s:palette.blue, 'bold')
call edge#highlight('CtrlPStats', s:palette.grey, s:palette.bg1, 'bold')
highlight! link CtrlPNoEntries Red
highlight! link CtrlPPrtCursor Blue
" }}}
" airblade/vim-gitgutter {{{
highlight! link GitGutterAdd GreenSign
highlight! link GitGutterChange BlueSign
highlight! link GitGutterDelete RedSign
highlight! link GitGutterChangeDelete PurpleSign
highlight! link GitGutterAddLine DiffAdd
highlight! link GitGutterChangeLine DiffChange
highlight! link GitGutterDeleteLine DiffDelete
highlight! link GitGutterChangeDeleteLine DiffChange
highlight! link GitGutterAddLineNr Green
highlight! link GitGutterChangeLineNr Blue
highlight! link GitGutterDeleteLineNr Red
highlight! link GitGutterChangeDeleteLineNr Purple
" }}}
" mhinz/vim-signify {{{
highlight! link SignifySignAdd GreenSign
highlight! link SignifySignChange BlueSign
highlight! link SignifySignDelete RedSign
highlight! link SignifySignChangeDelete PurpleSign
highlight! link SignifyLineAdd DiffAdd
highlight! link SignifyLineChange DiffChange
highlight! link SignifyLineChangeDelete DiffChange
highlight! link SignifyLineDelete DiffDelete
" }}}
" andymass/vim-matchup {{{
call edge#highlight('MatchParenCur', s:palette.none, s:palette.none, 'bold')
call edge#highlight('MatchWord', s:palette.none, s:palette.none, 'underline')
call edge#highlight('MatchWordCur', s:palette.none, s:palette.none, 'underline')
" }}}
" easymotion/vim-easymotion {{{
highlight! link EasyMotionTarget Search
highlight! link EasyMotionShade Grey
" }}}
" justinmk/vim-sneak {{{
call edge#highlight('SneakLabelMask', s:palette.bg_purple, s:palette.bg_purple)
highlight! link Sneak Search
highlight! link SneakLabel Search
highlight! link SneakScope DiffText
" }}}
" rhysd/clever-f.vim {{{
highlight! link CleverFDefaultLabel Search
" }}}
" terryma/vim-multiple-cursors {{{
highlight! link multiple_cursors_cursor Cursor
highlight! link multiple_cursors_visual Visual
" }}}
" mg979/vim-visual-multi {{{
call edge#highlight('VMCursor', s:palette.blue, s:palette.grey_dim)
let g:VM_Mono_hl = 'VMCursor'
let g:VM_Extend_hl = 'Visual'
let g:VM_Cursor_hl = 'VMCursor'
let g:VM_Insert_hl = 'VMCursor'
" }}}
" dominikduda/vim_current_word {{{
highlight! link CurrentWordTwins CurrentWord
" }}}
" RRethy/vim-illuminate {{{
highlight! link illuminatedWord CurrentWord
highlight! link IlluminatedWordText CurrentWord
highlight! link IlluminatedWordRead CurrentWord
highlight! link IlluminatedWordWrite CurrentWord
" }}}
" itchyny/vim-cursorword {{{
highlight! link CursorWord0 CurrentWord
highlight! link CursorWord1 CurrentWord
" }}}
" Yggdroot/indentLine {{{
let g:indentLine_color_gui = s:palette.grey_dim[0]
let g:indentLine_color_term = s:palette.grey_dim[1]
" }}}
" nathanaelkane/vim-indent-guides {{{
if get(g:, 'indent_guides_auto_colors', 1) == 0
  call edge#highlight('IndentGuidesOdd', s:palette.bg0, s:palette.bg1)
  call edge#highlight('IndentGuidesEven', s:palette.bg0, s:palette.bg2)
endif
" }}}
" thiagoalessio/rainbow_levels.vim {{{
highlight! link RainbowLevel0 Red
highlight! link RainbowLevel1 Yellow
highlight! link RainbowLevel2 Green
highlight! link RainbowLevel3 Cyan
highlight! link RainbowLevel4 Blue
highlight! link RainbowLevel5 Purple
highlight! link RainbowLevel6 Green
highlight! link RainbowLevel7 Cyan
highlight! link RainbowLevel8 Blue
" }}}
" kshenoy/vim-signature {{{
highlight! link SignatureMarkText BlueSign
highlight! link SignatureMarkerText PurpleSign
" }}}
" ap/vim-buftabline {{{
highlight! link BufTabLineCurrent TabLineSel
highlight! link BufTabLineActive TabLine
highlight! link BufTabLineHidden TabLineFill
highlight! link BufTabLineFill TabLineFill
" }}}
" liuchengxu/vim-which-key {{{
highlight! link WhichKey Red
highlight! link WhichKeySeperator Green
highlight! link WhichKeyGroup Purple
highlight! link WhichKeyDesc Blue
" }}}
" junegunn/limelight.vim {{{
let g:limelight_conceal_ctermfg = s:palette.grey_dim[1]
let g:limelight_conceal_guifg = s:palette.grey_dim[0]
" }}}
" unblevable/quick-scope {{{
call edge#highlight('QuickScopePrimary', s:palette.green, s:palette.none, 'underline')
call edge#highlight('QuickScopeSecondary', s:palette.blue, s:palette.none, 'underline')
" }}}
" APZelos/blamer.nvim {{{
highlight! link Blamer Grey
" }}}
" cohama/agit.vim {{{
highlight! link agitTree Grey
highlight! link agitDate Green
highlight! link agitRemote Red
highlight! link agitHead Purple
highlight! link agitRef Blue
highlight! link agitTag Purple
highlight! link agitStatFile Blue
highlight! link agitStatRemoved Red
highlight! link agitStatAdded Green
highlight! link agitStatMessage Purple
highlight! link agitDiffRemove Red
highlight! link agitDiffAdd Green
highlight! link agitDiffHeader Purple
" }}}
" voldikss/vim-floaterm {{{
highlight! link FloatermBorder Grey
" }}}
" MattesGroeger/vim-bookmarks {{{
highlight! link BookmarkSign BlueSign
highlight! link BookmarkAnnotationSign GreenSign
highlight! link BookmarkLine DiffChange
highlight! link BookmarkAnnotationLine DiffAdd
" }}}
if has('nvim')
" hrsh7th/nvim-cmp {{{
call edge#highlight('CmpItemAbbrMatch', s:palette.blue, s:palette.none, 'bold')
call edge#highlight('CmpItemAbbrMatchFuzzy', s:palette.blue, s:palette.none, 'bold')
highlight! link CmpItemAbbr Fg
highlight! link CmpItemAbbrDeprecated Grey
highlight! link CmpItemMenu Fg
highlight! link CmpItemKind Purple
highlight! link CmpItemKindText Fg
highlight! link CmpItemKindMethod Blue
highlight! link CmpItemKindFunction Blue
highlight! link CmpItemKindConstructor Blue
highlight! link CmpItemKindField Blue
highlight! link CmpItemKindVariable Red
highlight! link CmpItemKindClass Yellow
highlight! link CmpItemKindInterface Yellow
highlight! link CmpItemKindModule Yellow
highlight! link CmpItemKindProperty Red
highlight! link CmpItemKindUnit Green
highlight! link CmpItemKindValue Green
highlight! link CmpItemKindEnum Yellow
highlight! link CmpItemKindKeyword Purple
highlight! link CmpItemKindSnippet Cyan
highlight! link CmpItemKindColor Cyan
highlight! link CmpItemKindFile Cyan
highlight! link CmpItemKindReference Cyan
highlight! link CmpItemKindFolder Cyan
highlight! link CmpItemKindEnumMember Green
highlight! link CmpItemKindConstant Red
highlight! link CmpItemKindStruct Yellow
highlight! link CmpItemKindEvent Purple
highlight! link CmpItemKindOperator Purple
highlight! link CmpItemKindTypeParameter Yellow
" }}}
" folke/trouble.nvim {{{
highlight! link TroubleText Fg
highlight! link TroubleSource Grey
highlight! link TroubleCode Grey
" }}}
" nvim-telescope/telescope.nvim {{{
call edge#highlight('TelescopeMatching', s:palette.green, s:palette.none, 'bold')
highlight! link TelescopeBorder Grey
highlight! link TelescopePromptPrefix Purple
highlight! link TelescopeSelection DiffAdd
" }}}
" lewis6991/gitsigns.nvim {{{
highlight! link GitSignsAdd GreenSign
highlight! link GitSignsChange BlueSign
highlight! link GitSignsDelete RedSign
highlight! link GitSignsAddNr Green
highlight! link GitSignsChangeNr Blue
highlight! link GitSignsDeleteNr Red
highlight! link GitSignsAddLn DiffAdd
highlight! link GitSignsChangeLn DiffChange
highlight! link GitSignsDeleteLn DiffDelete
highlight! link GitSignsCurrentLineBlame Grey
" }}}
" phaazon/hop.nvim {{{
call edge#highlight('HopNextKey', s:palette.purple, s:palette.none, 'bold')
call edge#highlight('HopNextKey1', s:palette.blue, s:palette.none, 'bold')
highlight! link HopNextKey2 Blue
highlight! link HopUnmatched Grey
" }}}
" lukas-reineke/indent-blankline.nvim {{{
call edge#highlight('IndentBlanklineContextChar', s:palette.grey, s:palette.none, 'nocombine')
call edge#highlight('IndentBlanklineChar', s:palette.grey_dim, s:palette.none, 'nocombine')
highlight! link IndentBlanklineSpaceChar IndentBlanklineChar
highlight! link IndentBlanklineSpaceCharBlankline IndentBlanklineChar
" }}}
" p00f/nvim-ts-rainbow {{{
highlight! link rainbowcol1 Red
highlight! link rainbowcol2 Yellow
highlight! link rainbowcol3 Green
highlight! link rainbowcol4 Cyan
highlight! link rainbowcol5 Blue
highlight! link rainbowcol6 Purple
highlight! link rainbowcol7 Green
" }}}
" romgrk/barbar.nvim {{{
call edge#highlight('BufferCurrent', s:palette.fg, s:palette.bg0)
call edge#highlight('BufferCurrentIndex', s:palette.fg, s:palette.bg0)
call edge#highlight('BufferCurrentMod', s:palette.blue, s:palette.bg0)
call edge#highlight('BufferCurrentSign', s:palette.purple, s:palette.bg0)
call edge#highlight('BufferCurrentTarget', s:palette.red, s:palette.bg0, 'bold')
call edge#highlight('BufferVisible', s:palette.fg, s:palette.bg_dim)
call edge#highlight('BufferVisibleIndex', s:palette.fg, s:palette.bg_dim)
call edge#highlight('BufferVisibleMod', s:palette.blue, s:palette.bg_dim)
call edge#highlight('BufferVisibleSign', s:palette.purple, s:palette.bg_dim)
call edge#highlight('BufferVisibleTarget', s:palette.yellow, s:palette.bg_dim, 'bold')
call edge#highlight('BufferInactive', s:palette.grey, s:palette.bg_dim)
call edge#highlight('BufferInactiveIndex', s:palette.grey, s:palette.bg_dim)
call edge#highlight('BufferInactiveMod', s:palette.grey, s:palette.bg_dim)
call edge#highlight('BufferInactiveSign', s:palette.grey_dim, s:palette.bg_dim)
call edge#highlight('BufferInactiveTarget', s:palette.yellow, s:palette.bg_dim, 'bold')
call edge#highlight('BufferTabpages', s:palette.grey, s:palette.bg_dim, 'bold')
call edge#highlight('BufferTabpageFill', s:palette.bg_dim, s:palette.bg_dim)
" }}}
" rcarriga/nvim-notify {{{
highlight! link NotifyERRORBorder Red
highlight! link NotifyWARNBorder Yellow
highlight! link NotifyINFOBorder Green
highlight! link NotifyDEBUGBorder Grey
highlight! link NotifyTRACEBorder Purple
highlight! link NotifyERRORIcon Red
highlight! link NotifyWARNIcon Yellow
highlight! link NotifyINFOIcon Green
highlight! link NotifyDEBUGIcon Grey
highlight! link NotifyTRACEIcon Purple
highlight! link NotifyERRORTitle Red
highlight! link NotifyWARNTitle Yellow
highlight! link NotifyINFOTitle Green
highlight! link NotifyDEBUGTitle Grey
highlight! link NotifyTRACETitle Purple
" }}}
" rcarriga/nvim-dap-ui {{{
call edge#highlight('DapUIModifiedValue', s:palette.cyan, s:palette.none, 'bold')
call edge#highlight('DapUIBreakpointsCurrentLine', s:palette.green, s:palette.none, 'bold')
highlight! link DapUIScope Cyan
highlight! link DapUIType Purple
highlight! link DapUIDecoration Cyan
highlight! link DapUIThread Green
highlight! link DapUIStoppedThread Cyan
highlight! link DapUISource Purple
highlight! link DapUILineNumber Cyan
highlight! link DapUIFloatBorder Cyan
highlight! link DapUIWatchesEmpty Red
highlight! link DapUIWatchesValue Green
highlight! link DapUIWatchesError Red
highlight! link DapUIBreakpointsPath Cyan
highlight! link DapUIBreakpointsInfo Green
" }}}
" glepnir/lspsaga.nvim {{{
call edge#highlight('LspFloatWinBorder', s:palette.bg0, s:palette.bg0)
call edge#highlight('LspSagaDiagnosticHeader', s:palette.yellow, s:palette.none, 'bold')
call edge#highlight('LspSagaCodeActionTitle', s:palette.blue, s:palette.none, 'bold')
call edge#highlight('DefinitionPreviewTitle', s:palette.purple, s:palette.none, 'bold')
highlight! link LspSagaDiagnosticError Red
highlight! link LspSagaDiagnosticWarn Yellow
highlight! link LspSagaDiagnosticInfo Blue
highlight! link LspSagaDiagnosticHint Green
highlight! link LspSagaErrorTrunCateLine LspSagaDiagnosticError
highlight! link LspSagaWarnTrunCateLine LspSagaDiagnosticWarn
highlight! link LspSagaInfoTrunCateLine LspSagaDiagnosticInfo
highlight! link LspSagaHintTrunCateLine LspSagaDiagnosticHint
highlight! link LspSagaDiagnosticSource Yellow
highlight! link LspSagaDiagnosticBorder Yellow
highlight! link LspSagaRenameBorder Blue
highlight! link LspSagaRenamePromptPrefix Purple
highlight! link LspSagaCodeActionBorder Blue
highlight! link LspSagaCodeActionTruncateLine Blue
highlight! link LspSagaCodeActionContent Green
highlight! link LspSagaHoverBorder Green
highlight! link LspSagaDocTruncateLine Green
highlight! link LspSagaSignatureHelpBorder Green
highlight! link LspSagaShTruncateLine Green
highlight! link LspSagaDefPreviewBorder Purple
highlight! link DefinitionIcon Purple
highlight! link LspLinesDiagBorder Cyan
highlight! link LineDiagTuncateLine Cyan
highlight! link LspSagaAutoPreview Blue
highlight! link LspSagaFinderSelection Fg
highlight! link DiagnosticWarning DiagnosticWarn
highlight! link DiagnosticInformation DiagnosticInfo
highlight! link ReferencesCount Grey
highlight! link DefinitionCount Grey
highlight! link TargetFileName Grey
" }}}
" b0o/incline.nvim {{{
call edge#highlight('InclineNormalNC', s:palette.grey, s:palette.bg2)
" }}}
" echasnovski/mini.nvim {{{
call edge#highlight('MiniIndentscopePrefix', s:palette.none, s:palette.none, 'nocombine')
call edge#highlight('MiniJump2dSpot', s:palette.purple, s:palette.none, 'bold,nocombine')
call edge#highlight('MiniStarterCurrent', s:palette.none, s:palette.none, 'nocombine')
call edge#highlight('MiniStatuslineDevinfo', s:palette.fg, s:palette.bg2)
call edge#highlight('MiniStatuslineFileinfo', s:palette.fg, s:palette.bg2)
call edge#highlight('MiniStatuslineFilename', s:palette.grey, s:palette.bg1)
call edge#highlight('MiniStatuslineModeInactive', s:palette.grey, s:palette.bg1)
call edge#highlight('MiniStatuslineModeCommand', s:palette.bg0, s:palette.bg_green, 'bold')
call edge#highlight('MiniStatuslineModeInsert', s:palette.bg0, s:palette.bg_blue, 'bold')
call edge#highlight('MiniStatuslineModeNormal', s:palette.bg0, s:palette.bg_purple, 'bold')
call edge#highlight('MiniStatuslineModeOther', s:palette.bg0, s:palette.cyan, 'bold')
call edge#highlight('MiniStatuslineModeReplace', s:palette.bg0, s:palette.yellow, 'bold')
call edge#highlight('MiniStatuslineModeVisual', s:palette.bg0, s:palette.bg_red, 'bold')
call edge#highlight('MiniTablineCurrent', s:palette.fg, s:palette.bg4)
call edge#highlight('MiniTablineHidden', s:palette.grey, s:palette.bg2)
call edge#highlight('MiniTablineModifiedCurrent', s:palette.blue, s:palette.bg4)
call edge#highlight('MiniTablineModifiedHidden', s:palette.grey, s:palette.bg2)
call edge#highlight('MiniTablineModifiedVisible', s:palette.blue, s:palette.bg2)
call edge#highlight('MiniTablineTabpagesection', s:palette.bg0, s:palette.blue, 'bold')
call edge#highlight('MiniTablineVisible', s:palette.fg, s:palette.bg2)
call edge#highlight('MiniTestEmphasis', s:palette.none, s:palette.none, 'bold')
call edge#highlight('MiniTestFail', s:palette.red, s:palette.none, 'bold')
call edge#highlight('MiniTestPass', s:palette.green, s:palette.none, 'bold')
call edge#highlight('MiniTrailspace', s:palette.none, s:palette.red)
highlight! link MiniStarterItemBullet Grey
highlight! link MiniStarterItemPrefix Yellow
highlight! link MiniStarterQuery Blue
highlight! link MiniCompletionActiveParameter LspSignatureActiveParameter
highlight! link MiniCursorword CurrentWord
highlight! link MiniCursorwordCurrent CurrentWord
highlight! link MiniIndentscopeSymbol Grey
highlight! link MiniJump Search
highlight! link MiniStarterFooter Red
highlight! link MiniStarterHeader Purple
highlight! link MiniStarterInactive Comment
highlight! link MiniStarterItem Normal
highlight! link MiniStarterSection Title
highlight! link MiniSurround IncSearch
highlight! link MiniTablineFill TabLineFill
" }}}
" ggandor/lightspeed.nvim {{{
call edge#highlight('LightspeedLabel', s:palette.red, s:palette.none, 'bold,underline')
call edge#highlight('LightspeedLabelDistant', s:palette.blue, s:palette.none, 'bold,underline')
call edge#highlight('LightspeedShortcut', s:palette.bg0, s:palette.red, 'bold')
call edge#highlight('LightspeedUnlabeledMatch', s:palette.fg, s:palette.none, 'bold')
call edge#highlight('LightspeedPendingOpArea', s:palette.bg0, s:palette.green)
highlight! link LightspeedMaskedChar Purple
highlight! link LightspeedGreyWash Grey
" }}}
endif
" }}}
" Extended File Types: {{{
" Whitelist: {{{ File type optimizations that will always be loaded.
" diff {{{
highlight! link diffAdded Green
highlight! link diffRemoved Red
highlight! link diffChanged Blue
highlight! link diffOldFile Green
highlight! link diffNewFile Cyan
highlight! link diffFile Yellow
highlight! link diffLine Grey
highlight! link diffIndexLine Yellow
" }}}
" }}}
" Generate the `after/syntax` directory based on the comment tags in this file.
" For example, the content between `syn_begin: sh/zsh` and `syn_end` will be placed in `after/syntax/sh/edge.vim` and `after/syntax/zsh/edge.vim`.
if edge#syn_exists(s:path) " If the syntax files exist.
  if s:configuration.better_performance
    if !edge#syn_newest(s:path, s:last_modified) " Regenerate if it's not up to date.
      call edge#syn_clean(s:path, 0)
      call edge#syn_gen(s:path, s:last_modified, 'update')
    endif
    finish
  else
    call edge#syn_clean(s:path, 1)
  endif
else
  if s:configuration.better_performance
    call edge#syn_gen(s:path, s:last_modified, 'generate')
    finish
  endif
endif
" syn_begin: vim-plug {{{
" https://github.com/junegunn/vim-plug
call edge#highlight('plug1', s:palette.purple, s:palette.none, 'bold')
call edge#highlight('plugNumber', s:palette.green, s:palette.none, 'bold')
highlight! link plug2 Cyan
highlight! link plugBracket Blue
highlight! link plugName Green
highlight! link plugDash Blue
highlight! link plugNotLoaded Grey
highlight! link plugH2 Blue
highlight! link plugMessage Blue
highlight! link plugError Red
highlight! link plugRelDate Grey
highlight! link plugStar Purple
highlight! link plugUpdate Cyan
highlight! link plugDeleted Grey
highlight! link plugEdge Purple
" syn_end }}}
" syn_begin: packer {{{
" https://github.com/wbthomason/packer.nvim
highlight! link packerSuccess Green
highlight! link packerFail Red
highlight! link packerStatusSuccess Fg
highlight! link packerStatusFail Fg
highlight! link packerWorking Blue
highlight! link packerString Yellow
highlight! link packerPackageNotLoaded Grey
highlight! link packerRelDate Grey
highlight! link packerPackageName Green
highlight! link packerOutput Purple
highlight! link packerHash Blue
highlight! link packerTimeTrivial Blue
highlight! link packerTimeHigh Red
highlight! link packerTimeMedium Yellow
highlight! link packerTimeLow Green
" syn_end }}}
" syn_begin: coctree {{{
" https://github.com/neoclide/coc.nvim
highlight! link CocTreeOpenClose Purple
highlight! link CocTreeDescription Grey
highlight! link CocSymbolFile Green
highlight! link CocSymbolModule Purple
highlight! link CocSymbolNamespace Purple
highlight! link CocSymbolPackage Purple
highlight! link CocSymbolClass Yellow
highlight! link CocSymbolMethod Blue
highlight! link CocSymbolProperty Red
highlight! link CocSymbolField Blue
highlight! link CocSymbolConstructor Blue
highlight! link CocSymbolEnum Yellow
highlight! link CocSymbolInterface Yellow
highlight! link CocSymbolFunction Green
highlight! link CocSymbolVariable Red
highlight! link CocSymbolConstant Red
highlight! link CocSymbolString Cyan
highlight! link CocSymbolNumber Cyan
highlight! link CocSymbolBoolean Cyan
highlight! link CocSymbolArray Cyan
highlight! link CocSymbolObject Cyan
highlight! link CocSymbolKey Red
highlight! link CocSymbolNull Cyan
highlight! link CocSymbolEnumMember Cyan
highlight! link CocSymbolStruct Yellow
highlight! link CocSymbolEvent Cyan
highlight! link CocSymbolOperator Cyan
highlight! link CocSymbolTypeParameter Yellow
highlight! link CocSymbolDefault Cyan
" syn_end }}}
" syn_begin: coc-explorer {{{
" https://github.com/weirongxu/coc-explorer
highlight! link CocExplorerBufferRoot Purple
highlight! link CocExplorerBufferExpandIcon Red
highlight! link CocExplorerBufferBufnr Yellow
highlight! link CocExplorerBufferModified Yellow
highlight! link CocExplorerBufferReadonly Red
highlight! link CocExplorerBufferBufname Grey
highlight! link CocExplorerBufferFullpath Grey
highlight! link CocExplorerFileRoot Purple
highlight! link CocExplorerFileRootName Green
highlight! link CocExplorerFileExpandIcon Red
highlight! link CocExplorerFileFullpath Grey
highlight! link CocExplorerFileDirectory Green
highlight! link CocExplorerFileGitStaged Purple
highlight! link CocExplorerFileGitUnstaged Yellow
highlight! link CocExplorerFileGitRootStaged Purple
highlight! link CocExplorerFileGitRootUnstaged Yellow
highlight! link CocExplorerGitPathChange Fg
highlight! link CocExplorerGitContentChange Fg
highlight! link CocExplorerGitRenamed Purple
highlight! link CocExplorerGitCopied Fg
highlight! link CocExplorerGitAdded Green
highlight! link CocExplorerGitUntracked Blue
highlight! link CocExplorerGitUnmodified Fg
highlight! link CocExplorerGitUnmerged Cyan
highlight! link CocExplorerGitMixed Cyan
highlight! link CocExplorerGitModified Yellow
highlight! link CocExplorerGitDeleted Red
highlight! link CocExplorerGitIgnored Grey
highlight! link CocExplorerFileSize Blue
highlight! link CocExplorerTimeAccessed Cyan
highlight! link CocExplorerTimeCreated Cyan
highlight! link CocExplorerTimeModified Cyan
highlight! link CocExplorerIndentLine Conceal
highlight! link CocExplorerHelpDescription Grey
highlight! link CocExplorerHelpHint Grey
highlight! link CocExplorerDiagnosticError Red
highlight! link CocExplorerDiagnosticWarning Yellow
highlight! link CocExplorerFileHidden Grey
" syn_end }}}
" syn_begin: tagbar {{{
" https://github.com/majutsushi/tagbar
highlight! link TagbarFoldIcon Blue
highlight! link TagbarSignature Green
highlight! link TagbarKind Purple
highlight! link TagbarScope Red
highlight! link TagbarNestedKind Blue
highlight! link TagbarVisibilityPrivate Red
highlight! link TagbarVisibilityPublic Blue
" syn_end }}}
" syn_begin: vista/vista_kind/vista_markdown {{{
" https://github.com/liuchengxu/vista.vim
highlight! link VistaBracket Grey
highlight! link VistaChildrenNr Yellow
highlight! link VistaScope Red
highlight! link VistaTag Green
highlight! link VistaPrefix Grey
highlight! link VistaColon Green
highlight! link VistaIcon Purple
highlight! link VistaLineNr Fg
highlight! link VistaScopeKind Green
highlight! link VistaHeadNr Fg
highlight! link VistaPublic Blue
highlight! link VistaProtected Green
highlight! link VistaPrivate Purple
" syn_end }}}
" syn_begin: Outline {{{
" https://github.com/simrat39/symbols-outline.nvim
highlight! link FocusedSymbol NormalFloat
" syn_end }}}
" syn_begin: aerial {{{
" https://github.com/stevearc/aerial.nvim
highlight! link AerialLine CursorLine
highlight! link AerialGuide LineNr
highlight! link AerialFileIcon Green
highlight! link AerialModuleIcon Purple
highlight! link AerialNamespaceIcon Purple
highlight! link AerialPackageIcon Purple
highlight! link AerialClassIcon Yellow
highlight! link AerialMethodIcon Blue
highlight! link AerialPropertyIcon Red
highlight! link AerialFieldIcon Blue
highlight! link AerialConstructorIcon Blue
highlight! link AerialEnumIcon Yellow
highlight! link AerialInterfaceIcon Yellow
highlight! link AerialFunctionIcon Green
highlight! link AerialVariableIcon Red
highlight! link AerialConstantIcon Red
highlight! link AerialStringIcon Cyan
highlight! link AerialNumberIcon Cyan
highlight! link AerialBooleanIcon Cyan
highlight! link AerialArrayIcon Cyan
highlight! link AerialObjectIcon Cyan
highlight! link AerialKeyIcon Red
highlight! link AerialNullIcon Cyan
highlight! link AerialEnumMemberIcon Cyan
highlight! link AerialStructIcon Yellow
highlight! link AerialEventIcon Cyan
highlight! link AerialOperatorIcon Cyan
highlight! link AerialTypeParameterIcon Yellow
" syn_end }}}
" syn_begin: nerdtree {{{
" https://github.com/preservim/nerdtree
highlight! link NERDTreeDir Green
highlight! link NERDTreeDirSlash Cyan
highlight! link NERDTreeOpenable Blue
highlight! link NERDTreeClosable Blue
highlight! link NERDTreeFile Fg
highlight! link NERDTreeExecFile Red
highlight! link NERDTreeUp Grey
highlight! link NERDTreeCWD Purple
highlight! link NERDTreeHelp Grey
highlight! link NERDTreeToggleOn Green
highlight! link NERDTreeToggleOff Red
highlight! link NERDTreeFlags Blue
highlight! link NERDTreeLinkFile Grey
highlight! link NERDTreeLinkTarget Green
" syn_end }}}
" syn_begin: dirvish {{{
" https://github.com/justinmk/vim-dirvish
highlight! link DirvishPathTail Blue
highlight! link DirvishArg Green
" syn_end }}}
" syn_begin: NvimTree {{{
" https://github.com/kyazdani42/nvim-tree.lua
if !s:configuration.transparent_background
  call edge#highlight('NvimTreeNormal', s:palette.fg, s:palette.bg_dim)
  call edge#highlight('NvimTreeEndOfBuffer', s:palette.bg_dim, s:palette.bg_dim)
  call edge#highlight('NvimTreeVertSplit', s:palette.bg0, s:palette.bg0)
  call edge#highlight('NvimTreeCursorLine', s:palette.none, s:palette.bg0)
endif
highlight! link NvimTreeSymlink Fg
highlight! link NvimTreeFolderName Green
highlight! link NvimTreeRootFolder Grey
highlight! link NvimTreeFolderIcon Blue
highlight! link NvimTreeEmptyFolderName Green
highlight! link NvimTreeOpenedFolderName Green
highlight! link NvimTreeExecFile Fg
highlight! link NvimTreeOpenedFile Fg
highlight! link NvimTreeSpecialFile Fg
highlight! link NvimTreeImageFile Fg
highlight! link NvimTreeMarkdownFile Fg
highlight! link NvimTreeIndentMarker Grey
highlight! link NvimTreeGitDirty Yellow
highlight! link NvimTreeGitStaged Blue
highlight! link NvimTreeGitMerge Cyan
highlight! link NvimTreeGitRenamed Purple
highlight! link NvimTreeGitNew Green
highlight! link NvimTreeGitDeleted Red
highlight! link NvimTreeLspDiagnosticsError RedSign
highlight! link NvimTreeLspDiagnosticsWarning YellowSign
highlight! link NvimTreeLspDiagnosticsInformation BlueSign
highlight! link NvimTreeLspDiagnosticsHint GreenSign
" syn_end }}}
" syn_begin: fern {{{
" https://github.com/lambdalisue/fern.vim
highlight! link FernMarkedLine Purple
highlight! link FernMarkedText Purple
highlight! link FernRootSymbol FernRootText
highlight! link FernRootText Blue
highlight! link FernLeafSymbol FernLeafText
highlight! link FernLeafText Fg
highlight! link FernBranchSymbol FernBranchText
highlight! link FernBranchText Green
highlight! link FernWindowSelectIndicator TabLineSel
highlight! link FernWindowSelectStatusLine TabLine
" syn_end }}}
" syn_begin: neo-tree {{{
" https://github.com/nvim-neo-tree/neo-tree.nvim
if !s:configuration.transparent_background
  call edge#highlight('NeoTreeNormal', s:palette.fg, s:palette.bg_dim)
  call edge#highlight('NeoTreeEndOfBuffer', s:palette.bg_dim, s:palette.bg_dim)
  call edge#highlight('NeoTreeVertSplit', s:palette.bg0, s:palette.bg0)
endif
highlight! link NeoTreeGitAdded Green
highlight! link NeoTreeGitConflict Yellow
highlight! link NeoTreeGitDeleted Red
highlight! link NeoTreeGitIgnored Grey
highlight! link NeoTreeGitModified Blue
highlight! link NeoTreeGitUnstaged Purple
highlight! link NeoTreeGitUntracked Fg
highlight! link NeoTreeGitStaged Purple
highlight! link NeoTreeDimText Grey
highlight! link NeoTreeIndentMarker NonText
highlight! link NeoTreeNormalNC NeoTreeNormal
highlight! link NeoTreeSignColumn NeoTreeNormal
highlight! link NeoTreeRootName Title
" syn_end }}}
" syn_begin: octo {{{
" https://github.com/pwntester/octo.nvim
call edge#highlight('OctoViewer', s:palette.bg0, s:palette.blue)
call edge#highlight('OctoGreenFloat', s:palette.green, s:palette.bg2)
call edge#highlight('OctoRedFloat', s:palette.red, s:palette.bg2)
call edge#highlight('OctoPurpleFloat', s:palette.purple, s:palette.bg2)
call edge#highlight('OctoYellowFloat', s:palette.yellow, s:palette.bg2)
call edge#highlight('OctoBlueFloat', s:palette.blue, s:palette.bg2)
call edge#highlight('OctoGreyFloat', s:palette.grey, s:palette.bg2)
call edge#highlight('OctoBubbleGreen', s:palette.bg0, s:palette.green)
call edge#highlight('OctoBubbleRed', s:palette.bg0, s:palette.red)
call edge#highlight('OctoBubblePurple', s:palette.bg0, s:palette.purple)
call edge#highlight('OctoBubbleYellow', s:palette.bg0, s:palette.yellow)
call edge#highlight('OctoBubbleBlue', s:palette.bg0, s:palette.blue)
call edge#highlight('OctoBubbleGrey', s:palette.bg0, s:palette.grey)
highlight! link OctoGreen Green
highlight! link OctoRed Red
highlight! link OctoPurple Purple
highlight! link OctoYellow Yellow
highlight! link OctoBlue Blue
highlight! link OctoGrey Grey
highlight! link OctoBubbleDelimiterGreen Green
highlight! link OctoBubbleDelimiterRed Red
highlight! link OctoBubbleDelimiterPurple Purple
highlight! link OctoBubbleDelimiterYellow Yellow
highlight! link OctoBubbleDelimiterBlue Blue
highlight! link OctoBubbleDelimiterGrey Grey
" syn_end }}}
" syn_begin: netrw {{{
" https://www.vim.org/scripts/script.php?script_id=1075
highlight! link netrwDir Green
highlight! link netrwClassify Green
highlight! link netrwLink Grey
highlight! link netrwSymLink Fg
highlight! link netrwExe Red
highlight! link netrwComment Grey
highlight! link netrwList Cyan
highlight! link netrwHelpCmd Blue
highlight! link netrwCmdSep Grey
highlight! link netrwVersion Purple
" syn_end }}}
" syn_begin: startify/quickmenu {{{
" https://github.com/mhinz/vim-startify
" https://github.com/skywind3000/quickmenu.vim
highlight! link StartifyBracket Grey
highlight! link StartifyFile Fg
highlight! link StartifyNumber Red
highlight! link StartifyPath Green
highlight! link StartifySlash Green
highlight! link StartifySection Blue
highlight! link StartifyHeader Purple
highlight! link StartifySpecial Grey
" syn_end }}}
" syn_begin: quickmenu {{{
" https://github.com/skywind3000/quickmenu.vim
highlight! link QuickmenuOption Green
highlight! link QuickmenuNumber Red
highlight! link QuickmenuBracket Grey
highlight! link QuickmenuHelp Blue
highlight! link QuickmenuSpecial Grey
highlight! link QuickmenuHeader Purple
" syn_end }}}
" syn_begin: undotree {{{
" https://github.com/mbbill/undotree
call edge#highlight('UndotreeSavedBig', s:palette.red, s:palette.none, 'bold')
highlight! link UndotreeNode Blue
highlight! link UndotreeNodeCurrent Purple
highlight! link UndotreeSeq Green
highlight! link UndotreeCurrent Cyan
highlight! link UndotreeNext Yellow
highlight! link UndotreeTimeStamp Grey
highlight! link UndotreeHead Purple
highlight! link UndotreeBranch Cyan
highlight! link UndotreeSavedSmall Red
" syn_end }}}
" syn_begin: NeogitStatus/NeogitCommitView {{{
" https://github.com/TimUntersberger/neogit
highlight! link NeogitNotificationInfo Blue
highlight! link NeogitNotificationWarning Yellow
highlight! link NeogitNotificationError Red
highlight! link NeogitDiffAdd Green
highlight! link NeogitDiffDelete Red
highlight! link NeogitDiffContextHighlight CursorLine
highlight! link NeogitHunkHeaderHighlight TabLine
highlight! link NeogitHunkHeader TabLineFill
highlight! link NeogitCommandCodeNormal Green
highlight! link NeogitCommandCodeError Red
highlight! link NeogitCommitViewHeader diffIndexLine
highlight! link NeogitFilePath diffFile
" syn_end }}}
" syn_begin: dashboard {{{
" https://github.com/glepnir/dashboard-nvim
highlight! link DashboardHeader Purple
highlight! link DashboardCenter Green
highlight! link DashboardShortcut Blue
highlight! link DashboardFooter Red
" syn_end }}}
" syn_begin: markdown {{{
" builtin: {{{
call edge#highlight('markdownH1', s:palette.purple, s:palette.none, 'bold')
call edge#highlight('markdownH2', s:palette.red, s:palette.none, 'bold')
call edge#highlight('markdownH3', s:palette.blue, s:palette.none, 'bold')
call edge#highlight('markdownH4', s:palette.yellow, s:palette.none, 'bold')
call edge#highlight('markdownH5', s:palette.green, s:palette.none, 'bold')
call edge#highlight('markdownH6', s:palette.cyan, s:palette.none, 'bold')
call edge#highlight('markdownUrl', s:palette.green, s:palette.none, 'underline')
call edge#highlight('markdownItalic', s:palette.none, s:palette.none, 'italic')
call edge#highlight('markdownBold', s:palette.none, s:palette.none, 'bold')
call edge#highlight('markdownItalicDelimiter', s:palette.grey, s:palette.none, 'italic')
highlight! link markdownCode Green
highlight! link markdownCodeBlock Green
highlight! link markdownCodeDelimiter Green
highlight! link markdownBlockquote Grey
highlight! link markdownListMarker Red
highlight! link markdownOrdepurpleListMarker Red
highlight! link markdownRule Yellow
highlight! link markdownHeadingRule Grey
highlight! link markdownUrlDelimiter Grey
highlight! link markdownLinkDelimiter Grey
highlight! link markdownLinkTextDelimiter Grey
highlight! link markdownHeadingDelimiter Grey
highlight! link markdownLinkText Purple
highlight! link markdownUrlTitleDelimiter Blue
highlight! link markdownIdDeclaration markdownLinkText
highlight! link markdownBoldDelimiter Grey
highlight! link markdownId Green
" }}}
" vim-markdown: https://github.com/gabrielelana/vim-markdown{{{
call edge#highlight('mkdURL', s:palette.green, s:palette.none, 'underline')
call edge#highlight('mkdInlineURL', s:palette.green, s:palette.none, 'underline')
call edge#highlight('mkdItalic', s:palette.grey, s:palette.none, 'italic')
highlight! link mkdCodeDelimiter Green
highlight! link mkdCode Green
highlight! link mkdBold Grey
highlight! link mkdLink Purple
highlight! link mkdHeading Grey
highlight! link mkdListItem Red
highlight! link mkdRule Yellow
highlight! link mkdDelimiter Grey
highlight! link mkdId Green
" }}}
" syn_end }}}
" syn_begin: vimwiki {{{
call edge#highlight('VimwikiHeader1', s:palette.purple, s:palette.none, 'bold')
call edge#highlight('VimwikiHeader2', s:palette.red, s:palette.none, 'bold')
call edge#highlight('VimwikiHeader3', s:palette.blue, s:palette.none, 'bold')
call edge#highlight('VimwikiHeader4', s:palette.yellow, s:palette.none, 'bold')
call edge#highlight('VimwikiHeader5', s:palette.green, s:palette.none, 'bold')
call edge#highlight('VimwikiHeader6', s:palette.cyan, s:palette.none, 'bold')
call edge#highlight('VimwikiLink', s:palette.blue, s:palette.none, 'underline')
call edge#highlight('VimwikiItalic', s:palette.none, s:palette.none, 'italic')
call edge#highlight('VimwikiBold', s:palette.none, s:palette.none, 'bold')
call edge#highlight('VimwikiUnderline', s:palette.none, s:palette.none, 'underline')
highlight! link VimwikiList Red
highlight! link VimwikiTag Purple
highlight! link VimwikiCode Green
highlight! link VimwikiHR Yellow
highlight! link VimwikiHeaderChar Grey
highlight! link VimwikiMarkers Grey
highlight! link VimwikiPre Green
highlight! link VimwikiPreDelim Green
highlight! link VimwikiNoExistsLink Red
" syn_end }}}
" syn_begin: rst {{{
" builtin: https://github.com/marshallward/vim-restructupurpletext{{{
call edge#highlight('rstStandaloneHyperlink', s:palette.yellow, s:palette.none, 'underline')
call edge#highlight('rstEmphasis', s:palette.none, s:palette.none, 'italic')
call edge#highlight('rstStrongEmphasis', s:palette.none, s:palette.none, 'bold')
call edge#highlight('rstStandaloneHyperlink', s:palette.red, s:palette.none, 'underline')
call edge#highlight('rstHyperlinkTarget', s:palette.red, s:palette.none, 'underline')
highlight! link rstSubstitutionReference Red
highlight! link rstInterpretedTextOrHyperlinkReference Blue
highlight! link rstTableLines Grey
highlight! link rstInlineLiteral Green
highlight! link rstLiteralBlock Green
highlight! link rstQuotedLiteralBlock Green
highlight! link rstExplicitMarkup Red
highlight! link rstDirective Red
" }}}
" syn_end }}}
" syn_begin: tex {{{
" builtin: http://www.drchip.org/astronaut/vim/index.html#SYNTAX_TEX{{{
highlight! link texStatement RedItalic
highlight! link texOnlyMath Grey
highlight! link texDefName Green
highlight! link texNewCmd Cyan
highlight! link texCmdName Red
highlight! link texBeginEnd Purple
highlight! link texBeginEndName Blue
highlight! link texDocType PurpleItalic
highlight! link texDocTypeArgs Cyan
highlight! link texInputFile Blue
" }}}
" vimtex: https://github.com/lervag/vimtex {{{
highlight! link texCmd RedItalic
highlight! link texCmdClass Purple
highlight! link texCmdTitle Purple
highlight! link texCmdAuthor Purple
highlight! link texFileArg Blue
highlight! link texCmdDef Purple
highlight! link texDefArgName Yellow
highlight! link texPartArgTitle Yellow
highlight! link texCmdEnv Purple
highlight! link texCmdPart Purple
highlight! link texEnvArgName Green
highlight! link texMathEnvArgName Green
" }}}
" syn_end }}}
" syn_begin: html/markdown/javascriptreact/typescriptreact {{{
" builtin: https://notabug.org/jorgesumle/vim-html-syntax{{{
call edge#highlight('htmlH1', s:palette.purple, s:palette.none, 'bold')
call edge#highlight('htmlH2', s:palette.red, s:palette.none, 'bold')
call edge#highlight('htmlH3', s:palette.blue, s:palette.none, 'bold')
call edge#highlight('htmlH4', s:palette.yellow, s:palette.none, 'bold')
call edge#highlight('htmlH5', s:palette.green, s:palette.none, 'bold')
call edge#highlight('htmlH6', s:palette.cyan, s:palette.none, 'bold')
call edge#highlight('htmlLink', s:palette.none, s:palette.none, 'underline')
call edge#highlight('htmlBold', s:palette.none, s:palette.none, 'bold')
call edge#highlight('htmlBoldUnderline', s:palette.none, s:palette.none, 'bold,underline')
call edge#highlight('htmlBoldItalic', s:palette.none, s:palette.none, 'bold,italic')
call edge#highlight('htmlBoldUnderlineItalic', s:palette.none, s:palette.none, 'bold,underline,italic')
call edge#highlight('htmlUnderline', s:palette.none, s:palette.none, 'underline')
call edge#highlight('htmlUnderlineItalic', s:palette.none, s:palette.none, 'underline,italic')
call edge#highlight('htmlItalic', s:palette.none, s:palette.none, 'italic')
highlight! link htmlTag Purple
highlight! link htmlEndTag Purple
highlight! link htmlTagN PurpleItalic
highlight! link htmlTagName PurpleItalic
highlight! link htmlArg Red
highlight! link htmlScriptTag Blue
highlight! link htmlSpecialTagName PurpleItalic
highlight! link htmlString Green
" }}}
" syn_end }}}
" syn_begin: xml {{{
" builtin: https://github.com/chrisbra/vim-xml-ftplugin{{{
highlight! link xmlTag Purple
highlight! link xmlEndTag Purple
highlight! link xmlTagName PurpleItalic
highlight! link xmlEqual Blue
highlight! link xmlAttrib Red
highlight! link xmlEntity Purple
highlight! link xmlEntityPunct Purple
highlight! link xmlDocTypeDecl Grey
highlight! link xmlDocTypeKeyword PurpleItalic
highlight! link xmlCdataStart Grey
highlight! link xmlCdataCdata Yellow
highlight! link xmlString Green
" }}}
" syn_end }}}
" syn_begin: css/scss/sass/less {{{
" builtin: https://github.com/JulesWang/css.vim{{{
highlight! link cssStringQ Green
highlight! link cssStringQQ Green
highlight! link cssAttrComma Grey
highlight! link cssBraces Grey
highlight! link cssTagName Yellow
highlight! link cssClassNameDot Grey
highlight! link cssClassName Purple
highlight! link cssFunctionName Cyan
highlight! link cssAttr Blue
highlight! link cssCommonAttr Blue
highlight! link cssProp Red
highlight! link cssPseudoClassId Blue
highlight! link cssPseudoClassFn Cyan
highlight! link cssPseudoClass Blue
highlight! link cssImportant Purple
highlight! link cssSelectorOp Cyan
highlight! link cssSelectorOp2 Cyan
highlight! link cssColor Green
highlight! link cssUnitDecorators Green
highlight! link cssValueLength Green
highlight! link cssValueInteger Green
highlight! link cssValueNumber Green
highlight! link cssValueAngle Green
highlight! link cssValueTime Green
highlight! link cssValueFrequency Green
highlight! link cssVendor Grey
highlight! link cssNoise Grey
" }}}
" syn_end }}}
" syn_begin: scss {{{
" scss-syntax: https://github.com/cakebaker/scss-syntax.vim{{{
highlight! link scssMixinName Cyan
highlight! link scssSelectorChar Grey
highlight! link scssSelectorName Purple
highlight! link scssInterpolationDelimiter Blue
highlight! link scssVariableValue Green
highlight! link scssNull Yellow
highlight! link scssBoolean Yellow
highlight! link scssVariableAssignment Grey
highlight! link scssAttribute Blue
highlight! link scssFunctionName Cyan
highlight! link scssVariable Fg
highlight! link scssAmpersand Yellow
" }}}
" syn_end }}}
" syn_begin: less {{{
" vim-less: https://github.com/groenewege/vim-less{{{
highlight! link lessMixinChar Grey
highlight! link lessClass Purple
highlight! link lessFunction Cyan
" }}}
" syn_end }}}
" syn_begin: javascript/javascriptreact {{{
" builtin: http://www.fleiner.com/vim/syntax/javascript.vim{{{
highlight! link javaScriptNull YellowItalic
highlight! link javaScriptIdentifier RedItalic
highlight! link javaScriptParens Fg
highlight! link javaScriptBraces Fg
highlight! link javaScriptNumber Yellow
highlight! link javaScriptLabel Purple
highlight! link javaScriptGlobal RedItalic
highlight! link javaScriptMessage RedItalic
" }}}
" vim-javascript: https://github.com/pangloss/vim-javascript{{{
highlight! link jsNoise Fg
highlight! link Noise Fg
highlight! link jsParens Fg
highlight! link jsBrackets Fg
highlight! link jsObjectBraces Fg
highlight! link jsThis YellowItalic
highlight! link jsUndefined YellowItalic
highlight! link jsNull YellowItalic
highlight! link jsNan YellowItalic
highlight! link jsSuper YellowItalic
highlight! link jsPrototype CyanItalic
highlight! link jsFunction Purple
highlight! link jsGlobalNodeObjects RedItalic
highlight! link jsGlobalObjects RedItalic
highlight! link jsArrowFunction Purple
highlight! link jsArrowFuncArgs Fg
highlight! link jsFuncArgs Fg
highlight! link jsObjectProp Fg
highlight! link jsVariableDef Fg
highlight! link jsObjectKey Fg
highlight! link jsParen Fg
highlight! link jsParenIfElse Fg
highlight! link jsParenRepeat Fg
highlight! link jsParenSwitch Fg
highlight! link jsParenCatch Fg
highlight! link jsBracket Fg
highlight! link jsObjectValue Fg
highlight! link jsDestructuringBlock Fg
highlight! link jsBlockLabel Yellow
highlight! link jsFunctionKey Blue
highlight! link jsClassDefinition RedItalic
highlight! link jsDot Grey
highlight! link jsSpreadExpression Yellow
highlight! link jsSpreadOperator Blue
highlight! link jsModuleKeyword RedItalic
highlight! link jsTemplateExpression Yellow
highlight! link jsTemplateBraces Yellow
highlight! link jsClassMethodType RedItalic
highlight! link jsExceptions RedItalic
highlight! link jsLabel Purple
" }}}
" yajs: https://github.com/othree/yajs.vim{{{
highlight! link javascriptOpSymbol Purple
highlight! link javascriptOpSymbols Purple
highlight! link javascriptIdentifierName Fg
highlight! link javascriptVariable RedItalic
highlight! link javascriptObjectLabel Fg
highlight! link javascriptPropertyNameString Fg
highlight! link javascriptFuncArg Fg
highlight! link javascriptObjectLiteral Blue
highlight! link javascriptIdentifier CyanItalic
highlight! link javascriptArrowFunc Purple
highlight! link javascriptTemplate Yellow
highlight! link javascriptTemplateSubstitution Yellow
highlight! link javascriptTemplateSB Yellow
highlight! link javascriptNodeGlobal RedItalic
highlight! link javascriptDocTags PurpleItalic
highlight! link javascriptDocNotation Red
highlight! link javascriptClassSuper YellowItalic
highlight! link javascriptClassName RedItalic
highlight! link javascriptClassSuperName RedItalic
highlight! link javascriptOperator Purple
highlight! link javascriptBrackets Fg
highlight! link javascriptBraces Fg
highlight! link javascriptLabel Yellow
highlight! link javascriptEndColons Grey
highlight! link javascriptObjectLabelColon Grey
highlight! link javascriptDotNotation Grey
highlight! link javascriptGlobalArrayDot Grey
highlight! link javascriptGlobalBigIntDot Grey
highlight! link javascriptGlobalDateDot Grey
highlight! link javascriptGlobalJSONDot Grey
highlight! link javascriptGlobalMathDot Grey
highlight! link javascriptGlobalNumberDot Grey
highlight! link javascriptGlobalObjectDot Grey
highlight! link javascriptGlobalPromiseDot Grey
highlight! link javascriptGlobalRegExpDot Grey
highlight! link javascriptGlobalStringDot Grey
highlight! link javascriptGlobalSymbolDot Grey
highlight! link javascriptGlobalURLDot Grey
highlight! link javascriptMethod Blue
highlight! link javascriptMethodName Blue
highlight! link javascriptObjectMethodName Blue
highlight! link javascriptGlobalMethod Blue
highlight! link javascriptDOMStorageMethod Blue
highlight! link javascriptFileMethod Blue
highlight! link javascriptFileReaderMethod Blue
highlight! link javascriptFileListMethod Blue
highlight! link javascriptBlobMethod Blue
highlight! link javascriptURLStaticMethod Blue
highlight! link javascriptNumberStaticMethod Blue
highlight! link javascriptNumberMethod Blue
highlight! link javascriptDOMNodeMethod Blue
highlight! link javascriptES6BigIntStaticMethod Blue
highlight! link javascriptBOMWindowMethod Blue
highlight! link javascriptHeadersMethod Blue
highlight! link javascriptRequestMethod Blue
highlight! link javascriptResponseMethod Blue
highlight! link javascriptES6SetMethod Blue
highlight! link javascriptReflectMethod Blue
highlight! link javascriptPaymentMethod Blue
highlight! link javascriptPaymentResponseMethod Blue
highlight! link javascriptTypedArrayStaticMethod Blue
highlight! link javascriptGeolocationMethod Blue
highlight! link javascriptES6MapMethod Blue
highlight! link javascriptServiceWorkerMethod Blue
highlight! link javascriptCacheMethod Blue
highlight! link javascriptFunctionMethod Blue
highlight! link javascriptXHRMethod Blue
highlight! link javascriptBOMNavigatorMethod Blue
highlight! link javascriptServiceWorkerMethod Blue
highlight! link javascriptDOMEventTargetMethod Blue
highlight! link javascriptDOMEventMethod Blue
highlight! link javascriptIntlMethod Blue
highlight! link javascriptDOMDocMethod Blue
highlight! link javascriptStringStaticMethod Blue
highlight! link javascriptStringMethod Blue
highlight! link javascriptSymbolStaticMethod Blue
highlight! link javascriptRegExpMethod Blue
highlight! link javascriptObjectStaticMethod Blue
highlight! link javascriptObjectMethod Blue
highlight! link javascriptBOMLocationMethod Blue
highlight! link javascriptJSONStaticMethod Blue
highlight! link javascriptGeneratorMethod Blue
highlight! link javascriptEncodingMethod Blue
highlight! link javascriptPromiseStaticMethod Blue
highlight! link javascriptPromiseMethod Blue
highlight! link javascriptBOMHistoryMethod Blue
highlight! link javascriptDOMFormMethod Blue
highlight! link javascriptClipboardMethod Blue
highlight! link javascriptTypedArrayStaticMethod Blue
highlight! link javascriptBroadcastMethod Blue
highlight! link javascriptDateStaticMethod Blue
highlight! link javascriptDateMethod Blue
highlight! link javascriptConsoleMethod Blue
highlight! link javascriptArrayStaticMethod Blue
highlight! link javascriptArrayMethod Blue
highlight! link javascriptMathStaticMethod Blue
highlight! link javascriptSubtleCryptoMethod Blue
highlight! link javascriptCryptoMethod Blue
highlight! link javascriptProp Fg
highlight! link javascriptBOMWindowProp Fg
highlight! link javascriptDOMStorageProp Fg
highlight! link javascriptFileReaderProp Fg
highlight! link javascriptURLUtilsProp Fg
highlight! link javascriptNumberStaticProp Fg
highlight! link javascriptDOMNodeProp Fg
highlight! link javascriptRequestProp Fg
highlight! link javascriptResponseProp Fg
highlight! link javascriptES6SetProp Fg
highlight! link javascriptPaymentProp Fg
highlight! link javascriptPaymentResponseProp Fg
highlight! link javascriptPaymentAddressProp Fg
highlight! link javascriptPaymentShippingOptionProp Fg
highlight! link javascriptTypedArrayStaticProp Fg
highlight! link javascriptServiceWorkerProp Fg
highlight! link javascriptES6MapProp Fg
highlight! link javascriptRegExpStaticProp Fg
highlight! link javascriptRegExpProp Fg
highlight! link javascriptXHRProp Fg
highlight! link javascriptBOMNavigatorProp Blue
highlight! link javascriptDOMEventProp Fg
highlight! link javascriptBOMNetworkProp Fg
highlight! link javascriptDOMDocProp Fg
highlight! link javascriptSymbolStaticProp Fg
highlight! link javascriptSymbolProp Fg
highlight! link javascriptBOMLocationProp Fg
highlight! link javascriptEncodingProp Fg
highlight! link javascriptCryptoProp Fg
highlight! link javascriptBOMHistoryProp Fg
highlight! link javascriptDOMFormProp Fg
highlight! link javascriptDataViewProp Fg
highlight! link javascriptBroadcastProp Fg
highlight! link javascriptMathStaticProp Fg
" }}}
" vim-jsx-pretty: https://github.com/maxmellon/vim-jsx-pretty{{{
highlight! link jsxTagName PurpleItalic
highlight! link jsxOpenPunct Blue
highlight! link jsxClosePunct Red
highlight! link jsxEscapeJs Yellow
highlight! link jsxAttrib Red
" }}}
" syn_end }}}
" syn_begin: typescript/typescriptreact {{{
" vim-typescript: https://github.com/leafgarland/typescript-vim{{{
highlight! link typescriptStorageClass Purple
highlight! link typescriptEndColons Fg
highlight! link typescriptSource RedItalic
highlight! link typescriptMessage Blue
highlight! link typescriptGlobalObjects RedItalic
highlight! link typescriptInterpolation Yellow
highlight! link typescriptInterpolationDelimiter Yellow
highlight! link typescriptBraces Fg
highlight! link typescriptParens Fg
" }}}
" yats: https:github.com/HerringtonDarkholme/yats.vim{{{
highlight! link typescriptMethodAccessor Purple
highlight! link typescriptVariable Purple
highlight! link typescriptVariableDeclaration Fg
highlight! link typescriptTypeReference RedItalic
highlight! link typescriptBraces Fg
highlight! link typescriptEnumKeyword Purple
highlight! link typescriptEnum RedItalic
highlight! link typescriptIdentifierName Fg
highlight! link typescriptProp Fg
highlight! link typescriptCall Fg
highlight! link typescriptInterfaceName RedItalic
highlight! link typescriptEndColons Fg
highlight! link typescriptMember Fg
highlight! link typescriptMemberOptionality Purple
highlight! link typescriptObjectLabel Fg
highlight! link typescriptDefaultParam Fg
highlight! link typescriptArrowFunc Purple
highlight! link typescriptAbstract Purple
highlight! link typescriptObjectColon Grey
highlight! link typescriptTypeAnnotation Grey
highlight! link typescriptAssign Purple
highlight! link typescriptBinaryOp Purple
highlight! link typescriptUnaryOp Purple
highlight! link typescriptFuncComma Fg
highlight! link typescriptClassName RedItalic
highlight! link typescriptClassHeritage RedItalic
highlight! link typescriptInterfaceHeritage RedItalic
highlight! link typescriptIdentifier YellowItalic
highlight! link typescriptTry Purple
highlight! link typescriptGlobal RedItalic
highlight! link typescriptOperator Purple
highlight! link typescriptNodeGlobal RedItalic
highlight! link typescriptExport Purple
highlight! link typescriptImport Purple
highlight! link typescriptTypeParameter RedItalic
highlight! link typescriptReadonlyModifier Purple
highlight! link typescriptAccessibilityModifier Purple
highlight! link typescriptAmbientDeclaration Purple
highlight! link typescriptTemplateSubstitution Yellow
highlight! link typescriptTemplateSB Yellow
highlight! link typescriptExceptions Purple
highlight! link typescriptCastKeyword Purple
highlight! link typescriptOptionalMark Purple
highlight! link typescriptNull YellowItalic
highlight! link typescriptMappedIn Purple
highlight! link typescriptFuncTypeArrow Purple
highlight! link typescriptTernaryOp Purple
highlight! link typescriptParenExp Fg
highlight! link typescriptIndexExpr Fg
highlight! link typescriptDotNotation Grey
highlight! link typescriptGlobalNumberDot Grey
highlight! link typescriptGlobalStringDot Grey
highlight! link typescriptGlobalArrayDot Grey
highlight! link typescriptGlobalObjectDot Grey
highlight! link typescriptGlobalSymbolDot Grey
highlight! link typescriptGlobalMathDot Grey
highlight! link typescriptGlobalDateDot Grey
highlight! link typescriptGlobalJSONDot Grey
highlight! link typescriptGlobalRegExpDot Grey
highlight! link typescriptGlobalPromiseDot Grey
highlight! link typescriptGlobalURLDot Grey
highlight! link typescriptGlobalMethod Blue
highlight! link typescriptDOMStorageMethod Blue
highlight! link typescriptFileMethod Blue
highlight! link typescriptFileReaderMethod Blue
highlight! link typescriptFileListMethod Blue
highlight! link typescriptBlobMethod Blue
highlight! link typescriptURLStaticMethod Blue
highlight! link typescriptNumberStaticMethod Blue
highlight! link typescriptNumberMethod Blue
highlight! link typescriptDOMNodeMethod Blue
highlight! link typescriptPaymentMethod Blue
highlight! link typescriptPaymentResponseMethod Blue
highlight! link typescriptHeadersMethod Blue
highlight! link typescriptRequestMethod Blue
highlight! link typescriptResponseMethod Blue
highlight! link typescriptES6SetMethod Blue
highlight! link typescriptReflectMethod Blue
highlight! link typescriptBOMWindowMethod Blue
highlight! link typescriptGeolocationMethod Blue
highlight! link typescriptServiceWorkerMethod Blue
highlight! link typescriptCacheMethod Blue
highlight! link typescriptES6MapMethod Blue
highlight! link typescriptFunctionMethod Blue
highlight! link typescriptRegExpMethod Blue
highlight! link typescriptXHRMethod Blue
highlight! link typescriptBOMNavigatorMethod Blue
highlight! link typescriptServiceWorkerMethod Blue
highlight! link typescriptIntlMethod Blue
highlight! link typescriptDOMEventTargetMethod Blue
highlight! link typescriptDOMEventMethod Blue
highlight! link typescriptDOMDocMethod Blue
highlight! link typescriptStringStaticMethod Blue
highlight! link typescriptStringMethod Blue
highlight! link typescriptSymbolStaticMethod Blue
highlight! link typescriptObjectStaticMethod Blue
highlight! link typescriptObjectMethod Blue
highlight! link typescriptJSONStaticMethod Blue
highlight! link typescriptEncodingMethod Blue
highlight! link typescriptBOMLocationMethod Blue
highlight! link typescriptPromiseStaticMethod Blue
highlight! link typescriptPromiseMethod Blue
highlight! link typescriptSubtleCryptoMethod Blue
highlight! link typescriptCryptoMethod Blue
highlight! link typescriptBOMHistoryMethod Blue
highlight! link typescriptDOMFormMethod Blue
highlight! link typescriptConsoleMethod Blue
highlight! link typescriptDateStaticMethod Blue
highlight! link typescriptDateMethod Blue
highlight! link typescriptArrayStaticMethod Blue
highlight! link typescriptArrayMethod Blue
highlight! link typescriptMathStaticMethod Blue
highlight! link typescriptStringProperty Fg
highlight! link typescriptDOMStorageProp Fg
highlight! link typescriptFileReaderProp Fg
highlight! link typescriptURLUtilsProp Fg
highlight! link typescriptNumberStaticProp Fg
highlight! link typescriptDOMNodeProp Fg
highlight! link typescriptBOMWindowProp Fg
highlight! link typescriptRequestProp Fg
highlight! link typescriptResponseProp Fg
highlight! link typescriptPaymentProp Fg
highlight! link typescriptPaymentResponseProp Fg
highlight! link typescriptPaymentAddressProp Fg
highlight! link typescriptPaymentShippingOptionProp Fg
highlight! link typescriptES6SetProp Fg
highlight! link typescriptServiceWorkerProp Fg
highlight! link typescriptES6MapProp Fg
highlight! link typescriptRegExpStaticProp Fg
highlight! link typescriptRegExpProp Fg
highlight! link typescriptBOMNavigatorProp Blue
highlight! link typescriptXHRProp Fg
highlight! link typescriptDOMEventProp Fg
highlight! link typescriptDOMDocProp Fg
highlight! link typescriptBOMNetworkProp Fg
highlight! link typescriptSymbolStaticProp Fg
highlight! link typescriptEncodingProp Fg
highlight! link typescriptBOMLocationProp Fg
highlight! link typescriptCryptoProp Fg
highlight! link typescriptDOMFormProp Fg
highlight! link typescriptBOMHistoryProp Fg
highlight! link typescriptMathStaticProp Fg
" }}}
" syn_end }}}
" syn_begin: dart {{{
" dart-lang: https://github.com/dart-lang/dart-vim-plugin{{{
highlight! link dartCoreClasses RedItalic
highlight! link dartTypeName RedItalic
highlight! link dartInterpolation Yellow
highlight! link dartTypeDef Purple
highlight! link dartClassDecl Purple
highlight! link dartLibrary Purple
highlight! link dartMetadata CyanItalic
" }}}
" syn_end }}}
" syn_begin: c/cpp/objc/objcpp {{{
" vim-cpp-enhanced-highlight: https://github.com/octol/vim-cpp-enhanced-highlight{{{
highlight! link cLabel Purple
highlight! link cDefine Purple
highlight! link cppSTLnamespace RedItalic
highlight! link cppSTLtype RedItalic
highlight! link cppAccess Purple
highlight! link cppStructure Purple
highlight! link cppSTLios RedItalic
highlight! link cppSTLiterator RedItalic
highlight! link cppSTLexception Purple
" }}}
" vim-cpp-modern: https://github.com/bfrg/vim-cpp-modern{{{
highlight! link cppSTLVariable RedItalic
" }}}
" chromatica: https://github.com/arakashic/chromatica.nvim{{{
highlight! link Member TSVariable
highlight! link Variable TSVariable
highlight! link Namespace TSNamespace
highlight! link EnumConstant TSNumber
highlight! link chromaticaException TSException
highlight! link chromaticaCast TSLabel
highlight! link OperatorOverload TSOperator
highlight! link AccessQual TSOperator
highlight! link Linkage TSOperator
highlight! link AutoType TSType
" }}}
" vim-lsp-cxx-highlight https://github.com/jackguo380/vim-lsp-cxx-highlight{{{
highlight! link LspCxxHlSkippedRegion Grey
highlight! link LspCxxHlSkippedRegionBeginEnd TSKeyword
highlight! link LspCxxHlGroupEnumConstant CyanItalic
highlight! link LspCxxHlGroupNamespace TSNamespace
highlight! link LspCxxHlGroupMemberVariable TSVariable
" }}}
" syn_end }}}
" syn_begin: objc {{{
" builtin: {{{
highlight! link objcModuleImport Purple
highlight! link objcException Purple
highlight! link objcProtocolList Fg
highlight! link objcDirective Purple
highlight! link objcPropertyAttribute Yellow
highlight! link objcHiddenArgument Fg
" }}}
" syn_end }}}
" syn_begin: cs {{{
" builtin: https://github.com/nickspoons/vim-cs{{{
highlight! link csUnspecifiedStatement Purple
highlight! link csStorage Purple
highlight! link csClass Purple
highlight! link csNewType RedItalic
highlight! link csContextualStatement Purple
highlight! link csInterpolationDelimiter Yellow
highlight! link csInterpolation Yellow
highlight! link csEndColon Fg
" }}}
" syn_end }}}
" syn_begin: python {{{
" builtin: {{{
highlight! link pythonBuiltin RedItalic
highlight! link pythonExceptions Purple
highlight! link pythonDecoratorName CyanItalic
" }}}
" python-syntax: https://github.com/vim-python/python-syntax{{{
highlight! link pythonExClass RedItalic
highlight! link pythonBuiltinType Yellow
highlight! link pythonBuiltinObj Yellow
highlight! link pythonDottedName CyanItalic
highlight! link pythonBuiltinFunc Blue
highlight! link pythonFunction Blue
highlight! link pythonDecorator CyanItalic
highlight! link pythonInclude Include
highlight! link pythonImport PreProc
highlight! link pythonOperator Purple
highlight! link pythonConditional Purple
highlight! link pythonRepeat Purple
highlight! link pythonException Purple
highlight! link pythonNone Yellow
highlight! link pythonClassVar RedItalic
highlight! link pythonCoding Grey
highlight! link pythonDot Grey
" }}}
" semshi: https://github.com/numirias/semshi{{{
call edge#highlight('semshiUnresolved', s:palette.cyan, s:palette.none, 'undercurl')
highlight! link semshiImported TSInclude
highlight! link semshiParameter TSParameter
highlight! link semshiParameterUnused Grey
highlight! link semshiSelf TSVariableBuiltin
highlight! link semshiGlobal TSType
highlight! link semshiBuiltin TSTypeBuiltin
highlight! link semshiAttribute TSAttribute
highlight! link semshiLocal TSKeyword
highlight! link semshiFree TSKeyword
highlight! link semshiSelected CurrentWord
highlight! link semshiErrorSign RedSign
highlight! link semshiErrorChar RedSign
" }}}
" syn_end }}}
" syn_begin: lua {{{
" builtin: {{{
highlight! link luaFunc Blue
highlight! link luaFunction Purple
highlight! link luaTable Fg
highlight! link luaIn Purple
" }}}
" vim-lua: https://github.com/tbastos/vim-lua{{{
highlight! link luaFuncCall Blue
highlight! link luaLocal Purple
highlight! link luaSpecialValue Blue
highlight! link luaBraces Fg
highlight! link luaBuiltIn RedItalic
highlight! link luaNoise Grey
highlight! link luaLabel Yellow
highlight! link luaFuncTable RedItalic
highlight! link luaFuncArgName Fg
highlight! link luaEllipsis Purple
highlight! link luaDocTag Blue
" }}}
" syn_end }}}
" syn_begin: java {{{
" builtin: {{{
highlight! link javaClassDecl Purple
highlight! link javaMethodDecl Purple
highlight! link javaVarArg Fg
highlight! link javaAnnotation Yellow
highlight! link javaUserLabel Yellow
highlight! link javaTypedef CyanItalic
highlight! link javaParen Fg
highlight! link javaParen1 Fg
highlight! link javaParen2 Fg
highlight! link javaParen3 Fg
highlight! link javaParen4 Fg
highlight! link javaParen5 Fg
" }}}
" syn_end }}}
" syn_begin: kotlin {{{
" kotlin-vim: https://github.com/udalov/kotlin-vim{{{
highlight! link ktSimpleInterpolation Yellow
highlight! link ktComplexInterpolation Yellow
highlight! link ktComplexInterpolationBrace Yellow
highlight! link ktStructure Purple
highlight! link ktKeyword CyanItalic
" }}}
" syn_end }}}
" syn_begin: scala {{{
" builtin: https://github.com/derekwyatt/vim-scala{{{
highlight! link scalaNameDefinition Fg
highlight! link scalaInterpolationBoundary Yellow
highlight! link scalaInterpolation Yellow
highlight! link scalaTypeOperator Purple
highlight! link scalaOperator Purple
highlight! link scalaKeywordModifier Purple
" }}}
" syn_end }}}
" syn_begin: go {{{
" builtin: https://github.com/google/vim-ft-go{{{
highlight! link goDirective Purple
highlight! link goConstants YellowItalic
highlight! link goDeclType Purple
" }}}
" polyglot: {{{
highlight! link goPackage Purple
highlight! link goImport Purple
highlight! link goBuiltins Blue
highlight! link goPpurpleefinedIdentifiers CyanItalic
highlight! link goPredefinedIdentifiers Yellow
highlight! link goVar Purple
" }}}
" syn_end }}}
" syn_begin: rust {{{
" builtin: https://github.com/rust-lang/rust.vim{{{
highlight! link rustStructure Purple
highlight! link rustIdentifier CyanItalic
highlight! link rustModPath RedItalic
highlight! link rustModPathSep Grey
highlight! link rustSelf YellowItalic
highlight! link rustSuper YellowItalic
highlight! link rustDeriveTrait Yellow
highlight! link rustEnumVariant Yellow
highlight! link rustMacroVariable CyanItalic
highlight! link rustAssert Blue
highlight! link rustPanic Blue
highlight! link rustPubScopeCrate RedItalic
highlight! link rustAttribute Purple
" }}}
" coc-rust-analyzer: https://github.com/fannheyward/coc-rust-analyzer {{{
highlight! link CocRustChainingHint Grey
highlight! link CocRustTypeHint Grey
" }}}
" syn_end }}}
" syn_begin: swift {{{
" swift.vim: https://github.com/keith/swift.vim{{{
highlight! link swiftInterpolatedWrapper Yellow
highlight! link swiftInterpolatedString Yellow
highlight! link swiftProperty Fg
highlight! link swiftTypeDeclaration Purple
highlight! link swiftClosureArgument CyanItalic
highlight! link swiftStructure Purple
" }}}
" syn_end }}}
" syn_begin: php {{{
" builtin: https://jasonwoof.com/gitweb/?p=vim-syntax.git;a=blob;f=php.vim;hb=HEAD{{{
highlight! link phpVarSelector Fg
highlight! link phpIdentifier Fg
highlight! link phpDefine Blue
highlight! link phpStructure Purple
highlight! link phpSpecialFunction Blue
highlight! link phpInterpSimpleCurly Yellow
highlight! link phpComparison Purple
highlight! link phpMethodsVar Fg
highlight! link phpInterpVarname Fg
highlight! link phpMemberSelector Purple
highlight! link phpLabel Purple
" }}}
" php.vim: https://github.com/StanAngeloff/php.vim{{{
highlight! link phpParent Fg
highlight! link phpNowDoc Green
highlight! link phpFunction Blue
highlight! link phpMethod Blue
highlight! link phpClass RedItalic
highlight! link phpSuperglobals RedItalic
highlight! link phpNullValue YellowItalic
" }}}
" syn_end }}}
" syn_begin: ruby {{{
" builtin: https://github.com/vim-ruby/vim-ruby{{{
highlight! link rubyKeywordAsMethod Blue
highlight! link rubyInterpolation Yellow
highlight! link rubyInterpolationDelimiter Yellow
highlight! link rubyStringDelimiter Green
highlight! link rubyBlockParameterList Fg
highlight! link rubyDefine Purple
highlight! link rubyModuleName Purple
highlight! link rubyAccess Purple
highlight! link rubyMacro Purple
highlight! link rubySymbol Fg
" }}}
" syn_end }}}
" syn_begin: haskell {{{
" haskell-vim: https://github.com/neovimhaskell/haskell-vim{{{
highlight! link haskellBrackets Fg
highlight! link haskellIdentifier Yellow
highlight! link haskellDecl Purple
highlight! link haskellType RedItalic
highlight! link haskellDeclKeyword Purple
highlight! link haskellWhere Purple
highlight! link haskellDeriving Purple
highlight! link haskellForeignKeywords Purple
" }}}
" syn_end }}}
" syn_begin: perl/pod {{{
" builtin: https://github.com/vim-perl/vim-perl{{{
highlight! link perlStatementPackage Purple
highlight! link perlStatementInclude Purple
highlight! link perlStatementStorage Purple
highlight! link perlStatementList Purple
highlight! link perlMatchStartEnd Purple
highlight! link perlVarSimpleMemberName Blue
highlight! link perlVarSimpleMember Fg
highlight! link perlMethod Blue
highlight! link podVerbatimLine Blue
highlight! link podCmdText Green
highlight! link perlVarPlain Fg
highlight! link perlVarPlain2 Fg
" }}}
" syn_end }}}
" syn_begin: ocaml {{{
" builtin: https://github.com/rgrinberg/vim-ocaml{{{
highlight! link ocamlArrow Purple
highlight! link ocamlEqual Purple
highlight! link ocamlOperator Purple
highlight! link ocamlKeyChar Purple
highlight! link ocamlModPath Blue
highlight! link ocamlFullMod Blue
highlight! link ocamlModule RedItalic
highlight! link ocamlConstructor Cyan
highlight! link ocamlModParam Fg
highlight! link ocamlModParam1 Fg
highlight! link ocamlAnyVar Fg " aqua
highlight! link ocamlPpxEncl Purple
highlight! link ocamlPpxIdentifier Fg
highlight! link ocamlSigEncl Purple
highlight! link ocamlModParam1 Fg
" }}}
" syn_end }}}
" syn_begin: erlang {{{
" builtin: https://github.com/vim-erlang/vim-erlang-runtime{{{
highlight! link erlangAtom Fg
highlight! link erlangVariable Fg
highlight! link erlangLocalFuncRef Blue
highlight! link erlangLocalFuncCall Blue
highlight! link erlangGlobalFuncRef Blue
highlight! link erlangGlobalFuncCall Blue
highlight! link erlangAttribute RedItalic
highlight! link erlangPipe Purple
" }}}
" syn_end }}}
" syn_begin: elixir {{{
" vim-elixir: https://github.com/elixir-editors/vim-elixir{{{
highlight! link elixirStringDelimiter Green
highlight! link elixirKeyword Purple
highlight! link elixirInterpolation Yellow
highlight! link elixirInterpolationDelimiter Yellow
highlight! link elixirSelf RedItalic
highlight! link elixirPseudoVariable CyanItalic
highlight! link elixirModuleDefine Purple
highlight! link elixirBlockDefinition Purple
highlight! link elixirDefine Purple
highlight! link elixirPrivateDefine Purple
highlight! link elixirGuard Purple
highlight! link elixirPrivateGuard Purple
highlight! link elixirProtocolDefine Purple
highlight! link elixirImplDefine Purple
highlight! link elixirRecordDefine Purple
highlight! link elixirPrivateRecordDefine Purple
highlight! link elixirMacroDefine Purple
highlight! link elixirPrivateMacroDefine Purple
highlight! link elixirDelegateDefine Purple
highlight! link elixirOverridableDefine Purple
highlight! link elixirExceptionDefine Purple
highlight! link elixirCallbackDefine Purple
highlight! link elixirStructDefine Purple
highlight! link elixirExUnitMacro Purple
" }}}
" syn_end }}}
" syn_begin: lisp {{{
" builtin: http://www.drchip.org/astronaut/vim/index.html#SYNTAX_LISP{{{
highlight! link lispAtomMark Yellow
highlight! link lispKey Cyan
highlight! link lispFunc Blue
" }}}
" syn_end }}}
" syn_begin: clojure {{{
" builtin: https://github.com/guns/vim-clojure-static{{{
highlight! link clojureMacro Purple
highlight! link clojureFunc Blue
highlight! link clojureConstant YellowItalic
highlight! link clojureSpecial Purple
highlight! link clojureDefine Purple
highlight! link clojureKeyword Red
highlight! link clojureVariable Fg
highlight! link clojureMeta Yellow
highlight! link clojureDeref Yellow
" }}}
" syn_end }}}
" syn_begin: matlab {{{
" builtin: {{{
highlight! link matlabSemicolon Fg
highlight! link matlabFunction PurpleItalic
highlight! link matlabImplicit Blue
highlight! link matlabDelimiter Fg
highlight! link matlabOperator Blue
highlight! link matlabArithmeticOperator Purple
highlight! link matlabArithmeticOperator Purple
highlight! link matlabRelationalOperator Purple
highlight! link matlabRelationalOperator Purple
highlight! link matlabLogicalOperator Purple
" }}}
" syn_end }}}
" syn_begin: octave {{{
" vim-octave: https://github.com/McSinyx/vim-octave{{{
highlight! link octaveDelimiter Fg
highlight! link octaveSemicolon Grey
highlight! link octaveOperator Purple
highlight! link octaveVariable YellowItalic
highlight! link octaveVarKeyword YellowItalic
highlight! link octaveUserVar RedItalic
highlight! link octaveQueryVar RedItalic
highlight! link octaveSetVar RedItalic
" }}}
" syn_end }}}
" syn_begin: sh/zsh {{{
" builtin: http://www.drchip.org/astronaut/vim/index.html#SYNTAX_SH{{{
highlight! link shRange Fg
highlight! link shOption Yellow
highlight! link shQuote Green
highlight! link shVariable RedItalic
highlight! link shDerefSimple RedItalic
highlight! link shDerefVar RedItalic
highlight! link shDerefSpecial RedItalic
highlight! link shDerefOff RedItalic
highlight! link shVarAssign Purple
highlight! link shFunctionOne Blue
highlight! link shFunctionKey Purple
" }}}
" syn_end }}}
" syn_begin: zsh {{{
" builtin: https://github.com/chrisbra/vim-zsh{{{
highlight! link zshOption RedItalic
highlight! link zshSubst Cyan
highlight! link zshFunction Blue
" }}}
" syn_end }}}
" syn_begin: ps1 {{{
" vim-ps1: https://github.com/PProvost/vim-ps1{{{
highlight! link ps1FunctionInvocation Blue
highlight! link ps1FunctionDeclaration Blue
highlight! link ps1InterpolationDelimiter Yellow
highlight! link ps1BuiltIn RedItalic
" }}}
" syn_end }}}
" syn_begin: vim {{{
call edge#highlight('vimCommentTitle', s:palette.grey, s:palette.none, 'bold')
highlight! link vimLet Purple
highlight! link vimFunction Blue
highlight! link vimIsCommand Fg
highlight! link vimUserFunc Blue
highlight! link vimFuncName Blue
highlight! link vimMap Purple
highlight! link vimMapModKey Red
highlight! link vimNotation Red
highlight! link vimMapLhs Blue
highlight! link vimMapRhs Blue
highlight! link vimOption CyanItalic
highlight! link vimUserAttrbKey RedItalic
highlight! link vimUserAttrb Blue
highlight! link vimSynType CyanItalic
highlight! link vimHiBang Purple
highlight! link vimSet Yellow
highlight! link vimSetEqual Yellow
highlight! link vimSetSep Grey
highlight! link vimVar Fg
highlight! link vimFuncVar Fg
highlight! link vimContinue Grey
highlight! link vimAutoCmdSfxList CyanItalic
" syn_end }}}
" syn_begin: make {{{
highlight! link makeIdent Yellow
highlight! link makeSpecTarget RedItalic
highlight! link makeTarget Cyan
highlight! link makeCommands Purple
" syn_end }}}
" syn_begin: cmake {{{
highlight! link cmakeCommand Purple
highlight! link cmakeKWconfigure_package_config_file RedItalic
highlight! link cmakeKWwrite_basic_package_version_file RedItalic
highlight! link cmakeKWExternalProject Blue
highlight! link cmakeKWadd_compile_definitions Blue
highlight! link cmakeKWadd_compile_options Blue
highlight! link cmakeKWadd_custom_command Blue
highlight! link cmakeKWadd_custom_target Blue
highlight! link cmakeKWadd_definitions Blue
highlight! link cmakeKWadd_dependencies Blue
highlight! link cmakeKWadd_executable Blue
highlight! link cmakeKWadd_library Blue
highlight! link cmakeKWadd_link_options Blue
highlight! link cmakeKWadd_subdirectory Blue
highlight! link cmakeKWadd_test Blue
highlight! link cmakeKWbuild_command Blue
highlight! link cmakeKWcmake_host_system_information Blue
highlight! link cmakeKWcmake_minimum_requipurple Blue
highlight! link cmakeKWcmake_parse_arguments Blue
highlight! link cmakeKWcmake_policy Blue
highlight! link cmakeKWconfigure_file Blue
highlight! link cmakeKWcreate_test_sourcelist Blue
highlight! link cmakeKWctest_build Blue
highlight! link cmakeKWctest_configure Blue
highlight! link cmakeKWctest_coverage Blue
highlight! link cmakeKWctest_memcheck Blue
highlight! link cmakeKWctest_run_script Blue
highlight! link cmakeKWctest_start Blue
highlight! link cmakeKWctest_submit Blue
highlight! link cmakeKWctest_test Blue
highlight! link cmakeKWctest_update Blue
highlight! link cmakeKWctest_upload Blue
highlight! link cmakeKWdefine_property Blue
highlight! link cmakeKWdoxygen_add_docs Blue
highlight! link cmakeKWenable_language Blue
highlight! link cmakeKWenable_testing Blue
highlight! link cmakeKWexec_program Blue
highlight! link cmakeKWexecute_process Blue
highlight! link cmakeKWexport Blue
highlight! link cmakeKWexport_library_dependencies Blue
highlight! link cmakeKWfile Blue
highlight! link cmakeKWfind_file Blue
highlight! link cmakeKWfind_library Blue
highlight! link cmakeKWfind_package Blue
highlight! link cmakeKWfind_path Blue
highlight! link cmakeKWfind_program Blue
highlight! link cmakeKWfltk_wrap_ui Blue
highlight! link cmakeKWforeach Blue
highlight! link cmakeKWfunction Blue
highlight! link cmakeKWget_cmake_property Blue
highlight! link cmakeKWget_directory_property Blue
highlight! link cmakeKWget_filename_component Blue
highlight! link cmakeKWget_property Blue
highlight! link cmakeKWget_source_file_property Blue
highlight! link cmakeKWget_target_property Blue
highlight! link cmakeKWget_test_property Blue
highlight! link cmakeKWif Blue
highlight! link cmakeKWinclude Blue
highlight! link cmakeKWinclude_directories Blue
highlight! link cmakeKWinclude_external_msproject Blue
highlight! link cmakeKWinclude_guard Blue
highlight! link cmakeKWinstall Blue
highlight! link cmakeKWinstall_files Blue
highlight! link cmakeKWinstall_programs Blue
highlight! link cmakeKWinstall_targets Blue
highlight! link cmakeKWlink_directories Blue
highlight! link cmakeKWlist Blue
highlight! link cmakeKWload_cache Blue
highlight! link cmakeKWload_command Blue
highlight! link cmakeKWmacro Blue
highlight! link cmakeKWmark_as_advanced Blue
highlight! link cmakeKWmath Blue
highlight! link cmakeKWmessage Blue
highlight! link cmakeKWoption Blue
highlight! link cmakeKWproject Blue
highlight! link cmakeKWqt_wrap_cpp Blue
highlight! link cmakeKWqt_wrap_ui Blue
highlight! link cmakeKWremove Blue
highlight! link cmakeKWseparate_arguments Blue
highlight! link cmakeKWset Blue
highlight! link cmakeKWset_directory_properties Blue
highlight! link cmakeKWset_property Blue
highlight! link cmakeKWset_source_files_properties Blue
highlight! link cmakeKWset_target_properties Blue
highlight! link cmakeKWset_tests_properties Blue
highlight! link cmakeKWsource_group Blue
highlight! link cmakeKWstring Blue
highlight! link cmakeKWsubdirs Blue
highlight! link cmakeKWtarget_compile_definitions Blue
highlight! link cmakeKWtarget_compile_features Blue
highlight! link cmakeKWtarget_compile_options Blue
highlight! link cmakeKWtarget_include_directories Blue
highlight! link cmakeKWtarget_link_directories Blue
highlight! link cmakeKWtarget_link_libraries Blue
highlight! link cmakeKWtarget_link_options Blue
highlight! link cmakeKWtarget_precompile_headers Blue
highlight! link cmakeKWtarget_sources Blue
highlight! link cmakeKWtry_compile Blue
highlight! link cmakeKWtry_run Blue
highlight! link cmakeKWunset Blue
highlight! link cmakeKWuse_mangled_mesa Blue
highlight! link cmakeKWvariable_requires Blue
highlight! link cmakeKWvariable_watch Blue
highlight! link cmakeKWwrite_file Blue
" syn_end }}}
" syn_begin: json {{{
highlight! link jsonKeyword Purple
highlight! link jsonString Green
highlight! link jsonBoolean Red
highlight! link jsonNoise Grey
highlight! link jsonQuote Grey
highlight! link jsonBraces Fg
" syn_end }}}
" syn_begin: yaml {{{
highlight! link yamlKey Purple
highlight! link yamlBlockMappingKey Purple
highlight! link yamlConstant RedItalic
highlight! link yamlString Green
highlight! link yamlKeyValueDelimiter Grey
" syn_end }}}
" syn_begin: toml {{{
call edge#highlight('tomlTable', s:palette.purple, s:palette.none, 'bold')
highlight! link tomlKey Red
highlight! link tomlBoolean Yellow
highlight! link tomlString Green
highlight! link tomlTableArray tomlTable
" syn_end }}}
" syn_begin: gitcommit {{{
highlight! link gitcommitSummary Purple
highlight! link gitcommitUntracked Grey
highlight! link gitcommitDiscarded Grey
highlight! link gitcommitSelected Grey
highlight! link gitcommitUnmerged Grey
highlight! link gitcommitOnBranch Grey
highlight! link gitcommitArrow Grey
highlight! link gitcommitFile Blue
" syn_end }}}
" syn_begin: dosini {{{
call edge#highlight('dosiniHeader', s:palette.purple, s:palette.none, 'bold')
highlight! link dosiniLabel Red
highlight! link dosiniValue Blue
highlight! link dosiniNumber Blue
" syn_end }}}
" syn_begin: help {{{
call edge#highlight('helpNote', s:palette.yellow, s:palette.none, 'bold')
call edge#highlight('helpHeadline', s:palette.purple, s:palette.none, 'bold')
call edge#highlight('helpHeader', s:palette.blue, s:palette.none, 'bold')
call edge#highlight('helpURL', s:palette.blue, s:palette.none, 'underline')
call edge#highlight('helpHyperTextEntry', s:palette.red, s:palette.none, 'bold')
highlight! link helpHyperTextJump Red
highlight! link helpCommand Cyan
highlight! link helpExample Green
highlight! link helpSpecial Yellow
highlight! link helpSectionDelim Grey
" syn_end }}}
" }}}

" vim: set sw=2 ts=2 sts=2 et tw=80 ft=vim fdm=marker fmr={{{,}}}:
