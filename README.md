# Vigilia

*Vigilia*, Latin for "night watch" and the vigil kept before a feast, is a dark color theme of candlelight over a northern night: midnight navy, winter cream, gold, fjord blue, lichen green, vestment violet, ember and restrained rose.

The color hierarchy follows Catppuccin's soft-contrast approach but uses a different palette. Each common syntax role gets its own hue, accents sit at the same lightness as the text so they read as peers, and comments use a brighter steel blue (`#73899D`) for readability.

| Target | Path |
| --- | --- |
| Neovim | [`nvim/`](nvim) |
| Ghostty | [`ghostty/vigilia`](ghostty/vigilia) |
| oh-my-pi | [`omp/vigilia.json`](omp/vigilia.json) |
| tmux | [`tmux/vigilia.conf`](tmux/vigilia.conf) |

## Palette

| Role | Hex |
| --- | --- |
| Background | `#151E2C` |
| Surface | `#172333` |
| Text | `#DDD9CF` |
| Muted text | `#99A9B6` |
| Comments | `#73899D` |
| Keywords | `#F2CC70` |
| Strings | `#9ED99F` |
| Functions | `#85C7D7` |
| Types, modules | `#CBA9F3` |
| Properties | `#A5BCFF` |
| Parameters | `#EAA7BB` |
| Numbers, constants, built-ins | `#F5AB77` |
| Special accent | `#F0A0B5` |

## Neovim

Requires Neovim 0.9 or newer. No plugin dependencies.

The plugin lives in the `nvim/` subdirectory. With lazy.nvim, add that directory to the runtime path:

```lua
{
  "nick3842/vigilia",
  lazy = false,
  priority = 1000,
  config = function(plugin)
    vim.opt.rtp:append(plugin.dir .. "/nvim")
    require("vigilia").setup({
      transparent = false,
      italic_comments = true,
    })
    vim.cmd.colorscheme("vigilia")
  end,
}
```

From a local clone, point lazy.nvim at the subdirectory instead:

```lua
{ dir = "~/repos/vigilia/nvim", name = "vigilia", lazy = false, priority = 1000 }
```

### Options

```lua
require("vigilia").setup({
  transparent = false,
  italic_comments = true,
})
```

Call `setup()` before loading the colorscheme. To change options after loading,
call `setup()` again and reload the colorscheme. Each setup call starts from the
defaults. Transparency removes the main editor, gutter, floating-window, and
sidebar backgrounds; menus, selections, and other highlighted surfaces retain
their colors.

The palette is available as `require("vigilia").palette`.
See `:help vigilia` for the configuration reference.

Built-in integrations include Treesitter, semantic LSP tokens, diagnostics, GitSigns, Telescope, Neo-tree, nvim-tree, nvim-cmp, and which-key.

## Ghostty

Copy `ghostty/vigilia` into `~/.config/ghostty/themes/` and set:

```
theme = vigilia
```

## oh-my-pi

Copy `omp/vigilia.json` into `~/.omp/agent/themes/` and set it in `~/.omp/agent/config.yml`:

```yaml
theme:
  dark: vigilia
```

## tmux

```tmux
source-file ~/repos/vigilia/tmux/vigilia.conf
```

## Development

Run the headless Neovim checks from the repository root:

```sh
nvim --headless -u NONE -i NONE -l nvim/tests/smoke.lua
```

For Neovim 0.9, use:

```sh
nvim --headless -u NONE -i NONE -c "lua dofile('nvim/tests/smoke.lua')"
```

GitHub Actions runs the checks on the minimum supported Neovim version and on stable Neovim.

## License

Independent theme; no affiliation or endorsement implied.

[MIT](LICENSE) © 2026 Nick Stuart.
