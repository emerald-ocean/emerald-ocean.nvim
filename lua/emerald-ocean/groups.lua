local M = {}

local function blend(fg, bg, alpha)
  local function channel(hex, i)
    return tonumber(hex:sub(i, i + 1), 16)
  end
  local out = {}
  for _, i in ipairs({ 2, 4, 6 }) do
    out[#out + 1] = math.floor(alpha * channel(fg, i) + (1 - alpha) * channel(bg, i) + 0.5)
  end
  return string.format("#%02x%02x%02x", out[1], out[2], out[3])
end

local function editor(p)
  return {
    Normal = { fg = p.foam, bg = p.abyss },
    NormalNC = { link = "Normal" },
    NormalFloat = { fg = p.foam, bg = p.trench },
    FloatBorder = { fg = p.shoal, bg = p.trench },
    FloatTitle = { fg = p.emerald, bg = p.trench, bold = true },

    Cursor = { fg = p.abyss, bg = p.glow },
    lCursor = { link = "Cursor" },
    CursorIM = { link = "Cursor" },
    TermCursor = { link = "Cursor" },
    CursorLine = { bg = p.trench },
    CursorColumn = { bg = p.trench },
    ColorColumn = { bg = p.trench },
    CursorLineNr = { fg = p.foam, bg = p.trench, bold = true },
    LineNr = { fg = p.shoal },
    SignColumn = { fg = p.shoal },
    FoldColumn = { fg = p.shoal },
    Folded = { fg = p.silt, bg = p.trench },

    Visual = { bg = p.current },
    VisualNOS = { link = "Visual" },
    Search = { bg = blend(p.glow, p.abyss, 0.16) },
    CurSearch = { fg = p.abyss, bg = p.glow },
    IncSearch = { fg = p.abyss, bg = p.glow },
    Substitute = { fg = p.abyss, bg = p.glow },
    MatchParen = { fg = p.glow, bg = blend(p.glow, p.abyss, 0.20), bold = true },

    Pmenu = { fg = p.foam, bg = p.current },
    PmenuSel = { fg = p.white, bg = p.shoal },
    PmenuSbar = { bg = p.current },
    PmenuThumb = { bg = p.shoal },
    PmenuKind = { fg = p.seaglass, bg = p.current },
    PmenuExtra = { fg = p.silt, bg = p.current },
    WildMenu = { link = "PmenuSel" },

    StatusLine = { fg = p.foam, bg = p.trench },
    StatusLineNC = { fg = p.silt, bg = p.trench },
    WinSeparator = { fg = p.shoal },
    VertSplit = { link = "WinSeparator" },
    TabLine = { fg = p.silt, bg = p.trench },
    TabLineSel = { fg = p.foam, bg = p.abyss },
    TabLineFill = { bg = p.trench },
    WinBar = { fg = p.foam },
    WinBarNC = { fg = p.silt },

    Title = { fg = p.emerald, bold = true },
    Directory = { fg = p.tide },
    NonText = { fg = p.shoal },
    EndOfBuffer = { fg = p.shoal },
    Whitespace = { fg = p.shoal },
    SpecialKey = { fg = p.shoal },
    Conceal = { fg = p.silt },
    QuickFixLine = { bg = p.current },

    ErrorMsg = { fg = p.urchin },
    WarningMsg = { fg = p.coral },
    MoreMsg = { fg = p.emerald },
    ModeMsg = { fg = p.foam, bold = true },
    Question = { fg = p.emerald },

    SpellBad = { sp = p.urchin, undercurl = true },
    SpellCap = { sp = p.coral, undercurl = true },
    SpellLocal = { sp = p.glow, undercurl = true },
    SpellRare = { sp = p.anemone, undercurl = true },

    DiffAdd = { bg = blend(p.emerald, p.abyss, 0.15) },
    DiffChange = { bg = blend(p.glow, p.abyss, 0.10) },
    DiffDelete = { fg = p.urchin, bg = blend(p.urchin, p.abyss, 0.15) },
    DiffText = { bg = blend(p.glow, p.abyss, 0.25) },
    Added = { fg = p.emerald },
    Changed = { fg = p.glow },
    Removed = { fg = p.urchin },
  }
end

local function syntax(p)
  return {
    Comment = { fg = p.silt, italic = true },
    Constant = { fg = p.coral },
    String = { fg = p.white },
    Character = { fg = p.white },
    Number = { fg = p.coral },
    Boolean = { fg = p.coral },
    Float = { fg = p.coral },
    Identifier = { fg = p.foam },
    Function = { fg = p.emerald },
    Statement = { fg = p.verdigris },
    Conditional = { fg = p.verdigris },
    Repeat = { fg = p.verdigris },
    Label = { fg = p.verdigris },
    Operator = { fg = p.silt },
    Keyword = { fg = p.verdigris },
    Exception = { fg = p.verdigris },
    PreProc = { fg = p.anemone },
    Include = { fg = p.verdigris },
    Define = { fg = p.anemone },
    Macro = { fg = p.anemone },
    PreCondit = { fg = p.anemone },
    Type = { fg = p.seaglass },
    StorageClass = { fg = p.verdigris },
    Structure = { fg = p.verdigris },
    Typedef = { fg = p.verdigris },
    Special = { fg = p.glow },
    SpecialChar = { fg = p.glow },
    Tag = { fg = p.seaglass },
    Delimiter = { fg = p.silt },
    SpecialComment = { fg = p.silt, italic = true },
    Debug = { fg = p.coral },
    Underlined = { underline = true },
    Error = { fg = p.urchin },
    Todo = { fg = p.abyss, bg = p.coral },
  }
end

function M.get(p)
  local groups = {}
  for _, section in ipairs({ editor, syntax }) do
    for name, spec in pairs(section(p)) do
      groups[name] = spec
    end
  end
  return groups
end

return M
