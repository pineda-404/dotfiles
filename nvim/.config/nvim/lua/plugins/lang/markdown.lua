-- Soporte para Markdown
-- render-markdown.nvim: renderiza cabeceras, bloques de código, tablas en el buffer
return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-mini/mini.icons" },
    opts = {
      heading = {
        backgrounds = {}, -- Elimina la barra horizontal de fondo en H1, H2, etc. (Estilo limpio Obsidian)
      },
    },
  },
}
