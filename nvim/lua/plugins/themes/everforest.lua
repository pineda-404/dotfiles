return {
  'sainnhe/everforest',
  priority = 1000, -- Cargar al inicio para evitar parpadeos
  config = function()
    -- CONFIGURACIÓN:
    -- Everforest tiene 3 variantes de fondo: 'hard', 'medium', 'soft'
    -- 'hard': Fondo más oscuro (casi negro verdoso)
    -- 'medium': El estándar (gris verdoso equilibrado)
    -- 'soft': Más claro y lechoso (muy parecido a la imagen 3 que te gusta)
    vim.g.everforest_background = 'hard'

    -- Opcional: Mejores contrastes y rendimiento
    vim.g.everforest_enable_italic = 1
    vim.g.everforest_better_performance = 1

    -- ACTIVAR EL TEMA:
    -- vim.cmd.colorscheme 'everforest'
  end,
}
