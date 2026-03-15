-- Tema local obsidian-minimal (no es un plugin de GitHub)
-- El archivo del tema está en: ~/.config/nvim-lazyvim/colors/obsidian-minimal.lua
-- Usamos dofile() con ruta absoluta porque vim.cmd.colorscheme() falla
-- durante el arranque de lazy.nvim antes de que el rtp esté completamente estable
return {
  {
    "LazyVim/LazyVim",
    opts = function(_, opts)
      opts.colorscheme = function()
        dofile(vim.fn.stdpath("config") .. "/colors/obsidian-minimal.lua")
      end
    end,
  },
}
