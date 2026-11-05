local p = require("emerald-ocean.palette")

local function mode(color)
  return {
    a = { fg = p.abyss, bg = color, gui = "bold" },
    b = { fg = p.foam, bg = p.shoal },
    c = { fg = p.foam, bg = p.trench },
  }
end

return {
  normal = mode(p.emerald),
  insert = mode(p.glow),
  visual = mode(p.seaglass),
  replace = mode(p.urchin),
  command = mode(p.coral),
  terminal = mode(p.verdigris),
  inactive = {
    a = { fg = p.silt, bg = p.trench },
    b = { fg = p.silt, bg = p.trench },
    c = { fg = p.silt, bg = p.trench },
  },
}
