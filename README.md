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
