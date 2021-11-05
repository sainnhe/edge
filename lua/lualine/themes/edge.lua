-- =============================================================================
-- URL: https://github.com/sainnhe/edge
-- Filename: lua/lualine/themes/edge.lua
-- Author: sainnhe
-- Email: sainnhe@gmail.com
-- License: MIT License
-- =============================================================================

local configuration = vim.fn['edge#get_configuration']()
local palette = vim.fn['edge#get_palette'](configuration.style)

return {
  normal = {
    a = {bg = palette.bg_purple[1], fg = palette.bg0[1], gui = 'bold'},
    b = {bg = palette.bg4[1], fg = palette.fg[1]},
    c = {bg = palette.bg1[1], fg = palette.fg[1]}
  },
  insert = {
    a = {bg = palette.bg_blue[1], fg = palette.bg0[1], gui = 'bold'},
    b = {bg = palette.bg4[1], fg = palette.fg[1]},
    c = {bg = palette.bg1[1], fg = palette.fg[1]}
  },
  visual = {
    a = {bg = palette.bg_red[1], fg = palette.bg0[1], gui = 'bold'},
    b = {bg = palette.bg4[1], fg = palette.fg[1]},
    c = {bg = palette.bg1[1], fg = palette.fg[1]}
  },
  replace = {
    a = {bg = palette.yellow[1], fg = palette.bg0[1], gui = 'bold'},
    b = {bg = palette.bg4[1], fg = palette.fg[1]},
    c = {bg = palette.bg1[1], fg = palette.fg[1]}
  },
  command = {
    a = {bg = palette.bg_green[1], fg = palette.bg0[1], gui = 'bold'},
    b = {bg = palette.bg4[1], fg = palette.fg[1]},
    c = {bg = palette.bg1[1], fg = palette.fg[1]}
  },
  terminal = {
    a = {bg = palette.cyan[1], fg = palette.bg0[1], gui = 'bold'},
    b = {bg = palette.bg4[1], fg = palette.fg[1]},
    c = {bg = palette.bg1[1], fg = palette.fg[1]}
  },
  inactive = {
    a = {bg = palette.bg1[1], fg = palette.grey[1]},
    b = {bg = palette.bg1[1], fg = palette.grey[1]},
    c = {bg = palette.bg1[1], fg = palette.grey[1]}
  }
}
