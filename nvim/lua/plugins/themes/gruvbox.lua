return {
  'sainnhe/gruvbox-material',
  url = 'https://github.com/sainnhe/gruvbox-material.git',
  name = 'gruvbox-material',
  lazy = false,
  priority = 1000,
  config = function()
    -- Opciones de configuración para gruvbox-material
    vim.g.gruvbox_material_background = 'hard'
    vim.g.gruvbox_material_foreground = 'material'
    vim.g.gruvbox_material_float_style = 'dim'
    vim.g.gruvbox_material_ui_contrast = 'high'
    vim.g.gruvbox_material_enable_italic = 1
    vim.g.gruvbox_material_better_performance = 1

    -- --- Lógica para alternar transparencia ---
    vim.g.gruvbox_material_transparent_background = 2

    -- Para activar gruvbox, DESCOMENTA la siguiente línea y COMENTA la del otro tema
    vim.cmd.colorscheme 'gruvbox-material'

    local toggle_transparency = function()
      if vim.g.gruvbox_material_transparent_background == 0 then
        vim.g.gruvbox_material_transparent_background = 2
        print 'Fondo transparente: Habilitado'
      else
        vim.g.gruvbox_material_transparent_background = 0
        print 'Fondo transparente: Deshabilitado'
      end
      vim.cmd.colorscheme 'gruvbox-material'
    end

    vim.keymap.set('n', '<leader>bg', toggle_transparency,
      { noremap = true, silent = false, desc = 'Alternar transparencia de fondo' })
  end,
}
