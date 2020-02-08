|         |                                                         𝐃𝐚𝐫𝐤                                                         |                                                         𝐋𝐢𝐠𝐡𝐭                                                         |
| :-----: | :------------------------------------------------------------------------------------------------------------------: | :-------------------------------------------------------------------------------------------------------------------: |
| default |  ![edge-dark](https://user-images.githubusercontent.com/37491630/74084387-85cac700-4a66-11ea-9c4d-0976dd844dd5.png)  |  ![edge-light](https://user-images.githubusercontent.com/37491630/74084389-87948a80-4a66-11ea-8643-021cda717e2a.png)  |
| proton  | ![proton-dark](https://user-images.githubusercontent.com/37491630/74084402-9e3ae180-4a66-11ea-9885-a925d209ac4b.png) | ![proton-light](https://user-images.githubusercontent.com/37491630/74084393-8bc0a800-4a66-11ea-9183-af47ceaf435a.png) |
|  neon   |  ![neon-dark](https://user-images.githubusercontent.com/37491630/74084394-8d8a6b80-4a66-11ea-9fbb-9d69aabc9e82.png)  |  ![neon-light](https://user-images.githubusercontent.com/37491630/74084395-8f542f00-4a66-11ea-92ce-9e3cc5863392.png)  |

# Installation

## Via Plugin Manager

Take [vim-plug](https://github.com/junegunn/vim-plug) for example:

```vim
Plug 'sainnhe/edge'
```

For better syntax highlighting support, please install [sheerun/vim-polyglot](https://github.com/sheerun/vim-polyglot).

## Manually

1. Clone this repository.
2. Copy `/path/to/edge/colors/*` to `~/.vim/colors/` .
3. To install [airline](https://github.com/vim-airline/vim-airline) theme, copy `/path/to/edge/autoload/airline/themes/*` to `~/.vim/autoload/airline/themes/` .
4. To install [lightline](https://github.com/itchyny/lightline.vim) theme, copy `/path/to/edge/autoload/lightline/colorscheme/*` to `~/.vim/autoload/lightline/colorscheme/` .

# Usage

## Vim

Put this in your vimrc:

```vim
" important!!
set termguicolors

" for dark version
set background=dark

" for light version
set background=light

" the configuration options should be placed before `colorscheme edge`
let g:edge_style = 'neon'
let g:edge_disable_italic_comment = 1

colorscheme edge
```

See [Configuration](https://github.com/sainnhe/edge#configuration) for more configuration options.

If you want to apply this color scheme temporarily, run this command in vim(**this may cause broken colors**):

```vim
:colorscheme edge
```

### Airline

To enable [airline](https://github.com/vim-airline/vim-airline) color scheme, put this in your vimrc:

```vim
let g:airline_theme = 'edge'
```

To apply it without reloading:

```vim
:AirlineTheme edge
```

### Lightline

To enable [lightline](https://github.com/itchyny/lightline.vim) color scheme, put this in your vimrc:

```vim
let g:lightline = {}
let g:lightline.colorscheme = 'edge'

" or this line
let g:lightline = {'colorscheme' : 'edge'}
```

To apply it without reloading:

```vim
:let g:lightline.colorscheme = 'edge'
:call lightline#init()
:call lightline#colorscheme()
```

### Configuration

**Note:** The configuration options should be placed before `colorscheme edge` .

- `g:edge_style`: Customize the style of this color scheme.
  - Available values: `'default'`, `'proton'`, `'neon'`
  - Default value: `'default'`
- `g:edge_transparent_background`: Set to `1` to enable transparent background.
  - Available values: `0`, `1`
  - Default value: `0`
- `g:edge_menu_selection_background`: Control the background color of `PmenuSel` and `WildMenu` .
  - Available values: `'blue'`, `'green'`, `'purple'`
  - Default value: `'blue'`
- `g:edge_disable_italic_comment`: Set to `1` to disable italic in `Comment` .
  - Available values: `0`, `1`
  - Default value: `0`
- `g:edge_enable_italic`: Set to `1` to italicize keywords. This option is designed to use with fonts that support cursive italic styles, for example [Fira Code iCursive Op](https://github.com/sainnhe/icursive-nerd-font).
  - Available values: `0`, `1`
  - Default value: `0`
- `g:edge_current_word`: Some plugins can highlight the word under current cursor(for example [neoclide/coc-highlight](https://github.com/neoclide/coc-highlight)), you can use this option to control their behavior.
  - Available values: `'bold'`, `'underline'`, `'italic'`, `'grey background'`
  - Default value: `'grey background'` when not in transparent mode, `'bold'` when in transparent mode.
- `g:edge_lightline_disable_bold`: Set to `1` to disable bold in lightline theme.
  - Available values: `0`, `1`
  - Default value: `0`

## Tmux Status Line

Check this [gist](https://gist.github.com/sainnhe/b8240bc047313fd6185bb8052df5a8fb).

## Zsh

- [Syntax Highlighting](https://github.com/sainnhe/edge/tree/master/zsh#syntax-highlighting)
- [Prompt](https://github.com/sainnhe/edge/tree/master/zsh#prompt)

## Terminal Emulators

- [Alacritty](./alacritty/README.md)
- [Kitty](./kitty/README.md)
- [Termite](./termite/README.md)
- [Tilix](./tilix/README.md)

## More

- [Xresources](./xresources/README.md)
- [fzf](./fzf/README.md)

## FAQ

**Q: It doesn't work as expected.**

**A:**

1. This color scheme is mainly designed for true colors, `set termguicolors` is required. Check output of `vim --version`, maybe your vim doesn't support `termguicolors`.
2. Maybe your terminal emulator doesn't support true colors, you can test it using [this script](https://unix.stackexchange.com/questions/404414/print-true-color-24-bit-test-pattern).
3. If you are running vim in tmux, you need to override default true colors of tmux, as tmux cannot display true colors properly: [#1246 How to use true colors in vim under tmux?](https://github.com/tmux/tmux/issues/1246)
4. There are many highlight group links in syntax files while a color scheme may change them, enabling one color scheme based on another color scheme enabled is very likely to cause colors to break. If any color is broken, you can enable the color scheme in your vimrc instead of after vim startup.

**Q: How to enable cursive italic keywords?**

**A:**

1. Install a font that supports cursive italics, for example [icursive-nerd-font](https://github.com/sainnhe/icursive-nerd-font).
2. Enable italic keywords in this color scheme: `let g:edge_enable_italic = 1`
3. Disable italic comment(optional): `let g:edge_disable_italic_comment = 1`

# Inspiration

- [Atom One](https://github.com/atom/atom/tree/master/packages/one-dark-syntax)

- [Material](https://github.com/equinusocio/material-theme)

# Thanks to

- [manfredmjka](https://github.com/manfredmjka): termite and fzf support

# License

[MIT](./LICENSE) && [Anti-996](./Anti-996-LICENSE)
