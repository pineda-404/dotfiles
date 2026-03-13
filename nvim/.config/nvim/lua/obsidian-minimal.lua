-- Obsidian Minimal Theme for Neovim
-- Based on Kepano's Minimal theme for Obsidian

local M = {}

-- Color palette from Obsidian Minimal theme.css (exact values)
-- Default colors from line 41-42 of theme.css
local colors = {
  -- Base colors - Darker background
  bg = "#1a1a1a",        -- Darker gray, closer to Obsidian
  bg_dark = "#1f1f1f",   -- hsl(0, 0%, 13%) - bg2
  bg_light = "#333333",  -- hsl(0, 0%, 20%) - ui1
  bg_highlight = "#404040", -- hsl(0, 0%, 25%)

  -- Foreground - tx1, tx2, tx3 from CSS
  fg = "#d2d2d2",        -- hsl(0, 0%, 82%) - tx1
  fg_dark = "#999999",   -- hsl(0, 0%, 60%) - tx2
  fg_gutter = "#595959", -- hsl(0, 0%, 35%) - tx3

  -- Extended colors - EXACT from theme.css line 41-42
  red = "#d04255",
  orange = "#d5763f",
  yellow = "#e5b567",
  green = "#a8c373",
  cyan = "#73bbb2",
  blue = "#6c99bb",
  purple = "#b05279",    -- Dark pink/rose for keywords (def, class) - matches Obsidian
  pink = "#b05279",

  -- UI colors
  comment = "#595959",   -- tx3
  selection = "#404040",
  line_nr = "#595959",
  cursor_line = "#2d2d2d",

  -- Dividers
  divider = "#333333",

  -- Git colors
  git_add = "#a8c373",
  git_change = "#e5b567",
  git_delete = "#d04255",

  -- Diagnostic colors
  error = "#d04255",
  warning = "#d5763f",
  info = "#6c99bb",
  hint = "#73bbb2",
}

local function set_highlights()
  local hl = vim.api.nvim_set_hl

  -- Editor UI
  hl(0, "Normal", { fg = colors.fg, bg = colors.bg })
  hl(0, "NormalFloat", { fg = colors.fg, bg = colors.bg_dark })
  hl(0, "FloatBorder", { fg = colors.fg_gutter, bg = colors.bg_dark })
  hl(0, "Cursor", { fg = colors.bg, bg = colors.fg })
  hl(0, "CursorLine", { bg = colors.cursor_line })
  hl(0, "CursorColumn", { bg = colors.cursor_line })
  hl(0, "ColorColumn", { bg = colors.bg_light })
  hl(0, "LineNr", { fg = colors.line_nr })
  hl(0, "CursorLineNr", { fg = colors.yellow, bold = true })
  hl(0, "SignColumn", { fg = colors.fg_gutter, bg = colors.bg })
  hl(0, "VertSplit", { fg = colors.bg_highlight })
  hl(0, "WinSeparator", { fg = colors.bg_highlight })
  hl(0, "Folded", { fg = colors.comment, bg = colors.bg_light })
  hl(0, "FoldColumn", { fg = colors.comment })
  hl(0, "NonText", { fg = colors.fg_gutter })
  hl(0, "SpecialKey", { fg = colors.fg_gutter })
  hl(0, "Whitespace", { fg = colors.fg_gutter })
  hl(0, "EndOfBuffer", { fg = colors.bg })

  -- Search & Selection
  hl(0, "Search", { fg = colors.bg, bg = colors.yellow })
  hl(0, "IncSearch", { fg = colors.bg, bg = colors.orange })
  hl(0, "CurSearch", { fg = colors.bg, bg = colors.orange })
  hl(0, "Substitute", { fg = colors.bg, bg = colors.red })
  hl(0, "Visual", { bg = colors.selection })
  hl(0, "VisualNOS", { bg = colors.selection })

  -- Popup Menu
  hl(0, "Pmenu", { fg = colors.fg, bg = colors.bg_dark })
  hl(0, "PmenuSel", { fg = colors.fg, bg = colors.selection })
  hl(0, "PmenuSbar", { bg = colors.bg_light })
  hl(0, "PmenuThumb", { bg = colors.fg_gutter })

  -- Statusline & Tabline
  hl(0, "StatusLine", { fg = colors.fg, bg = colors.bg_light })
  hl(0, "StatusLineNC", { fg = colors.comment, bg = colors.bg_dark })
  hl(0, "TabLine", { fg = colors.comment, bg = colors.bg_dark })
  hl(0, "TabLineFill", { bg = colors.bg_dark })
  hl(0, "TabLineSel", { fg = colors.fg, bg = colors.bg })

  -- Messages
  hl(0, "ErrorMsg", { fg = colors.error })
  hl(0, "WarningMsg", { fg = colors.warning })
  hl(0, "ModeMsg", { fg = colors.fg, bold = true })
  hl(0, "MoreMsg", { fg = colors.cyan })
  hl(0, "Question", { fg = colors.cyan })

  -- Diff
  hl(0, "DiffAdd", { bg = "#2a3d2a" })
  hl(0, "DiffChange", { bg = "#3d3a2a" })
  hl(0, "DiffDelete", { fg = colors.red, bg = "#3d2a2a" })
  hl(0, "DiffText", { bg = "#4d4a3a" })

  -- Spelling
  hl(0, "SpellBad", { undercurl = true, sp = colors.error })
  hl(0, "SpellCap", { undercurl = true, sp = colors.warning })
  hl(0, "SpellRare", { undercurl = true, sp = colors.purple })
  hl(0, "SpellLocal", { undercurl = true, sp = colors.cyan })

  -- ===========================================
  -- SYNTAX HIGHLIGHTING (matches Obsidian Minimal)
  -- ===========================================

  -- Comments - Gray
  hl(0, "Comment", { fg = colors.comment, italic = true })

  -- Constants
  hl(0, "Constant", { fg = colors.purple })
  hl(0, "String", { fg = colors.green })
  hl(0, "Character", { fg = colors.green })
  hl(0, "Number", { fg = colors.purple })
  hl(0, "Boolean", { fg = colors.purple })
  hl(0, "Float", { fg = colors.purple })

  -- Identifiers
  hl(0, "Identifier", { fg = colors.fg })
  hl(0, "Function", { fg = colors.yellow })

  -- Statements - Purple for keywords (matching Obsidian)
  hl(0, "Statement", { fg = colors.purple })
  hl(0, "Conditional", { fg = colors.purple })
  hl(0, "Repeat", { fg = colors.purple })
  hl(0, "Label", { fg = colors.purple })
  hl(0, "Operator", { fg = colors.fg })
  hl(0, "Keyword", { fg = colors.purple })
  hl(0, "Exception", { fg = colors.purple })

  -- Preprocessor
  hl(0, "PreProc", { fg = colors.cyan })
  hl(0, "Include", { fg = colors.purple })
  hl(0, "Define", { fg = colors.purple })
  hl(0, "Macro", { fg = colors.cyan })
  hl(0, "PreCondit", { fg = colors.cyan })

  -- Types
  hl(0, "Type", { fg = colors.cyan })
  hl(0, "StorageClass", { fg = colors.purple })
  hl(0, "Structure", { fg = colors.purple })
  hl(0, "Typedef", { fg = colors.purple })

  -- Special
  hl(0, "Special", { fg = colors.orange })
  hl(0, "SpecialChar", { fg = colors.orange })
  hl(0, "Tag", { fg = colors.purple })
  hl(0, "Delimiter", { fg = colors.fg })
  hl(0, "SpecialComment", { fg = colors.comment })
  hl(0, "Debug", { fg = colors.orange })

  -- Underlined, Bold, Italic
  hl(0, "Underlined", { underline = true })
  hl(0, "Bold", { bold = true })
  hl(0, "Italic", { italic = true })

  -- Misc
  hl(0, "Title", { fg = colors.yellow, bold = true })
  hl(0, "Todo", { fg = colors.bg, bg = colors.yellow, bold = true })
  hl(0, "Error", { fg = colors.error })

  -- ===========================================
  -- TREESITTER HIGHLIGHTS (Python-specific)
  -- ===========================================

  -- Keywords - Purple (like Obsidian Minimal)
  hl(0, "@keyword", { fg = colors.purple })
  hl(0, "@keyword.function", { fg = colors.purple })
  hl(0, "@keyword.return", { fg = colors.purple })
  hl(0, "@keyword.operator", { fg = colors.purple })
  hl(0, "@keyword.conditional", { fg = colors.purple })
  hl(0, "@keyword.repeat", { fg = colors.purple })
  hl(0, "@keyword.import", { fg = colors.purple })
  hl(0, "@keyword.exception", { fg = colors.purple })

  -- Functions - Yellow for definitions, white/fg for calls
  hl(0, "@function", { fg = colors.yellow })
  hl(0, "@function.call", { fg = colors.fg }) -- Llamadas a función son blancas
  hl(0, "@function.builtin", { fg = colors.purple }) -- print, len, etc. are pink/rose
  hl(0, "@function.method", { fg = colors.yellow })
  hl(0, "@function.method.call", { fg = colors.fg }) -- Llamadas a método son blancas
  hl(0, "@method", { fg = colors.yellow })
  hl(0, "@method.call", { fg = colors.fg })

  -- Classes and Types - Yellow for class names
  hl(0, "@type", { fg = colors.yellow })
  hl(0, "@type.builtin", { fg = colors.cyan })
  hl(0, "@type.definition", { fg = colors.yellow })
  hl(0, "@class", { fg = colors.yellow })
  hl(0, "@constructor", { fg = colors.yellow })

  -- Variables and Parameters
  hl(0, "@variable", { fg = colors.fg })
  hl(0, "@variable.builtin", { fg = colors.fg }) -- self
  hl(0, "@variable.parameter", { fg = colors.fg })
  hl(0, "@variable.member", { fg = colors.fg })
  hl(0, "@parameter", { fg = colors.fg })
  hl(0, "@field", { fg = colors.fg })
  hl(0, "@property", { fg = colors.fg })

  -- Decorators - Gray/White (NOT yellow!)
  hl(0, "@attribute", { fg = colors.fg_dark })
  hl(0, "@attribute.builtin", { fg = colors.fg_dark })
  hl(0, "@decorator", { fg = colors.fg_dark })

  -- Strings - Green
  hl(0, "@string", { fg = colors.green })
  hl(0, "@string.documentation", { fg = colors.green })
  hl(0, "@string.escape", { fg = colors.orange })
  hl(0, "@string.regex", { fg = colors.orange })
  hl(0, "@string.special", { fg = colors.orange })
  hl(0, "@character", { fg = colors.green })

  -- Numbers and Constants - Lilac/Purple (#9e86c8)
  hl(0, "@number", { fg = "#9e86c8" }) -- Lilac for numbers
  hl(0, "@number.float", { fg = "#9e86c8" })
  hl(0, "@boolean", { fg = "#9e86c8" })
  hl(0, "@constant", { fg = "#9e86c8" })
  hl(0, "@constant.builtin", { fg = "#9e86c8" }) -- None, True, False

  -- Comments - Gray
  hl(0, "@comment", { fg = colors.comment, italic = true })
  hl(0, "@comment.documentation", { fg = colors.comment, italic = true })
  hl(0, "@comment.error", { fg = colors.error })
  hl(0, "@comment.warning", { fg = colors.warning })
  hl(0, "@comment.todo", { fg = colors.bg, bg = colors.yellow, bold = true })
  hl(0, "@comment.note", { fg = colors.cyan })

  -- Punctuation
  hl(0, "@punctuation", { fg = colors.fg })
  hl(0, "@punctuation.delimiter", { fg = colors.fg })
  hl(0, "@punctuation.bracket", { fg = colors.fg })
  hl(0, "@punctuation.special", { fg = colors.fg })

  -- Operators - Red
  hl(0, "@operator", { fg = colors.red })

  -- Modules and Namespaces
  hl(0, "@module", { fg = colors.fg })
  hl(0, "@namespace", { fg = colors.fg })

  -- ===========================================
  -- LSP SEMANTIC TOKENS
  -- ===========================================
  hl(0, "@lsp.type.class", { fg = colors.yellow })
  hl(0, "@lsp.type.decorator", { fg = colors.fg_dark })
  hl(0, "@lsp.type.function", { fg = colors.yellow })
  hl(0, "@lsp.type.method", { fg = colors.yellow })
  hl(0, "@lsp.type.parameter", { fg = colors.fg })
  hl(0, "@lsp.type.property", { fg = colors.fg })
  hl(0, "@lsp.type.variable", { fg = colors.fg })

  -- ===========================================
  -- DIAGNOSTICS
  -- ===========================================
  hl(0, "DiagnosticError", { fg = colors.error })
  hl(0, "DiagnosticWarn", { fg = colors.warning })
  hl(0, "DiagnosticInfo", { fg = colors.info })
  hl(0, "DiagnosticHint", { fg = colors.hint })
  hl(0, "DiagnosticUnderlineError", { undercurl = true, sp = colors.error })
  hl(0, "DiagnosticUnderlineWarn", { undercurl = true, sp = colors.warning })
  hl(0, "DiagnosticUnderlineInfo", { undercurl = true, sp = colors.info })
  hl(0, "DiagnosticUnderlineHint", { undercurl = true, sp = colors.hint })
  hl(0, "DiagnosticVirtualTextError", { fg = colors.error, bg = "#2d2020" })
  hl(0, "DiagnosticVirtualTextWarn", { fg = colors.warning, bg = "#2d2820" })
  hl(0, "DiagnosticVirtualTextInfo", { fg = colors.info, bg = "#202830" })
  hl(0, "DiagnosticVirtualTextHint", { fg = colors.hint, bg = "#202830" })

  -- ===========================================
  -- GIT SIGNS
  -- ===========================================
  hl(0, "GitSignsAdd", { fg = colors.git_add })
  hl(0, "GitSignsChange", { fg = colors.git_change })
  hl(0, "GitSignsDelete", { fg = colors.git_delete })

  -- ===========================================
  -- INDENT BLANKLINE
  -- ===========================================
  hl(0, "IblIndent", { fg = colors.bg_highlight })
  hl(0, "IblScope", { fg = colors.fg_gutter })

  -- ===========================================
  -- TELESCOPE
  -- ===========================================
  hl(0, "TelescopeNormal", { fg = colors.fg, bg = colors.bg_dark })
  hl(0, "TelescopeBorder", { fg = colors.fg_gutter, bg = colors.bg_dark })
  hl(0, "TelescopePromptNormal", { fg = colors.fg, bg = colors.bg_light })
  hl(0, "TelescopePromptBorder", { fg = colors.bg_light, bg = colors.bg_light })
  hl(0, "TelescopePromptTitle", { fg = colors.bg, bg = colors.pink })
  hl(0, "TelescopePreviewTitle", { fg = colors.bg, bg = colors.green })
  hl(0, "TelescopeResultsTitle", { fg = colors.bg, bg = colors.cyan })
  hl(0, "TelescopeSelection", { fg = colors.fg, bg = colors.selection })
  hl(0, "TelescopeMatching", { fg = colors.yellow, bold = true })

  -- ===========================================
  -- NEO-TREE
  -- ===========================================
  hl(0, "NeoTreeNormal", { fg = colors.fg, bg = colors.bg_dark })
  hl(0, "NeoTreeNormalNC", { fg = colors.fg, bg = colors.bg_dark })
  hl(0, "NeoTreeDirectoryName", { fg = colors.fg })
  hl(0, "NeoTreeDirectoryIcon", { fg = colors.cyan })
  hl(0, "NeoTreeRootName", { fg = colors.yellow, bold = true })
  hl(0, "NeoTreeFileName", { fg = colors.fg })
  hl(0, "NeoTreeFileIcon", { fg = colors.fg })
  hl(0, "NeoTreeGitAdded", { fg = colors.git_add })
  hl(0, "NeoTreeGitModified", { fg = colors.git_change })
  hl(0, "NeoTreeGitDeleted", { fg = colors.git_delete })
  hl(0, "NeoTreeGitConflict", { fg = colors.red })
  hl(0, "NeoTreeGitUntracked", { fg = colors.orange })

  -- ===========================================
  -- BUFFERLINE
  -- ===========================================
  hl(0, "BufferLineFill", { bg = colors.bg_dark })
  hl(0, "BufferLineBackground", { fg = colors.comment, bg = colors.bg_dark })
  hl(0, "BufferLineBufferSelected", { fg = colors.fg, bg = colors.bg, bold = true })
  hl(0, "BufferLineBufferVisible", { fg = colors.fg_dark, bg = colors.bg_light })

  -- ===========================================
  -- WHICH-KEY
  -- ===========================================
  hl(0, "WhichKey", { fg = colors.pink })
  hl(0, "WhichKeyGroup", { fg = colors.cyan })
  hl(0, "WhichKeyDesc", { fg = colors.fg })
  hl(0, "WhichKeySeparator", { fg = colors.comment })
  hl(0, "WhichKeyFloat", { bg = colors.bg_dark })

  -- ===========================================
  -- CMP (Autocompletion)
  -- ===========================================
  hl(0, "CmpItemAbbr", { fg = colors.fg })
  hl(0, "CmpItemAbbrMatch", { fg = colors.yellow, bold = true })
  hl(0, "CmpItemAbbrMatchFuzzy", { fg = colors.yellow })
  hl(0, "CmpItemKind", { fg = colors.cyan })
  hl(0, "CmpItemMenu", { fg = colors.comment })

  -- ===========================================
  -- MARKDOWN
  -- ===========================================
  hl(0, "@markup.heading", { fg = colors.yellow, bold = true })
  hl(0, "@markup.heading.1", { fg = colors.yellow, bold = true })
  hl(0, "@markup.heading.2", { fg = colors.yellow, bold = true })
  hl(0, "@markup.heading.3", { fg = colors.yellow, bold = true })
  hl(0, "@markup.link", { fg = colors.cyan })
  hl(0, "@markup.link.url", { fg = colors.blue, underline = true })
  hl(0, "@markup.list", { fg = colors.pink })
  hl(0, "@markup.raw", { fg = colors.green })
  hl(0, "@markup.strong", { bold = true })
  hl(0, "@markup.italic", { italic = true })
end

function M.setup()
  vim.cmd("hi clear")
  if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
  end

  vim.o.termguicolors = true
  vim.g.colors_name = "obsidian-minimal"

  set_highlights()
end

return M
