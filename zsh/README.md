| 𝐃𝐚𝐫𝐤 | 𝐋𝐢𝐠𝐡𝐭 |
| :---: | :---: |
| ![zsh-dark](https://user-images.githubusercontent.com/37491630/62587046-b52e2a80-b8af-11e9-8ea2-648865f1454a.png) | ![zsh-light](https://user-images.githubusercontent.com/37491630/62587049-b8291b00-b8af-11e9-8531-629dc39a9c6b.png) |

# Syntax Highlighting

The syntax highlighting is implemented by [zdharma/fast-syntax-highlighting](https://github.com/zdharma/fast-syntax-highlighting). By using `default` theme with any [terminal emulator color scheme](https://github.com/sainnhe/edge#terminal-emulators) of edge, you can get a edge syntax highlighting theme of zsh.

# Prompt

The prompt theme is edge version of pure power, it depends on [romkatv/powerlevel10k](https://github.com/romkatv/powerlevel10k).

To use it, simply source this file in your zshrc after powerlevel10k has been load:

```zsh
# for light version
source /path/to/edge/zsh/.zsh-theme-edge-light
source /path/to/edge/zsh/.zsh-theme-neon-light

# for dark version
source /path/to/edge/zsh/.zsh-theme-edge-dark
source /path/to/edge/zsh/.zsh-theme-neon-dark
```

Alternatively, if you are using [zplugin](https://github.com/zdharma/zplugin), you can install the theme like this:

```zsh
zplugin light romkatv/powerlevel10k

# for light version
zplugin snippet https://github.com/sainnhe/edge/blob/master/zsh/.zsh-theme-edge-light
zplugin snippet https://github.com/sainnhe/edge/blob/master/zsh/.zsh-theme-neon-light

# for dark version
zplugin snippet https://github.com/sainnhe/edge/blob/master/zsh/.zsh-theme-edge-dark
zplugin snippet https://github.com/sainnhe/edge/blob/master/zsh/.zsh-theme-neon-dark
```

## Customization

There are three modes of this prompt theme:

```zsh
PURE_POWER_MODE=modern    # use nerdfont characters in the prompt
PURE_POWER_MODE=fancy     # use unicode characters in the prompt(default)
PURE_POWER_MODE=portable  # use only ascii characters in the prompt
```

To switch between them, edit `/path/to/edge/zsh/.zsh-pure-power-*`, and change the value of `PURE_POWER_MODE`.
