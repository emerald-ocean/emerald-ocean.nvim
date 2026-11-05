# emerald-ocean.nvim

A dark Neovim colorscheme coloured like the ocean when green beats blue: a green-black base taken from a breaking emerald wave, emerald functions, kelp-green keywords, sea-glass types, and a white-blue bioluminescent glow that only appears where you are working (cursor, current search match, yank flash, matching bracket, references).

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
- [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)
- [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim): `options = { theme = "emerald-ocean" }`

## Yank flash

Neovim's yank highlight uses `IncSearch`, which glows:

```lua
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.hl.on_yank()
  end,
})
```

## License

MIT
