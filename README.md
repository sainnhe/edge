|         |                                                        𝐃𝐚𝐫𝐤                                                        |                                                        𝐋𝐢𝐠𝐡𝐭                                                        |
| :-----: | :----------------------------------------------------------------------------------------------------------------: | :-----------------------------------------------------------------------------------------------------------------: |
| 𝐃𝐞𝐟𝐚𝐮𝐥𝐭 | ![edge-dark](https://user-images.githubusercontent.com/37491630/75647937-7a725200-5c46-11ea-8ebe-fd4354e39a1e.png) | ![edge-light](https://user-images.githubusercontent.com/37491630/75647946-7e9e6f80-5c46-11ea-9213-bead6430064e.png) |
|  𝐀𝐮𝐫𝐚   | ![aura-dark](https://user-images.githubusercontent.com/37491630/75647942-7ba37f00-5c46-11ea-9118-b3745a3f6c59.png) | ![aura-light](https://user-images.githubusercontent.com/37491630/75647949-7fcf9c80-5c46-11ea-96f8-c691f0fab5c3.png) |
|  𝐍𝐞𝐨𝐧   | ![neon-dark](https://user-images.githubusercontent.com/37491630/75647943-7cd4ac00-5c46-11ea-87ea-d5e57f4cd4e2.png) | ![neon-light](https://user-images.githubusercontent.com/37491630/75647952-8231f680-5c46-11ea-830a-8129638e87d5.png) |

This color scheme is heavily inspired by [Atom One](https://github.com/atom/atom/tree/master/packages/one-dark-syntax) and [Material](https://github.com/equinusocio/material-theme), I'm trying to combine my favorite designs of them in this color scheme.

## Features

- Vivid colors.
- Designed to have a soft contrast for eye protection.
- Customizable.
- Rich support for common file types and plugins.
- [Italic support](https://github.com/sainnhe/icursive-nerd-font) 🎉

## Installation

### Via Plugin Manager

Take [vim-plug](https://github.com/junegunn/vim-plug) for example:

```vim
Plug 'sainnhe/edge'
```

For better syntax highlighting support, please install [sheerun/vim-polyglot](https://github.com/sheerun/vim-polyglot).

### Manually

1. Clone this repository.
2. Copy `/path/to/edge/colors/*` to `~/.vim/colors/` .
3. To install [airline](https://github.com/vim-airline/vim-airline) theme, copy `/path/to/edge/autoload/airline/themes/*` to `~/.vim/autoload/airline/themes/` .
4. To install [lightline](https://github.com/itchyny/lightline.vim) theme, copy `/path/to/edge/autoload/lightline/colorscheme/*` to `~/.vim/autoload/lightline/colorscheme/` .

## Usage

### Vim

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

#### Airline

To enable [airline](https://github.com/vim-airline/vim-airline) color scheme, put this in your vimrc:

```vim
let g:airline_theme = 'edge'
```

To apply it without reloading:

```vim
:AirlineTheme edge
```

#### Lightline

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

#### Configuration

**Note:** The configuration options should be placed before `colorscheme edge` .

- `g:edge_style`: Customize the style of this color scheme.
  - Available values: `'default'`, `'aura'`, `'neon'`
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
- `g:edge_cursor`: Customize the cursor color, only works in GUI clients.
  - Available values: `'auto'`, `'red'`, `'green'`, `'blue'`, `'purple'`
  - Default value: `'auto'`
- `g:edge_current_word`: Some plugins can highlight the word under current cursor(for example [neoclide/coc-highlight](https://github.com/neoclide/coc-highlight)), you can use this option to control their behavior.
  - Available values: `'bold'`, `'underline'`, `'italic'`, `'grey background'`
  - Default value: `'grey background'` when not in transparent mode, `'bold'` when in transparent mode.
- `g:edge_lightline_disable_bold`: Set to `1` to disable bold in lightline theme.
  - Available values: `0`, `1`
  - Default value: `0`

### FAQ

**Q: It doesn't work as expected.**

**A:**

1. This color scheme is mainly designed for true colors, `set termguicolors` is required. Check output of `vim --version`, maybe your vim doesn't support `termguicolors`.
2. Maybe your terminal emulator doesn't support true colors, you can test it using [this script](https://unix.stackexchange.com/questions/404414/print-true-color-24-bit-test-pattern).
3. If you are running vim in tmux, you need to override default true colors of tmux, as tmux cannot display true colors properly: [#1246 How to use true colors in vim under tmux?](https://github.com/tmux/tmux/issues/1246)
4. There are many highlight group links in syntax files while a color scheme may change them, enabling one color scheme based on another color scheme enabled is very likely to cause colors to break. If any color is broken, you can enable the color scheme in your vimrc instead of after vim startup.

**Q: The background color of gitgutter looks wired.**

**A:** See [#6](https://github.com/sainnhe/edge/issues/6#issuecomment-570750204).

**Q: How to enable cursive italic keywords?**

**A:**

1. Install a font that supports cursive italics, for example [icursive-nerd-font](https://github.com/sainnhe/icursive-nerd-font).
2. Enable italic keywords in this color scheme: `let g:edge_enable_italic = 1`
3. Disable italic comment(optional): `let g:edge_disable_italic_comment = 1`

**Q: What's your status line configuration?**

**A:** See this [article](https://www.sainnhe.dev/post/status-line-config/).

## Related Projects

### Code Editor

- [Visual Studio Code](https://github.com/sainnhe/edge-vscode)

### Terminal Emulators

- [Alacritty](./alacritty/README.md)
- [Kitty](./kitty/README.md)
- [Termite](./termite/README.md)
- [Tilix](./tilix/README.md)

### Other

- [Xresources](./xresources/README.md)
- [fzf](./fzf/README.md)
- [zsh](https://github.com/sainnhe/edge/tree/master/zsh)
- [tmux](https://www.sainnhe.dev/post/status-line-config/)

## More Color Schemes

- [Gruvbox Material](https://github.com/sainnhe/gruvbox-material)
- [Forest Night](https://github.com/sainnhe/forest-night)
- [Sonokai](https://github.com/sainnhe/sonokai)

## Inspiration

- [Atom One](https://github.com/atom/atom/tree/master/packages/one-dark-syntax)
- [Material](https://github.com/equinusocio/material-theme)

## Thanks to

- [manfredmjka](https://github.com/manfredmjka): termite and fzf support

## License

[MIT](./LICENSE) && [Anti-996](./Anti-996-LICENSE)
