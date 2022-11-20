# Changelog

All notable changes to this project will be documented in this file.

## [Unreleased]

### Added

- Add `g:edge_dim_foreground`.
- Optimize `b0o/incline.nvim`.
- Optimize winbar.
- Optimize `echasnovski/mini.nvim`.
- Support coc popup menu.
- Optimize `ggandor/lightspeed.nvim`.
- Optimize `pwntester/octo.nvim`.
- Optimize `simrat39/symbols-outline.nvim`.
- Support for YCM semantic highlighting and inlayHints.
- Optimize `MattesGroeger/vim-bookmarks`.
- Support for vim-lsp semantic highlighting and inlayHints.
- New tree-sitter tokens.
- Support for shading.
- Optimize `nvim-neo-tree/neo-tree.nvim`

## [0.2.2] - 2022-05-26

### Added

- Add `g:edge_spell_foreground`.
- Optimize `junegunn/limelight.vim`.
- Add FAQ for configuration options.
- Optimize `rhysd/clever-f.vim`.
- Optimize `rcarriga/nvim-dap-ui`.
- Add `g:edge_disable_terminal_colors`.
- Optimize `voldikss/vim-floaterm`.
- Support `g:edge_transparent_background == 2`.
- Optimize `stevearc/aerial.nvim`.
- Optimize `wbthomason/packer.nvim`.
- Add `g:edge_colors_override`.

### Changed

- Redesign coc symbols.
- Redesign `liuchengxu/vim-clap`.
- Redesign semantic hi groups in coc.nvim [neoclide/coc.nvim#3355](https://github.com/neoclide/coc.nvim/pull/3355).
- Generate `/after/syntax`.

### Fixed

- Update &runtimepath after generating syntax files.

### Removed

- Remove extra stuffs from this repo. [`44aff34`](https://github.com/sainnhe/edge/commit/44aff34e04337120a49a52e94ce735d09c7fafbe)
- Remove examples of configuration options in help doc.

## [0.2.1] - 2022-01-09

### Added

- Optimize `fannheyward/coc-rust-analyzer`.
- Add [Diagnostic](https://github.com/neovim/neovim/pull/15585) highlight groups.
- Optimize `vimwiki/vimwiki`.
- Optimize `hrsh7th/nvim-cmp`.
- Optimize `folke/trouble.nvim`.
- Optimize `TimUntersberger/neogit`.
- Optimize `lambdalisue/fern.vim`.
- Optimize `romgrk/barbar.nvim`.
- Optimize `rcarriga/nvim-notify`.
- Support `nvim-lualine/lualine.nvim`.
- Optimize performance in vim by disabling hi groups of neovim-only plugins.
- Optimize `lewis6991/gitsigns.nvim`.
- Optimize `airblade/vim-gitgutter`.
- Optimize `mhinz/vim-signify`.
- Optimize `glepnir/dashboard-nvim`.
- Optimize `glepnir/lspsaga.nvim`.
- Add modeline to generated ftplugin files.

### Changed

- Disable tmux checking.

## [0.2.0] - 2021-08-06

### Added

- Optimize `lervag/vimtex`.
- Add `g:edge_diagnostic_text_highlight`
- Optimize `liuchengxu/vim-clap`.
- Add whitelist for extended file types.
- Support for leaderf popup mode.
- Optimize `nvim-telescope/telescope.nvim`.
- Add `g:edge_diagnostic_virtual_text`.
- Optimize `kyazdani42/nvim-tree.lua`.
- Add installation guide for using pack feature.
- Add `g:edge_show_eob`.
- Optimize `McSinyx/vim-octave`.
- Support semantic highlight in coc.nvim .
- Optimize semantic highlight in some plugins.
- Support `thiagoalessio/rainbow_levels.vim` and `p00f/nvim-ts-rainbow`.
- Optimize coc symbols and coc tree.

### Changed

- Diagnostics text highlights.
- `gui=undercurl` is enabled in tmux >= 2.9
- Adjust status line bg.
- Redesign syntax logic of tree-sitter.

### Removed

- Remove `g:edge_sign_column_background`.

## [0.1.4] - 2020-12-29

### Added

- AUR packages.
- Support neovim lsp diagnostics.
- New highlight groups for coc-explorer.
- Outline of help doc.

### Changed

- Remove duplicate docs in README.
- Remove Anti-996-LICENSE.
- Optimize diff colors.
- Use more yellow.

### Fixed

- Fix errors when doesn't set `g:colors_name`.
- Fix `DiffText` in Vim.
- Fix `CurrentWord` in diff mode.
- Fix `CursorColumn` in diff mode.

## [0.1.3] - 2020-08-02

### Added

- Optimize `Yggdroot/indentLine`.
- Add hi groups for `iCursor` and `vCursor`.
- Add hi groups for builtin lsp and checkhealth.
- Optimize Airline.
- Optimize `cohama/agit.vim`.
- Add `ToolbarLine` and `ToolbarButton`.

### Changed

- Adjust red in the light variant.
- Adjust `Search` and `IncSearch`.
- Adjust syntax highlighting logic.
- Adjust `NonText`, `Whitespace` and `SpecialKey`.
- Format of alacritty theme.
- Rewrite based on gruvbox-material.

## [0.1.2] - 2020-03-02

### Changed

- Adjust colors to be more vibrant.

## [0.1.1] - 2020-02-19

### Changed

- Adjust yellow, green, cyan, blue and purple in the dark variant.

## [0.1.0] - 2020-02-12

### Added

- Finish dark and variant.
- Airline theme.
- Lightline theme.
- Add alacrity theme.
- Add kitty theme.
- Add zsh theme.
- Add xresource theme.
- Add tilix theme.
- Add termite theme.
- Add fzf theme.

[unreleased]: https://github.com/sainnhe/edge/compare/v0.2.2...HEAD
[0.2.2]: https://github.com/sainnhe/edge/compare/v0.2.1...v0.2.2
[0.2.1]: https://github.com/sainnhe/edge/compare/v0.2.0...v0.2.1
[0.2.0]: https://github.com/sainnhe/edge/compare/v0.1.4...v0.2.0
[0.1.4]: https://github.com/sainnhe/edge/compare/v0.1.3...v0.1.4
[0.1.3]: https://github.com/sainnhe/edge/compare/v0.1.2...v0.1.3
[0.1.2]: https://github.com/sainnhe/edge/compare/v0.1.1...v0.1.2
[0.1.1]: https://github.com/sainnhe/edge/compare/v0.1.0...v0.1.1
[0.1.0]: https://github.com/sainnhe/edge/releases/tag/v0.1.0
