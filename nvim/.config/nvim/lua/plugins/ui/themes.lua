-- Colección de temas adicionales (cargados bajo demanda con lazy = true)
-- Puedes previsualizarlos y cambiarlos en vivo con <leader>uC o ejecutando :colorscheme <nombre>

return {
  -- 1. Gruvbox Material
  {
    "sainnhe/gruvbox-material",
    lazy = true,
    init = function()
      vim.g.gruvbox_material_background = "hard"
      vim.g.gruvbox_material_foreground = "material"
      vim.g.gruvbox_material_float_style = "dim"
      vim.g.gruvbox_material_ui_contrast = "high"
      vim.g.gruvbox_material_enable_italic = 1
      vim.g.gruvbox_material_better_performance = 1
      vim.g.gruvbox_material_transparent_background = 0
    end,
  },

  -- 2. Everforest
  {
    "sainnhe/everforest",
    lazy = true,
    init = function()
      vim.g.everforest_background = "hard"
      vim.g.everforest_enable_italic = 1
      vim.g.everforest_better_performance = 1
    end,
  },

  -- 3. Kanagawa (variantes: kanagawa, kanagawa-wave, kanagawa-dragon, kanagawa-lotus)
  {
    "rebelot/kanagawa.nvim",
    lazy = true,
    opts = {
      compile = false,
      undercurl = true,
      commentStyle = { italic = true },
      functionStyle = {},
      keywordStyle = { italic = true },
      statementStyle = { bold = true },
      typeStyle = {},
      transparent = false,
      dimInactive = false,
      terminalColors = true,
      theme = "wave",
      background = {
        dark = "wave",
        light = "lotus",
      },
    },
  },

  -- 4. Kanso (minimalista zen)
  {
    "webhooked/kanso.nvim",
    lazy = true,
    opts = {
      transparent = true,
      foreground = "default",
      background = {
        dark = "zen",
        light = "pearl",
      },
      styles = {
        float = "transparent",
      },
    },
  },

  -- 5. Rosé Pine (variantes: rose-pine, rose-pine-main, rose-pine-moon, rose-pine-dawn)
  {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = true,
    opts = {
      variant = "auto",
      dark_variant = "main",
      bold_vert_split = false,
      dim_nc_background = false,
      disable_background = false,
      disable_float_background = false,
      disable_italics = false,
      highlight_groups = {
        ColorColumn = { bg = "tertiary" },
        StatusLineNC = { fg = "subtle", bg = "none" },
        NormalNC = { bg = "none" },
      },
    },
  },
}
