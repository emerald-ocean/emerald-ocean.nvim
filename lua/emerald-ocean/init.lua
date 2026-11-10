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
    p.abyss2,
    p.reef3,
    p.emerald4,
    p.reef4,
    p.sea4,
    p.anemone4,
    p.biolume4,
    p.foam4,
    p.abyss5,
    p.reef3,
    p.emerald4,
    p.reef4,
    p.sea5,
    p.anemone4,
    p.biolume4,
    p.foam5,
  }
  for i, color in ipairs(terminal) do
    vim.g["terminal_color_" .. (i - 1)] = color
  end
end

return M
