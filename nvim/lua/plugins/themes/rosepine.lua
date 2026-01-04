return {
  'rose-pine/neovim',
  name = 'rose-pine',
  lazy = false,
  priority = 1000,
  config = function()
    require('rose-pine').setup {
      variant = 'auto',
      dark_variant = 'main',
      bold_vert_split = false,
      dim_nc_background = false,
      disable_background = false,
      disable_float_background = false,
      disable_italics = false,
      highlight_groups = {
        ColorColumn = { bg = 'tertiary' },
        StatusLineNC = { fg = 'subtle', bg = 'none' },
        NormalNC = { bg = 'none' },
      },
    }
    -- Para activar Rose Pine, DESCOMENTA la siguiente línea y COMENTA las de los otros temas
    -- vim.cmd 'colorscheme rose-pine'
  end,
}
