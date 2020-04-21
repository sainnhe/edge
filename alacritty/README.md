# Installation

Add this to `~/.config/alacritty/alacritty.yml`

```yaml
schemes:  

  ### Edge (Light variant)
  edge_light:	  &edge_light
    primary:
      background: "0xfafafa"
      foreground: "0x4b505b"
  
    normal:
      black: "0x4b505b"
      red: "0xd05858"
      green: "0x608e32"
      yellow: "0xbe7e05"
      blue: "0x5079be"
      magenta: "0xb05ccc"
      cyan: "0x3a8b84"
      white: "0xfafafa"
  
    bright:
      black: "0x4b505b"
      red: "0xd05858"
      green: "0x608e32"
      yellow: "0xbe7e05"
      blue: "0x5079be"
      magenta: "0xb05ccc"
      cyan: "0x3a8b84"
      white: "0xfafafa"

  ### Edge (Dark Default variant)
  edge_dark_def:  &edge_dark_default
    primary:
      background: "0x2c2e34"
      foreground: "0xc5cdd9"
  
    normal:
      black: "0x3e4249"
      red: "0xec7279"
      green: "0xa0c980"
      yellow: "0xdeb974"
      blue: "0x6cb6eb"
      magenta: "0xd38aea"
      cyan: "0x5dbbc1"
      white: "0xc5cdd9"
  
    bright:
      black: "0x3e4249"
      red: "0xec7279"
      green: "0xa0c980"
      yellow: "0xdeb974"
      blue: "0x6cb6eb"
      magenta: "0xd38aea"
      cyan: "0x5dbbc1"
      white: "0xc5cdd9"

  ### Edge (Dark Aura variant)
  edge_dark_aura:  &edge_dark_aura
    primary:
      background: "0x2b2d37"
      foreground: "0xc5cdd9"
  
    normal:
      black: "0x363a49"
      red: "0xec7279"
      green: "0xa0c980"
      yellow: "0xdeb974"
      blue: "0x6cb6eb"
      magenta: "0xd38aea"
      cyan: "0x5dbbc1"
      white: "0xc5cdd9"
  
    bright:
      black: "0x363a49"
      red: "0xec7279"
      green: "0xa0c980"
      yellow: "0xdeb974"
      blue: "0x6cb6eb"
      magenta: "0xd38aea"
      cyan: "0x5dbbc1"
      white: "0xc5cdd9"

  ### Edge (Dark Neon variant)
  edge_dark_neon:  &edge_dark_neon
    primary:
      background: "0x2b2d3a"
      foreground: "0xc5cdd9"
  
    normal:
      black: "0x363a4e"
      red: "0xec7279"
      green: "0xa0c980"
      yellow: "0xdeb974"
      blue: "0x6cb6eb"
      magenta: "0xd38aea"
      cyan: "0x5dbbc1"
      white: "0xc5cdd9"
  
    bright:
      black: "0x363a4e"
      red: "0xec7279"
      green: "0xa0c980"
      yellow: "0xdeb974"
      blue: "0x6cb6eb"
      magenta: "0xd38aea"
      cyan: "0x5dbbc1"
      white: "0xc5cdd9"

### Choose one of the & tags from the schemes listed above
colors: *edge_dark_neon
```

