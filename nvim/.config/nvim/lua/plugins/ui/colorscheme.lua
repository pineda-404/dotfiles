-- Tema local obsidian-minimal (no es un plugin de GitHub)
-- El archivo del tema está en: colors/obsidian-minimal.lua
-- Usamos dofile() porque es un tema local dentro de stdpath("config")
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
