local ok, err = pcall(vim.cmd.colorscheme, "emerald-ocean")
if not ok then
  io.stderr:write(err .. "\n")
  os.exit(1)
end

local p = require("emerald-ocean.palette")
local normal = vim.api.nvim_get_hl(0, { name = "Normal" })
if vim.g.colors_name ~= "emerald-ocean" or string.format("#%06x", normal.bg) ~= p.abyss1 then
  io.stderr:write("emerald-ocean did not apply\n")
  os.exit(1)
end

print("emerald-ocean loads")
