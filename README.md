<h1 align="center">
    <a href="https://gist.github.com/sainnhe/991dc3cb7d885e20f911816197c85b9d#%F0%9D%90%84%F0%9D%90%83%F0%9D%90%86%F0%9D%90%84">𝐄𝐃𝐆𝐄</a>
</h1>

| 𝐃𝐚𝐫𝐤 | 𝐋𝐢𝐠𝐡𝐭 |
| :---: | :---: |
| ![dark](https://user-images.githubusercontent.com/37491630/62260060-28432700-b400-11e9-9488-b196f6884488.png) | ![light](https://user-images.githubusercontent.com/37491630/65002546-ebfe5400-d8e3-11e9-85d5-7146b6f1b19e.png) |

This color scheme is heavily inspired by [Atom One](https://github.com/atom/atom/tree/master/packages/one-dark-syntax) and [Material](https://github.com/equinusocio/vsc-material-theme), I'm trying to combine my favorite parts of them together.

# Installation

## Via Plugin Manager

Take [vim-plug](https://github.com/junegunn/vim-plug) for example:

```vim
Plug 'sainnhe/edge'
```

For better syntax highlighting support, please install [sheerun/vim-polyglot](https://github.com/sheerun/vim-polyglot).

## Manually

1. Clone this repository.
2. Copy `/path/to/edge/colors/edge.vim` to `~/.vim/colors/edge.vim`
3. To install [lightline](https://github.com/itchyny/lightline.vim) theme, copy `/path/to/edge/autoload/lightline/colorscheme/edge.vim` to `~/.vim/autoload/lightline/colorscheme/edge.vim`

# Usage

## Vim

Put this in your vimrc:

```vim
set termguicolors

" for dark version
set background=dark
colorscheme edge

" for light version
set background=light
colorscheme edge
```

If you want to apply this color scheme temporarily, run this command in vim(**this may cause color broken**):

```vim
:colorscheme edge
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

## Tmux Status Line

Check this [gist](https://gist.github.com/sainnhe/b8240bc047313fd6185bb8052df5a8fb).

## Zsh

- [Syntax Highlighting](https://github.com/sainnhe/edge/tree/master/zsh#syntax-highlighting)
- [Prompt](https://github.com/sainnhe/edge/tree/master/zsh#prompt)

## Terminal Emulators

- [Alacritty](./alacritty/README.md)
- [Kitty](./kitty/README.md)
- [Tilix](./tilix/README.md)

## Xresources

[README.md](./xresources/README.md)

## FAQ

**Q: It doesn't work as expected.**

**A:**

1. This color scheme is mainly designed for true colors, `set termguicolors` is required. Check output of `vim --version`, maybe your vim doesn't support `termguicolors`

2. Maybe your terminal emulator doesn't support true colors, you can test it using [this script](https://unix.stackexchange.com/questions/404414/print-true-color-24-bit-test-pattern)

3. If you are running vim in tmux, you need to override default true colors of tmux, as tmux cannot display true color properly: [#1246 How to use true colors in vim under tmux?](https://github.com/tmux/tmux/issues/1246)

4. There are many highlight group links in syntax files while a color scheme may change them, enabling one color scheme based on another color scheme enabled is very likely to cause color broken. If there is any color broken, you can enable the color scheme in your vimrc instead of after vim startup.

**Q: What's your status line configuration?**

**A:** Check this [gist](https://gist.github.com/sainnhe/b8240bc047313fd6185bb8052df5a8fb).

**Q: What's the font used here?**

**A:** [Fira Code Nerd Font](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/FiraCode).

# Contribution

Check this gist for detailed instructions to hack this color scheme: [hack-color-schemes.md](https://gist.github.com/sainnhe/911f78cbb092ac58c8734c423a464935)

# Inspiration

[Atom One](https://github.com/atom/atom/tree/master/packages/one-dark-syntax)

[Material](https://github.com/equinusocio/vsc-material-theme)

# License

[MIT](./LICENSE) && [Anti-996](./Anti-996-LICENSE)
