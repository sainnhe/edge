# Changelog

All notable changes to this project will be documented in this file.

## [Unreleased]

### Added

- Optimize `fannheyward/coc-rust-analyzer`.
- Add [Diagnostic](https://github.com/neovim/neovim/pull/15585) highlight groups.
- Optimize `vimwiki/vimwiki`.
- Optimize `hrsh7th/nvim-cmp`.

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

[unreleased]: https://github.com/sainnhe/edge/compare/v0.2.0...HEAD
[0.2.0]: https://github.com/sainnhe/edge/compare/v0.1.4...v0.2.0
[0.1.4]: https://github.com/sainnhe/edge/compare/v0.1.3...v0.1.4
[0.1.3]: https://github.com/sainnhe/edge/compare/v0.1.2...v0.1.3
[0.1.2]: https://github.com/sainnhe/edge/compare/v0.1.1...v0.1.2
[0.1.1]: https://github.com/sainnhe/edge/compare/v0.1.0...v0.1.1
[0.1.0]: https://github.com/sainnhe/edge/releases/tag/v0.1.0
