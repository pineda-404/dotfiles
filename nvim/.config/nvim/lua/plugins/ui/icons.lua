-- Iconos: usa nvim-web-devicons en vez de mini.icons (mejor compatibilidad)
return {
  -- Deshabilitar mini.icons (viene por defecto en LazyVim)
  {
    "nvim-mini/mini.icons",
    enabled = false,
  },

  -- Activar nvim-web-devicons
  {
    "nvim-tree/nvim-web-devicons",
    enabled = true,
  },

  -- Ajuste extra de opciones de iconos de LazyVim
  {
    "LazyVim/LazyVim",
    opts = { icons = { lazy = false } },
  },
}
