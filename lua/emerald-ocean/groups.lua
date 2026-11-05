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

local function treesitter(p)
  return {
    ["@variable"] = { fg = p.foam },
    ["@variable.builtin"] = { fg = p.verdigris },
    ["@variable.parameter"] = { fg = p.foam, italic = true },
    ["@variable.parameter.builtin"] = { fg = p.verdigris, italic = true },
    ["@variable.member"] = { fg = p.tide },
    ["@variable.member.definition"] = { fg = p.white },
    ["@property"] = { fg = p.tide },

    ["@constant"] = { fg = p.coral },
    ["@constant.builtin"] = { fg = p.coral },
    ["@constant.macro"] = { fg = p.anemone },

    ["@module"] = { fg = p.tide, italic = true },
    ["@module.builtin"] = { fg = p.tide, italic = true },
    ["@label"] = { fg = p.verdigris },

    ["@string"] = { fg = p.white },
    ["@string.documentation"] = { fg = p.silt, italic = true },
    ["@string.regexp"] = { fg = p.glow },
    ["@string.escape"] = { fg = p.glow },
    ["@string.special"] = { fg = p.glow },
    ["@string.special.symbol"] = { fg = p.coral },
    ["@string.special.url"] = { fg = p.tide, underline = true },
    ["@character"] = { fg = p.white },
    ["@character.special"] = { fg = p.glow },
    ["@boolean"] = { fg = p.coral },
    ["@number"] = { fg = p.coral },
    ["@number.float"] = { fg = p.coral },

    ["@type"] = { fg = p.seaglass },
    ["@type.builtin"] = { fg = p.verdigris },
    ["@type.definition"] = { fg = p.white },
    ["@attribute"] = { fg = p.anemone },
    ["@attribute.builtin"] = { fg = p.anemone },

    ["@function"] = { fg = p.emerald },
    ["@function.builtin"] = { fg = p.emerald },
    ["@function.call"] = { fg = p.emerald },
    ["@function.macro"] = { fg = p.anemone },
    ["@function.method"] = { fg = p.emerald },
    ["@function.method.call"] = { fg = p.emerald },
    ["@constructor"] = { fg = p.seaglass },
    ["@constructor.lua"] = { fg = p.silt },

    ["@operator"] = { fg = p.silt },
    ["@keyword"] = { fg = p.verdigris },
    ["@keyword.directive"] = { fg = p.anemone },
    ["@keyword.directive.define"] = { fg = p.anemone },
    ["@punctuation.delimiter"] = { fg = p.silt },
    ["@punctuation.bracket"] = { fg = p.silt },
    ["@punctuation.special"] = { fg = p.silt },

    ["@comment"] = { fg = p.silt, italic = true },
    ["@comment.documentation"] = { fg = p.silt, italic = true },
    ["@comment.error"] = { fg = p.abyss, bg = p.urchin },
    ["@comment.warning"] = { fg = p.abyss, bg = p.coral },
    ["@comment.todo"] = { fg = p.abyss, bg = p.coral },
    ["@comment.note"] = { fg = p.abyss, bg = p.glow },

    ["@markup.heading"] = { fg = p.emerald, bold = true },
    ["@markup.strong"] = { bold = true },
    ["@markup.italic"] = { italic = true },
    ["@markup.strikethrough"] = { strikethrough = true },
    ["@markup.underline"] = { underline = true },
    ["@markup.quote"] = { fg = p.silt, italic = true },
    ["@markup.math"] = { fg = p.coral },
    ["@markup.link"] = { fg = p.tide },
    ["@markup.link.label"] = { fg = p.seaglass },
    ["@markup.link.url"] = { fg = p.tide, underline = true },
    ["@markup.raw"] = { fg = p.white },
    ["@markup.raw.block"] = { fg = p.foam },
    ["@markup.list"] = { fg = p.verdigris },
    ["@markup.list.checked"] = { fg = p.emerald },
    ["@markup.list.unchecked"] = { fg = p.silt },

    ["@diff.plus"] = { fg = p.emerald },
    ["@diff.minus"] = { fg = p.urchin },
    ["@diff.delta"] = { fg = p.glow },

    ["@tag"] = { fg = p.seaglass },
    ["@tag.builtin"] = { fg = p.verdigris },
    ["@tag.attribute"] = { fg = p.tide },
    ["@tag.delimiter"] = { fg = p.silt },
  }
end

local function lsp(p)
  return {
    ["@lsp.type.namespace"] = { link = "@module" },
    ["@lsp.type.type"] = { link = "@type" },
    ["@lsp.type.class"] = { link = "@type" },
    ["@lsp.type.struct"] = { link = "@type" },
    ["@lsp.type.interface"] = { link = "@type" },
    ["@lsp.type.enum"] = { link = "@type" },
    ["@lsp.type.typeParameter"] = { link = "@type" },
    ["@lsp.type.parameter"] = { link = "@variable.parameter" },
    ["@lsp.type.variable"] = { link = "@variable" },
    ["@lsp.type.property"] = { link = "@property" },
    ["@lsp.type.enumMember"] = { link = "@constant" },
    ["@lsp.type.function"] = { link = "@function" },
    ["@lsp.type.method"] = { link = "@function.method" },
    ["@lsp.type.macro"] = { link = "@function.macro" },
    ["@lsp.type.decorator"] = { link = "@attribute" },
    ["@lsp.type.keyword"] = { link = "@keyword" },
    ["@lsp.type.comment"] = { link = "@comment" },
    ["@lsp.type.string"] = { link = "@string" },
    ["@lsp.type.number"] = { link = "@number" },
    ["@lsp.type.operator"] = { link = "@operator" },
    ["@lsp.typemod.type.definition"] = { link = "@type.definition" },
    ["@lsp.typemod.type.defaultLibrary"] = { link = "@type.builtin" },
    ["@lsp.typemod.function.defaultLibrary"] = { link = "@function.builtin" },
    ["@lsp.typemod.variable.readonly"] = { link = "@constant" },
    ["@lsp.typemod.property.definition"] = { link = "@variable.member.definition" },

    LspReferenceText = { bg = blend(p.glow, p.abyss, 0.20) },
    LspReferenceRead = { link = "LspReferenceText" },
    LspReferenceWrite = { link = "LspReferenceText" },
    LspInlayHint = { fg = p.silt, italic = true },
    LspSignatureActiveParameter = { fg = p.glow, bold = true },
  }
end

local function diagnostics(p)
  local levels = { Error = p.urchin, Warn = p.coral, Info = p.glow, Hint = p.emerald, Ok = p.emerald }
  local groups = {}
  for level, color in pairs(levels) do
    groups["Diagnostic" .. level] = { fg = color }
    groups["DiagnosticVirtualText" .. level] = { fg = color, italic = true }
    groups["DiagnosticUnderline" .. level] = { sp = color, undercurl = true }
    groups["DiagnosticSign" .. level] = { fg = color }
    groups["DiagnosticFloating" .. level] = { fg = color }
  end
  groups.DiagnosticUnnecessary = { fg = p.silt }
  groups.DiagnosticDeprecated = { strikethrough = true }
  return groups
end

local function plugins(p)
  return {
    GitSignsAdd = { fg = p.emerald },
    GitSignsChange = { fg = p.glow },
    GitSignsDelete = { fg = p.urchin },
    GitSignsCurrentLineBlame = { fg = p.silt, italic = true },
  }
end

function M.get(p)
  local groups = {}
  for _, section in ipairs({ editor, syntax, treesitter, lsp, diagnostics, plugins }) do
    for name, spec in pairs(section(p)) do
      groups[name] = spec
    end
  end
  return groups
end

return M
