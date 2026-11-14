# emerald-ocean.nvim

A dark Neovim colorscheme coloured like the ocean when green beats blue: a green-black base taken from a breaking emerald wave, emerald keywords and functions, lagoon types, sea-blue packages and fields, foam-white values, glow-blue strings with emerald quotes and escapes, and bioluminescence where you are working: a blue glow for the cursor and pink jelly for the matching bracket and references.

The colours come from [emerald-ocean/palette](https://github.com/emerald-ocean/palette).

## Requirements

Neovim 0.10 or newer, with `termguicolors` enabled.

## Install

With [lazy.nvim](https://github.com/folke/lazy.nvim):

```lua
{
  "emerald-ocean/emerald-ocean.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd.colorscheme("emerald-ocean")
  end,
}
```

## Supported

- Tree-sitter captures, including white struct field declarations in Go
- LSP semantic tokens
- Diagnostics
- [blink.cmp](https://github.com/saghen/blink.cmp)
- [flash.nvim](https://github.com/folke/flash.nvim)
- [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)
- [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim): `options = { theme = "emerald-ocean" }`
- [nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui)
- [render-markdown.nvim](https://github.com/MeanderingProgrammer/render-markdown.nvim)
- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
- [trouble.nvim](https://github.com/folke/trouble.nvim)
- [which-key.nvim](https://github.com/folke/which-key.nvim)
- Plugins that derive their colours from the colorscheme (bufferline, oil, precognition, nvim-dap-virtual-text) pick it up automatically

## Yank flash

Neovim's yank highlight uses `IncSearch`, an emerald flash like the current search match:

```lua
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.hl.on_yank()
  end,
})
```

## Releases

Releases are automated with [release-please](https://github.com/googleapis/release-please). Every push to `main` updates a release PR with the next version, worked out from the conventional commit messages. Merging that PR tags `vX.Y.Z` and publishes a GitHub Release with the notes.

To follow releases instead of `main`, add `version = "*"` to the lazy.nvim spec.

## Development

`lua/emerald-ocean/palette.lua` is generated from [emerald-ocean/palette](https://github.com/emerald-ocean/palette); edit the palette there, not here. The palette version is pinned in the `Makefile`.

```sh
make generate         # regenerate palette.lua
make check-generated  # fail if palette.lua is out of date
make lint test
make update-palette VERSION=vX.Y.Z  # move to a new palette release
```

The `Palette sync` workflow checks daily (or on demand from the Actions tab) for a new palette release and opens a PR that bumps the version and regenerates `palette.lua`: `feat:` when the colours changed, `chore:` when they did not.

## License

MIT
