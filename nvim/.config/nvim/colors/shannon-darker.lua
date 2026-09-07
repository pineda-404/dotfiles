-- Shannon-Darker Colorscheme for Neovim
-- Variante con fondo más oscuro (Deep Charcoal / Black) de Shannon
-- Diseñada para máxima comodidad y contraste al leer archivos .md
-- Archivo: ~/.config/nvim/colors/shannon-darker.lua

vim.cmd("hi clear")
if vim.fn.exists("syntax_on") then
  vim.cmd("syntax reset")
end

vim.o.termguicolors = true
vim.g.colors_name = "shannon-darker"

-- Paleta estrictamente acotada con fondo más oscuro
local colors = {
  -- Base de la muestra (Darker Elevation)
  bg = "#0d0d0d",          -- Fondo general del editor (más oscuro que #151515)
  bg_dark = "#080808",     -- Fondo flotante / popups
  bg_code = "#141414",     -- Fondo de bloques de código (elevado sobre #0d0d0d)
  bg_chip = "#1c1c1c",     -- Fondo de chips inline y encabezado de tablas
  border = "#242424",      -- Bordes de tabla y separadores
  cursor_line = "#181818", -- Línea del cursor
  selection = "#242424",   -- Selección visual

  -- Textos de la muestra
  fg = "#f0efec",          -- Texto normal / párrafos / negritas (blanco hueso)
  fg_code = "#eaecf0",     -- Texto dentro del bloque de código (blanco azulado)
  coral = "#bf5f62",       -- Chips de código inline / acento principal (Color alterno: #b74b4f)
  comment = "#7e7e7e",     -- Comentarios y texto atenuado
  gutter = "#3a3a3a",      -- Números de línea

  -- Los 2 acentos armónicos
  yellow = "#e0a96d",      -- H1, funciones, advertencias (ámbar cálido)
  green = "#87b38d",       -- H2-H6, strings, git add (verde salvia)
}

local hl = vim.api.nvim_set_hl

-- 1. UI Base (Limpia y sin bloat)
hl(0, "Normal", { fg = colors.fg, bg = colors.bg })
hl(0, "NormalFloat", { fg = colors.fg, bg = colors.bg_dark })
hl(0, "FloatBorder", { fg = colors.border, bg = colors.bg_dark })
hl(0, "Cursor", { fg = colors.bg, bg = colors.fg })
hl(0, "CursorLine", { bg = colors.cursor_line })
hl(0, "CursorColumn", { bg = colors.cursor_line })
hl(0, "ColorColumn", { bg = colors.bg_code })
hl(0, "LineNr", { fg = colors.gutter })
hl(0, "CursorLineNr", { fg = colors.yellow, bold = true })
hl(0, "SignColumn", { fg = colors.gutter, bg = colors.bg })
hl(0, "VertSplit", { fg = colors.border })
hl(0, "WinSeparator", { fg = colors.border })
hl(0, "Folded", { fg = colors.comment, bg = colors.bg_chip })
hl(0, "FoldColumn", { fg = colors.comment })
hl(0, "NonText", { fg = colors.gutter })
hl(0, "Whitespace", { fg = colors.border })
hl(0, "EndOfBuffer", { fg = colors.bg })

-- Búsqueda y Selección
hl(0, "Search", { fg = colors.bg, bg = colors.yellow })
hl(0, "IncSearch", { fg = colors.bg, bg = colors.coral, bold = true })
hl(0, "CurSearch", { fg = colors.bg, bg = colors.coral, bold = true })
hl(0, "Visual", { bg = colors.selection })

-- Menús y Barras
hl(0, "Pmenu", { fg = colors.fg, bg = colors.bg_chip })
hl(0, "PmenuSel", { fg = colors.fg, bg = colors.selection, bold = true })
hl(0, "PmenuSbar", { bg = colors.bg_code })
hl(0, "PmenuThumb", { bg = colors.gutter })
hl(0, "StatusLine", { fg = colors.fg_code, bg = colors.bg_code })
hl(0, "StatusLineNC", { fg = colors.comment, bg = colors.bg_dark })
hl(0, "TabLine", { fg = colors.comment, bg = colors.bg_dark })
hl(0, "TabLineFill", { bg = colors.bg_dark })
hl(0, "TabLineSel", { fg = colors.fg, bg = colors.bg, bold = true })

-- Mensajes y Diagnósticos
hl(0, "ModeMsg", { fg = colors.fg, bold = true })
hl(0, "MsgArea", { fg = colors.fg })
hl(0, "MoreMsg", { fg = colors.green })
hl(0, "Question", { fg = colors.green })
hl(0, "WarningMsg", { fg = colors.yellow })
hl(0, "ErrorMsg", { fg = colors.coral })
hl(0, "DiagnosticError", { fg = colors.coral })
hl(0, "DiagnosticWarn", { fg = colors.yellow })
hl(0, "DiagnosticInfo", { fg = colors.fg_code })
hl(0, "DiagnosticHint", { fg = colors.comment })

-- Git
hl(0, "DiffAdd", { fg = colors.green })
hl(0, "DiffChange", { fg = colors.yellow })
hl(0, "DiffDelete", { fg = colors.coral })
hl(0, "DiffText", { fg = colors.yellow, bg = colors.bg_chip })
hl(0, "GitSignsAdd", { fg = colors.green })
hl(0, "GitSignsChange", { fg = colors.yellow })
hl(0, "GitSignsDelete", { fg = colors.coral })

-- 2. Markdown Específico (Lectura óptima en fondo oscuro)

-- Tipografía y Párrafos
hl(0, "@markup.strong", { fg = colors.fg, bold = true })
hl(0, "@markup.italic", { fg = colors.fg, italic = true })
hl(0, "@markup.strikethrough", { fg = colors.comment, strikethrough = true })
hl(0, "@markup.quote", { fg = colors.comment, italic = true })
hl(0, "RenderMarkdownQuote", { fg = colors.comment, italic = true })
hl(0, "Bold", { bold = true })
hl(0, "Italic", { italic = true })

-- Encabezados (H1 Amarillo para título principal, H2-H6 Verde consistente para subtítulos)
hl(0, "@markup.heading", { fg = colors.green, bold = true })
hl(0, "@markup.heading.1.markdown", { fg = colors.yellow, bold = true })
hl(0, "@markup.heading.2.markdown", { fg = colors.green, bold = true })
hl(0, "@markup.heading.3.markdown", { fg = colors.green, bold = true })
hl(0, "@markup.heading.4.markdown", { fg = colors.green, bold = true })
hl(0, "@markup.heading.5.markdown", { fg = colors.green, bold = true })
hl(0, "@markup.heading.6.markdown", { fg = colors.green, bold = true })

hl(0, "RenderMarkdownH1", { fg = colors.yellow, bold = true })
hl(0, "RenderMarkdownH2", { fg = colors.green, bold = true })
hl(0, "RenderMarkdownH3", { fg = colors.green, bold = true })
hl(0, "RenderMarkdownH4", { fg = colors.green, bold = true })
hl(0, "RenderMarkdownH5", { fg = colors.green, bold = true })
hl(0, "RenderMarkdownH6", { fg = colors.green, bold = true })

-- Chips de Código Inline (Coral sobre pastilla oscura #1c1c1c)
hl(0, "@markup.raw", { fg = colors.coral, bg = colors.bg_chip })
hl(0, "@markup.raw.markdown_inline", { fg = colors.coral, bg = colors.bg_chip })
hl(0, "RenderMarkdownCodeInline", { fg = colors.coral, bg = colors.bg_chip })

-- Bloques de Código (Fondo #141414 con texto en blanco azulado #eaecf0)
hl(0, "@markup.raw.block.markdown", { fg = colors.fg_code, bg = colors.bg_code })
hl(0, "RenderMarkdownCode", { bg = colors.bg_code })
hl(0, "RenderMarkdownCodeFallback", { fg = colors.fg_code, bg = colors.bg_code })
hl(0, "RenderMarkdownCodeInfo", { fg = colors.fg_code, bg = colors.bg_code })
hl(0, "RenderMarkdownCodeBorder", { bg = colors.bg_code })

-- Tablas Markdown (Fondo #1c1c1c en cabecera y bordes sutiles #242424)
hl(0, "RenderMarkdownTableHead", { fg = colors.fg, bg = colors.bg_chip, bold = true })
hl(0, "RenderMarkdownTableRow", { fg = colors.fg, bg = colors.bg })
hl(0, "RenderMarkdownTableFill", { bg = colors.bg })
hl(0, "RenderMarkdownTableBorder", { fg = colors.border })

-- Enlaces y Listas
hl(0, "@markup.link.label.markdown_inline", { fg = colors.yellow, bold = true })
hl(0, "@markup.link.url.markdown", { fg = colors.comment, underline = true })
hl(0, "RenderMarkdownLink", { fg = colors.yellow })
hl(0, "@markup.list.markdown", { fg = colors.coral })
hl(0, "RenderMarkdownBullet", { fg = colors.coral })

-- 3. Resaltado de Código dentro de bloques
hl(0, "Comment", { fg = colors.comment, italic = true })
hl(0, "Constant", { fg = colors.coral })
hl(0, "String", { fg = colors.green })
hl(0, "Character", { fg = colors.green })
hl(0, "Number", { fg = colors.coral })
hl(0, "Boolean", { fg = colors.coral })
hl(0, "Float", { fg = colors.coral })
hl(0, "Identifier", { fg = colors.fg_code })
hl(0, "Function", { fg = colors.yellow })
hl(0, "Statement", { fg = colors.coral })
hl(0, "Conditional", { fg = colors.coral })
hl(0, "Repeat", { fg = colors.coral })
hl(0, "Operator", { fg = colors.coral })
hl(0, "Keyword", { fg = colors.coral })
hl(0, "Type", { fg = colors.yellow })
hl(0, "Delimiter", { fg = colors.fg_code })
hl(0, "Special", { fg = colors.fg_code })

-- Tree-sitter Tokens
hl(0, "@keyword", { fg = colors.coral })
hl(0, "@keyword.function", { fg = colors.coral })
hl(0, "@keyword.return", { fg = colors.coral })
hl(0, "@function", { fg = colors.yellow })
hl(0, "@function.call", { fg = colors.yellow })
hl(0, "@function.builtin", { fg = colors.yellow })
hl(0, "@type", { fg = colors.yellow })
hl(0, "@type.builtin", { fg = colors.yellow })
hl(0, "@type.definition", { fg = colors.fg_code })
hl(0, "@variable", { fg = colors.fg_code })
hl(0, "@variable.builtin", { fg = colors.fg_code })
hl(0, "@variable.parameter", { fg = colors.fg_code })
hl(0, "@variable.member", { fg = colors.fg_code })
hl(0, "@field", { fg = colors.fg_code })
hl(0, "@property", { fg = colors.fg_code })
hl(0, "@string", { fg = colors.green })
hl(0, "@number", { fg = colors.coral })
hl(0, "@boolean", { fg = colors.coral })
hl(0, "@constant", { fg = colors.coral })
hl(0, "@operator", { fg = colors.coral })
hl(0, "@punctuation.delimiter", { fg = colors.fg_code })
hl(0, "@punctuation.bracket", { fg = colors.fg_code })
hl(0, "@module", { fg = colors.fg_code })
hl(0, "@namespace", { fg = colors.fg_code })

-- LSP Tokens
hl(0, "@lsp.type.namespace", { fg = colors.fg_code })
hl(0, "@lsp.type.variable", { fg = colors.fg_code })
hl(0, "@lsp.type.parameter", { fg = colors.fg_code })
hl(0, "@lsp.type.property", { fg = colors.fg_code })
hl(0, "@lsp.type.type", { fg = colors.yellow })
hl(0, "@lsp.type.function", { fg = colors.yellow })
hl(0, "@lsp.typemod.variable.defaultLibrary", { fg = colors.fg_code })
hl(0, "@lsp.typemod.type.defaultLibrary", { fg = colors.yellow })

-- 4. Soporte UI Esencial
hl(0, "Directory", { fg = colors.yellow, bold = true })
hl(0, "NeoTreeDirectoryName", { fg = colors.yellow, bold = true })
hl(0, "NeoTreeDirectoryIcon", { fg = colors.yellow })
hl(0, "NeoTreeFileName", { fg = colors.fg })
hl(0, "NeoTreeGitModified", { fg = colors.yellow })
hl(0, "NeoTreeGitAdded", { fg = colors.green })
hl(0, "NeoTreeGitDeleted", { fg = colors.coral })

hl(0, "SnacksPickerDirectory", { fg = colors.yellow, bold = true })
hl(0, "SnacksPickerGitStatusModified", { fg = colors.yellow })
hl(0, "SnacksPickerGitStatusAdded", { fg = colors.green })
hl(0, "SnacksPickerGitStatusDeleted", { fg = colors.coral })

hl(0, "TelescopeNormal", { fg = colors.fg, bg = colors.bg_dark })
hl(0, "TelescopeBorder", { fg = colors.border, bg = colors.bg_dark })
hl(0, "TelescopePromptNormal", { fg = colors.fg, bg = colors.bg_dark })
hl(0, "TelescopePromptBorder", { fg = colors.border, bg = colors.bg_dark })
hl(0, "TelescopePromptTitle", { fg = colors.bg, bg = colors.coral, bold = true })
hl(0, "TelescopePreviewTitle", { fg = colors.bg, bg = colors.green, bold = true })
hl(0, "TelescopeResultsTitle", { fg = colors.bg, bg = colors.yellow, bold = true })
hl(0, "TelescopeSelection", { bg = colors.selection })
hl(0, "TelescopeMatching", { fg = colors.yellow, bold = true })
