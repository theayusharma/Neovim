<h1 align="center">NeoVim Web Dev Edition (TeVim)</h1>

<div align="center">

![GitHub top language](https://img.shields.io/github/languages/top/theayusharma/NeoVim??color=6d92bf&style=for-the-badge&labelColor=111418)
![Last Commit](https://img.shields.io/github/last-commit/theayusharma/NeoVim?&style=for-the-badge&color=da696f&logoColor=D9E0EE&labelColor=111418)
![GitHub code size in bytes](https://img.shields.io/github/languages/code-size/theayusharma/NeoVim?color=e1b56a&style=for-the-badge&labelColor=111418)
![GitHub Repo stars](https://img.shields.io/github/stars/theayusharma/NeoVim?color=74be88&style=for-the-badge&labelColor=111418)

</div>

<img src=".github/assets/neovim.png">

<div align="center">

```txt
Performance for time startup on laptop
LazyStart                           : 14ms - 20ms
UiEnter                              : 70ms - 100ms
```

</div>
<h5> Themes Showcase with 16 colorschemes </h5>

| <img src="https://github.com/theayusharma/NeoVim/assets/90148193/7b5e73eb-244c-48b0-937a-bd9590ca151c" align="center" width="200px"> | <img src="https://github.com/sownteedev/TeVim/assets/90148193/0dad550e-08f0-4ed3-a0a5-b8ace6e561d2" align="center" width="200px"> | <img src="https://github.com/sownteedev/TeVim/assets/90148193/a3f2a5ab-e17f-4132-9c52-7ea8b0962ab8" align="center" width="200px"> | <img src="https://github.com/sownteedev/TeVim/assets/90148193/ed8f0347-b809-4570-b0d9-6b49e81257d9" align="center" width="200px"> |
| :-------------------------------------------------------------------------------------------------------------------------------: | :-------------------------------------------------------------------------------------------------------------------------------: | :-------------------------------------------------------------------------------------------------------------------------------: | --------------------------------------------------------------------------------------------------------------------------------- |
| <img src="https://github.com/theayusharma/NeoVim/assets/90148193/a7426bf0-43cd-4eb5-943c-7995b23a5b4b" align="center" width="200px"> | <img src="https://github.com/sownteedev/TeVim/assets/90148193/49100402-f82c-40e3-9197-debdc04a0e54" align="center" width="200px"> | <img src="https://github.com/sownteedev/TeVim/assets/90148193/7ec88e9b-5e40-475c-b765-82cc83571dd5" align="center" width="200px"> | <img src="https://github.com/sownteedev/TeVim/assets/90148193/2148b26a-b799-426b-89ec-5ceda8a1006b" align="center" width="200px"> |
| <img src="https://github.com/theayusharma/NeoVim/assets/90148193/c4fe9259-0714-4247-8c95-9cec37c0c697" align="center" width="200px"> | <img src="https://github.com/sownteedev/TeVim/assets/90148193/073d64fd-f049-43a4-903d-6fde8ab1fbe3" align="center" width="200px"> | <img src="https://github.com/sownteedev/TeVim/assets/90148193/a77bc174-cc25-4610-9c58-32590ad8c577" align="center" width="200px"> | <img src="https://github.com/sownteedev/TeVim/assets/90148193/2ff7f908-51e7-4214-9609-9c4b72da8f90" align="center" width="200px"> |
| <img src="https://github.com/theayusharma/NeoVim/assets/90148193/c9bc8b70-1912-4700-8f8c-928493189805" align="center" width="200px"> | <img src="https://github.com/sownteedev/TeVim/assets/90148193/974c9cec-5479-49a1-9d37-05e82749ac97" align="center" width="200px"> | <img src="https://github.com/sownteedev/TeVim/assets/90148193/eabb7fba-1596-44ec-b93c-98fb2244c911" align="center" width="200px"> | <img src="https://github.com/sownteedev/TeVim/assets/90148193/f7502d7c-fe4b-4970-899c-d32cd83bec73" align="center" width="200px"> |

</details>

## 🔎 Requirements

- Neovim >= v0.11.+ .

- Nerd Font as your terminal font.

- `Ripgrep` and `Fzf` are required for grep searching with Fzf-lua.

- `GCC (Clang)`, **Windows** users must have `mingw` installed and set on PATH.

- `Lazygit` and `Ranger` (OPTIONAL).

- `Xsel` and `Xclip` for copy and paste (X11), `wl-clipboard` (Wayland) (OPTIONAL).

## ⬇️  Installation

#### Linux
- Backup your config
  ```zsh
  mv ~/.config/nvim ~/.config/nvim.bak
  ```
- Remove cache setup
  ```zsh
  rm -rf ~/.local/share/nvim ~/.local/state/nvim ~/.cache/nvim
  ```
- Install TeVim
  ```zsh
  git clone https://github.com/theayusharma/NeoVim ~/.config/nvim --depth 1 && nvim
  ```

- Adding Mason to PATH
  ```zsh
  # this is for zsh
  export PATH=$PATH:~/.local/share/nvim/mason/bin
  ```

#### Windows (PowerShell)
- Backup your config
  ```powershell
  Move-Item $env:LOCALAPPDATA\nvim $env:LOCALAPPDATA\nvim.bak
  ```
- Remove cache setup
  ```powershell
  Move-Item $env:LOCALAPPDATA\nvim-data $env:LOCALAPPDATA\nvim-data.bak
  ```
- Install TeVim
  ```powershell
  git clone https://github.com/theayusharma/NeoVim $env:LOCALAPPDATA\nvim --depth 1 && nvim
  ```

#### Custom Colorschemes
> Read file colorschemes on tevim/themes/schemes/ and write like it on custom/themes/schemes/

#### TeVim Commands
> **TeVimThemes** : Open list colorschemes
>
> **TeVimToggleTrans** : Toggle Transparency
>
> **TeVimCheckMason** : Install or Remove package you add or remove on custom/configs/overrides.lua
>
> **TeVimUpdate** : Update TeVim (If you have any problems, please create issues)

<br>

## Plugins

| Plugin                                                                              | Description                                                                 | Plugin                                                                                             | Description                                                                 |
| ----------------------------------------------------------------------------------- | --------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------- |
| [echasnovski/mini.nvim](https://github.com/echasnovski/mini.nvim)                     | Library of minimal, independent, and fast Lua modules                       | [nvim-tree/nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons)         | More devicons for neovim                                                    |
| [nvim-neo-tree/neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim)         | A very neat, simple and clean file tree and most features                   | [lukas-reineke/indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim) | Shows indent lines in neovim                                                |
| [nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | Syntax highlighting, most popular one for neovim                            | [folke/todo-comments.nvim](https://github.com/folke/todo-comments.nvim)               | Beautiful highlights for TODO comments                                      |
| [ibhagwan/fzf-lua](https://github.com/ibhagwan/fzf-lua)                               | An improved and tightly integrated fzf experience within Neovim             | [stevearc/dressing.nvim](https://github.com/stevearc/dressing.nvim)                   | A Neovim plugin to improve the default vim.ui interfaces                    |
| [numToStr/Comment.nvim](https://github.com/numToStr/Comment.nvim)                     | Quick and easy commenting                                                   | [folke/which-key.nvim](https://github.com/folke/which-key.nvim)                       | A Neovim plugin that shows a popup with keybindings                           |
| [akinsho/toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim)                 | Terminal integration in neovim                                              | [lewis6991/gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)                 | Super fast git decorations implemented purely in Lua                        |
| [RRethy/vim-illuminate](https://github.com/RRethy/vim-illuminate)                     | Highlights all instances of the word under the cursor                       | [kevinhwang91/ufo.nvim](https://github.com/kevinhwang91/ufo.nvim)                     | A Neovim plugin that provides a foldable and scrollable buffer              |
| [luukvbaal/statuscol.nvim](https://github.com/luukvbaal/statuscol.nvim)               | A configurable statuscolumn and click handlers                              | [hrsh7th/nvim-cmp](https://github.com/hrsh7th/nvim-cmp)                               | Autocompletion plugin for neovim                                            |
| [neovim/nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)                     | The most popular LSP client for neovim                                      | [catgoose/nvim-colorizer prev nvchad/~](https://github.com/catgoose/nvim-colorizer.lua)             | Highlights colors and is really frickin fast                                |
| [mg979/vim-visual-multi](https://github.com/mg979/vim-visual-multi)                   | A multiple cursors plugin for Vim and Neovim                                | [iamcco/markdown-preview.nvim](https://github.com/iamcco/markdown-preview.nvim)       | A markdown preview plugin for Vim and Neovim                                |
| [karb94/neoscroll.nvim](https://github.com/karb94/neoscroll.nvim)                     | A Neovim plugin that provides smooth scrolling                              | [pmizio/typescript-tools.nvim](https://github.com/pmizio/typescript-tools.nvim)       | A Neovim plugin for TypeScript development                                  |
| [windwp/nvim-ts-autotag](https://github.com/windwp/nvim-ts-autotag)                   | Automatically close and rename html tags                                    | [windwp/nvim-autopairs](https://github.com/windwp/nvim-autopairs)                     | Automatically close and rename brackets                                     |
| [rmagatti/auto-session](https://github.com/rmagatti/auto-session)                     | A session manager for Neovim                                                | [MunifTanjim/nui.nvim](https://github.com/MunifTanjim/nui.nvim)                       | A UI component library for Neovim                                           |
| [mattn/emmet-vim](https://github.com/mattn/emmet-vim)                                 | A Vim plugin that provides support for expanding abbreviations, similar to Emmet |


## Keybinds

| Keys        | Function          |
| ------------- |-------------|
| <kbd>CTRL</kbd> <kbd>h</kbd> / <kbd>j</kbd> / <kbd>k</kbd> / <kbd>l</kbd> | Moving Window Focus Towards Left/Up/Down/Right (Normal) |
| <kbd>CTRL</kbd> <kbd>h</kbd> / <kbd>j</kbd> / <kbd>k</kbd> / <kbd>l</kbd> | Moving Cursor Left/Up/Down/Right (Insert) |
| <kbd>CTRL</kbd> <kbd>e</kbd> | Toggle Explorer with Neotree |
| <kbd>CTRL</kbd> <kbd>`</kbd> | Open And Close ToggleTerm |`
| <kbd>ALT</kbd> / <kbd>⬇️</kbd> / <kbd>⬆️</kbd> | Moving Current Line or Lines Down/Up |
| <kbd>Enter</kbd> | Clear Highlight Search |

#### File Operations

| Keys        | Function          |
| ------------- |-------------|
| <kbd>LDR</kbd> <kbd>q</kbd> | Exit Neovim |
| <kbd>CTRL</kbd> <kbd>s</kbd> | Save File (N + I) |
| <kbd>CTRL</kbd> <kbd>q</kbd> | Close Current Buffer |
| <kbd>CTRL</kbd> <kbd>o</kbd> | Close Other Buffer |
| <kbd>TAB</kbd>               | Next Buffer |
| <kbd>SHIFT</kbd> <kbd>TAB</kbd> | Previous Buffer |
| <kbd>CTRL</kbd> <kbd>/</kbd> | Toggle Comment (N + I + V) |

#### Fzf-lua (Previously Telescope)

| Keys        | Function          |
| ------------- |-------------|
| <kbd>LDR</kbd> <kbd>f</kbd> <kbd>f</kbd> | Find Files |
| <kbd>LDR</kbd> <kbd>f</kbd> <kbd>r</kbd> | Find Recently Visited Files |
| <kbd>LDR</kbd> <kbd>f</kbd> <kbd>w</kbd> | Find File By String |
| <kbd>LDR</kbd> <kbd>f</kbd> <kbd>t</kbd> | TODO |

<br>

> More keybinds at [keybinds](https://github.com/theayusharma/Neovim/blob/master/Keybind.md)

<br>

<details><summary> <b>Credits</b></summary>

- [Original Guy sownteedev](https://github.com/sownteedev/TeVim) I used his config as my base config


</details>
