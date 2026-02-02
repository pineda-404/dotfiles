-- Obsidian Minimal Colorscheme for Neovim
-- Based on Kepano's Minimal theme for Obsidian
-- Place this file in ~/.config/nvim/colors/

vim.cmd("hi clear")
if vim.fn.exists("syntax_on") then
  vim.cmd("syntax reset")
end

vim.o.termguicolors = true
vim.g.colors_name = "obsidian-minimal"

-- Color palette from Obsidian Minimal theme.css (exact values)
local colors = {
  -- Base colors - Darker background
  bg = "#1a1a1a",
  bg_dark = "#1f1f1f",
  bg_light = "#333333",
  bg_highlight = "#404040",

  -- Foreground
  fg = "#d2d2d2",
  fg_dark = "#999999",
  fg_gutter = "#595959",

  -- Extended colors from theme.css
  red = "#d04255",
  orange = "#d5763f",
  yellow = "#e5b567",
  green = "#a8c373",
  cyan = "#73bbb2",
  blue = "#6c99bb",
  purple = "#b05279", -- Dark pink/rose for keywords
  pink = "#b05279",
  lilac = "#9e86c8", -- For numbers

  -- UI colors
  comment = "#595959",
  selection = "#404040",
  line_nr = "#595959",
  cursor_line = "#2d2d2d",
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

-- Status Line
hl(0, "StatusLine", { fg = colors.fg, bg = colors.bg_light })
hl(0, "StatusLineNC", { fg = colors.fg_dark, bg = colors.bg_dark })

-- Tab Line
hl(0, "TabLine", { fg = colors.fg_dark, bg = colors.bg_dark })
hl(0, "TabLineFill", { bg = colors.bg_dark })
hl(0, "TabLineSel", { fg = colors.fg, bg = colors.bg })

-- Window
hl(0, "WinBar", { fg = colors.fg, bg = colors.bg })
hl(0, "WinBarNC", { fg = colors.fg_dark, bg = colors.bg_dark })

-- Messages
hl(0, "ModeMsg", { fg = colors.fg })
hl(0, "MsgArea", { fg = colors.fg })
hl(0, "MoreMsg", { fg = colors.green })
hl(0, "Question", { fg = colors.green })
hl(0, "WarningMsg", { fg = colors.warning })
hl(0, "ErrorMsg", { fg = colors.error })

-- Diagnostics
hl(0, "DiagnosticError", { fg = colors.error })
hl(0, "DiagnosticWarn", { fg = colors.warning })
hl(0, "DiagnosticInfo", { fg = colors.info })
hl(0, "DiagnosticHint", { fg = colors.hint })
hl(0, "DiagnosticUnderlineError", { undercurl = true, sp = colors.error })
hl(0, "DiagnosticUnderlineWarn", { undercurl = true, sp = colors.warning })
hl(0, "DiagnosticUnderlineInfo", { undercurl = true, sp = colors.info })
hl(0, "DiagnosticUnderlineHint", { undercurl = true, sp = colors.hint })

-- Git Signs
hl(0, "DiffAdd", { fg = colors.git_add })
hl(0, "DiffChange", { fg = colors.git_change })
hl(0, "DiffDelete", { fg = colors.git_delete })
hl(0, "DiffText", { fg = colors.git_change, bg = colors.bg_highlight })
hl(0, "Added", { fg = colors.git_add })
hl(0, "Changed", { fg = colors.git_change })
hl(0, "Removed", { fg = colors.git_delete })

-- Syntax Highlighting - Standard groups
hl(0, "Comment", { fg = colors.comment, italic = true })
hl(0, "Constant", { fg = colors.lilac })
hl(0, "String", { fg = colors.green })
hl(0, "Character", { fg = colors.green })
hl(0, "Number", { fg = colors.lilac })
hl(0, "Boolean", { fg = colors.lilac })
hl(0, "Float", { fg = colors.lilac })
hl(0, "Identifier", { fg = colors.fg })
hl(0, "Function", { fg = colors.yellow })
hl(0, "Statement", { fg = colors.purple })
hl(0, "Conditional", { fg = colors.purple })
hl(0, "Repeat", { fg = colors.purple })
hl(0, "Label", { fg = colors.purple })
hl(0, "Operator", { fg = colors.red })
hl(0, "Keyword", { fg = colors.purple })
hl(0, "Exception", { fg = colors.purple })
hl(0, "PreProc", { fg = colors.purple })
hl(0, "Include", { fg = colors.purple })
hl(0, "Define", { fg = colors.purple })
hl(0, "Macro", { fg = colors.purple })
hl(0, "PreCondit", { fg = colors.purple })
hl(0, "Type", { fg = colors.yellow })
hl(0, "StorageClass", { fg = colors.purple })
hl(0, "Structure", { fg = colors.purple })
hl(0, "Typedef", { fg = colors.purple })
hl(0, "Special", { fg = colors.orange })
hl(0, "SpecialChar", { fg = colors.orange })
hl(0, "Tag", { fg = colors.purple })
hl(0, "Delimiter", { fg = colors.fg })
hl(0, "SpecialComment", { fg = colors.comment })
hl(0, "Debug", { fg = colors.orange })
hl(0, "Underlined", { underline = true })
hl(0, "Bold", { bold = true })
hl(0, "Italic", { italic = true })
hl(0, "Title", { fg = colors.yellow, bold = true })
hl(0, "Todo", { fg = colors.bg, bg = colors.yellow, bold = true })
hl(0, "Error", { fg = colors.error })

-- Treesitter Highlights
hl(0, "@keyword", { fg = colors.purple })
hl(0, "@keyword.function", { fg = colors.purple })
hl(0, "@keyword.return", { fg = colors.purple })
hl(0, "@keyword.operator", { fg = colors.purple })
hl(0, "@keyword.conditional", { fg = colors.purple })
hl(0, "@keyword.repeat", { fg = colors.purple })
hl(0, "@keyword.import", { fg = colors.purple })
hl(0, "@keyword.exception", { fg = colors.purple })

hl(0, "@function", { fg = colors.yellow })
hl(0, "@function.call", { fg = colors.fg })
hl(0, "@function.builtin", { fg = colors.pink }) -- print is white, like function calls
hl(0, "@function.method", { fg = colors.yellow })
hl(0, "@function.method.call", { fg = colors.fg })
hl(0, "@method", { fg = colors.yellow })
hl(0, "@method.call", { fg = colors.fg })

hl(0, "@type", { fg = colors.yellow })
hl(0, "@type.builtin", { fg = colors.cyan })
hl(0, "@type.definition", { fg = colors.yellow })
hl(0, "@class", { fg = colors.yellow })
hl(0, "@constructor", { fg = colors.yellow })

hl(0, "@variable", { fg = colors.fg })
hl(0, "@variable.builtin", { fg = colors.fg })
hl(0, "@variable.parameter", { fg = colors.fg })
hl(0, "@variable.member", { fg = colors.fg })
hl(0, "@parameter", { fg = colors.fg })
hl(0, "@field", { fg = colors.fg })
hl(0, "@property", { fg = colors.fg })

hl(0, "@attribute", { fg = colors.fg_dark })
hl(0, "@attribute.builtin", { fg = colors.fg_dark })
hl(0, "@decorator", { fg = colors.fg_dark })

hl(0, "@string", { fg = colors.green })
hl(0, "@string.documentation", { fg = colors.green })
hl(0, "@string.escape", { fg = colors.orange })
hl(0, "@string.regex", { fg = colors.orange })
hl(0, "@string.special", { fg = colors.orange })
hl(0, "@character", { fg = colors.green })

hl(0, "@number", { fg = colors.lilac })
hl(0, "@number.float", { fg = colors.lilac })
hl(0, "@boolean", { fg = colors.lilac })
hl(0, "@constant", { fg = colors.lilac })
hl(0, "@constant.builtin", { fg = colors.lilac })

hl(0, "@comment", { fg = colors.comment, italic = true })
hl(0, "@comment.documentation", { fg = colors.comment, italic = true })
hl(0, "@comment.error", { fg = colors.error })
hl(0, "@comment.warning", { fg = colors.warning })
hl(0, "@comment.todo", { fg = colors.bg, bg = colors.yellow, bold = true })
hl(0, "@comment.note", { fg = colors.cyan })

hl(0, "@punctuation", { fg = colors.fg })
hl(0, "@punctuation.delimiter", { fg = colors.fg })
hl(0, "@punctuation.bracket", { fg = colors.fg })
hl(0, "@punctuation.special", { fg = colors.fg })

hl(0, "@operator", { fg = colors.red })

hl(0, "@module", { fg = colors.fg })
hl(0, "@namespace", { fg = colors.fg })

-- LSP Semantic Tokens
hl(0, "@lsp.type.class", { fg = colors.yellow })
hl(0, "@lsp.type.decorator", { fg = colors.fg_dark })
hl(0, "@lsp.type.function", { fg = colors.yellow })
hl(0, "@lsp.type.method", { fg = colors.yellow })
hl(0, "@lsp.type.parameter", { fg = colors.fg })
hl(0, "@lsp.type.property", { fg = colors.fg })
hl(0, "@lsp.type.variable", { fg = colors.fg })
hl(0, "@lsp.mod.declaration", {})
hl(0, "@lsp.mod.definition", {})

-- Plugin Support: nvim-tree
hl(0, "NvimTreeNormal", { fg = colors.fg, bg = colors.bg_dark })
hl(0, "NvimTreeFolderName", { fg = colors.fg })
hl(0, "NvimTreeFolderIcon", { fg = colors.blue })
hl(0, "NvimTreeOpenedFolderName", { fg = colors.fg, bold = true })
hl(0, "NvimTreeRootFolder", { fg = colors.purple })
hl(0, "NvimTreeSpecialFile", { fg = colors.yellow })
hl(0, "NvimTreeIndentMarker", { fg = colors.fg_gutter })
hl(0, "NvimTreeGitDirty", { fg = colors.git_change })
hl(0, "NvimTreeGitNew", { fg = colors.git_add })
hl(0, "NvimTreeGitDeleted", { fg = colors.git_delete })

-- Plugin Support: Telescope
hl(0, "TelescopeNormal", { fg = colors.fg, bg = colors.bg_dark })
hl(0, "TelescopeBorder", { fg = colors.fg_gutter, bg = colors.bg_dark })
hl(0, "TelescopePromptNormal", { fg = colors.fg, bg = colors.bg_dark })
hl(0, "TelescopePromptBorder", { fg = colors.fg_gutter, bg = colors.bg_dark })
hl(0, "TelescopePromptTitle", { fg = colors.bg, bg = colors.purple })
hl(0, "TelescopePreviewTitle", { fg = colors.bg, bg = colors.green })
hl(0, "TelescopeResultsTitle", { fg = colors.bg, bg = colors.blue })
hl(0, "TelescopeSelection", { bg = colors.selection })
hl(0, "TelescopeSelectionCaret", { fg = colors.purple })
hl(0, "TelescopeMatching", { fg = colors.yellow, bold = true })

-- Plugin Support: GitSigns
hl(0, "GitSignsAdd", { fg = colors.git_add })
hl(0, "GitSignsChange", { fg = colors.git_change })
hl(0, "GitSignsDelete", { fg = colors.git_delete })

-- Plugin Support: IndentBlankline
hl(0, "IndentBlanklineChar", { fg = colors.bg_light })
hl(0, "IndentBlanklineContextChar", { fg = colors.fg_gutter })
hl(0, "IblIndent", { fg = colors.bg_light })
hl(0, "IblScope", { fg = colors.fg_gutter })

-- Plugin Support: Which-key
hl(0, "WhichKey", { fg = colors.purple })
hl(0, "WhichKeyGroup", { fg = colors.blue })
hl(0, "WhichKeyDesc", { fg = colors.fg })
hl(0, "WhichKeySeparator", { fg = colors.comment })
hl(0, "WhichKeyFloat", { bg = colors.bg_dark })

-- Plugin Support: Lazy
hl(0, "LazyH1", { fg = colors.bg, bg = colors.purple, bold = true })
hl(0, "LazyButton", { fg = colors.fg, bg = colors.bg_light })
hl(0, "LazyButtonActive", { fg = colors.bg, bg = colors.purple })
hl(0, "LazySpecial", { fg = colors.cyan })

-- Plugin Support: Mason
hl(0, "MasonNormal", { fg = colors.fg, bg = colors.bg_dark })
hl(0, "MasonHeader", { fg = colors.bg, bg = colors.purple, bold = true })
hl(0, "MasonHighlight", { fg = colors.cyan })
hl(0, "MasonHighlightBlock", { fg = colors.bg, bg = colors.green })
hl(0, "MasonHighlightBlockBold", { fg = colors.bg, bg = colors.green, bold = true })
hl(0, "MasonMuted", { fg = colors.comment })
hl(0, "MasonMutedBlock", { fg = colors.bg, bg = colors.comment })

-- Plugin Support: Cmp
hl(0, "CmpItemAbbr", { fg = colors.fg })
hl(0, "CmpItemAbbrDeprecated", { fg = colors.comment, strikethrough = true })
hl(0, "CmpItemAbbrMatch", { fg = colors.yellow, bold = true })
hl(0, "CmpItemAbbrMatchFuzzy", { fg = colors.yellow, bold = true })
hl(0, "CmpItemKind", { fg = colors.purple })
hl(0, "CmpItemMenu", { fg = colors.comment })
