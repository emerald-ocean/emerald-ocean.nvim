local M = {}

function M.load()
  if vim.g.colors_name then
    vim.cmd("highlight clear")
  end
  vim.o.background = "dark"
  vim.g.colors_name = "emerald-ocean"

  local p = require("emerald-ocean.palette")
  for name, spec in pairs(require("emerald-ocean.groups").get(p)) do
    vim.api.nvim_set_hl(0, name, spec)
  end

  local terminal = {
    p.trench,
    p.urchin,
    p.emerald,
    p.coral,
    p.tide,
    p.anemone,
    p.glow,
    p.foam,
    p.shoal,
    p.urchin,
    p.emerald,
    p.coral,
    p.tide,
    p.anemone,
    p.glow,
    p.white,
  }
  for i, color in ipairs(terminal) do
    vim.g["terminal_color_" .. (i - 1)] = color
  end
end

return M
