<h1 align="center">
𝐄𝐝𝐠𝐞
</h1>

<h2 align="center">
𝐄𝐝𝐠𝐞 𝐃𝐚𝐫𝐤
</h2>

![edge-dark](https://user-images.githubusercontent.com/37491630/75647937-7a725200-5c46-11ea-8ebe-fd4354e39a1e.png)

<h2 align="center">
𝐄𝐝𝐠𝐞 𝐃𝐚𝐫𝐤 (𝐀𝐮𝐫𝐚)
</h2>

![aura-dark](https://user-images.githubusercontent.com/37491630/75647942-7ba37f00-5c46-11ea-9118-b3745a3f6c59.png)

<h2 align="center">
𝐄𝐝𝐠𝐞 𝐃𝐚𝐫𝐤 (𝐍𝐞𝐨𝐧)
</h2>

![neon-dark](https://user-images.githubusercontent.com/37491630/75647943-7cd4ac00-5c46-11ea-87ea-d5e57f4cd4e2.png)

<h2 align="center">
𝐄𝐝𝐠𝐞 𝐋𝐢𝐠𝐡𝐭
</h2>

![edge-light](https://user-images.githubusercontent.com/37491630/75647946-7e9e6f80-5c46-11ea-9213-bead6430064e.png)

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

For better syntax highlighting support, please install [sheerun/vim-polyglot](https://github.com/sheerun/vim-polyglot) or [nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter).

### Manually

1. Clone this repository.
2. Copy `/path/to/edge/autoload/edge.vim` to `~/.vim/autoload/`.
3. Copy `/path/to/edge/colors/edge.vim` to `~/.vim/colors/` .
4. Copy `/path/to/edge/doc/edge.txt` to `~/.vim/doc/` and execute `:helptags ~/.vim/doc/` to generate help tags.
5. To install [airline](https://github.com/vim-airline/vim-airline) theme, copy `/path/to/edge/autoload/airline/themes/edge.vim` to `~/.vim/autoload/airline/themes/edge.vim` .
6. To install [lightline](https://github.com/itchyny/lightline.vim) theme, copy `/path/to/edge/autoload/lightline/colorscheme/edge.vim` to `~/.vim/autoload/lightline/colorscheme/edge.vim` .

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
let g:edge_style = 'aura'
let g:edge_disable_italic_comment = 1

colorscheme edge
```

See `:help edge-configuration` for more configuration options.

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

### FAQ

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

**Q: What's your status line configuration?**

**A:** See this [article](https://www.sainnhe.dev/post/status-line-config/).

## Related Projects

See this [wiki page](https://github.com/sainnhe/edge/wiki/Related-Projects).

## More Color Schemes

- [Gruvbox Material](https://github.com/sainnhe/gruvbox-material)
- [Forest Night](https://github.com/sainnhe/forest-night)
- [Sonokai](https://github.com/sainnhe/sonokai)

## License

[MIT](./LICENSE) && [Anti-996](./Anti-996-LICENSE)
