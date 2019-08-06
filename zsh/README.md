# Syntax Highlighting

The syntax highlighting is implemented by [zdharma/fast-syntax-highlighting](https://github.com/zdharma/fast-syntax-highlighting). By using `default` theme with any terminal emulator color scheme of edge, you can get a edge syntax highlighting theme of zsh.

# Prompt

The prompt theme is edge version of pure power, it depends on [romkatv/powerlevel10k](https://github.com/romkatv/powerlevel10k).

To use it, simply source this file in your zshrc after powerlevel10k has been load:

```zsh
# for light version
source /path/to/edge/zsh/.zsh-pure-power-light

# for dark version
source /path/to/edge/zsh/.zsh-pure-power-dark
```

Alternatively, if you are using [zplugin](https://github.com/zdharma/zplugin), you can install the theme like this:

```zsh
zplugin light romkatv/powerlevel10k

# for light version
zplugin snippet https://github.com/sainnhe/edge/blob/master/zsh/.zsh-pure-power-light

# for dark version
zplugin snippet https://github.com/sainnhe/edge/blob/master/zsh/.zsh-pure-power-dark
```

## Customization

There are three modes of this prompt theme:

```zsh
PURE_POWER_MODE=modern    # use nerdfont characters in the prompt
PURE_POWER_MODE=fancy     # use unicode characters in the prompt(default)
PURE_POWER_MODE=portable  # use only ascii characters in the prompt
```

To switch between them, edit `/path/to/edge/zsh/.zsh-pure-power-*`, and change the value of `PURE_POWER_MODE`.
