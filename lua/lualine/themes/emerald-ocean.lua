local p = require("emerald-ocean.palette")

local function mode(color)
  return {
    a = { fg = p.abyss1, bg = color, gui = "bold" },
    b = { fg = p.foam4, bg = p.abyss5 },
    c = { fg = p.foam4, bg = p.abyss2 },
  }
end

return {
  normal = mode(p.emerald4),
  insert = mode(p.biolume4),
  visual = mode(p.lagoon4),
  replace = mode(p.reef3),
  command = mode(p.reef4),
  terminal = mode(p.kelp4),
  inactive = {
    a = { fg = p.foam2, bg = p.abyss2 },
    b = { fg = p.foam2, bg = p.abyss2 },
    c = { fg = p.foam2, bg = p.abyss2 },
  },
}
