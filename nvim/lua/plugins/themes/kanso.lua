return {
  'webhooked/kanso.nvim',
  url = 'https://github.com/webhooked/kanso.nvim.git',
  lazy = false,
  priority = 1000,
  config = function()
    -- Llama a la función setup() ANTES de cargar el colorscheme
    require('kanso').setup {
      -- Opción 1 (Recomendada para i3): Fondo transparente
      -- Tu terminal (Alacritty, Kitty, etc.) controlará el color de fondo.
      transparent = true,

      -- Opción 2: Colores más vivos (para el contraste)
      -- Ataca tu problema de "colores tenues".
      foreground = 'default', -- "default" o "saturated"

      -- Opción 3: Asegurar la variante 'zen' (la más oscura)
      -- Ya estabas usando "kanso-zen", esto es el equivalente.
      background = {
        dark = 'zen', -- "zen", "ink", o "mist"
        light = 'pearl',
      },

      -- Opcional: también puedes hacer transparentes los menús flotantes
      styles = {
        float = 'transparent',
      },
    }

    -- Ahora carga el tema. Usar 'kanso' es suficiente
    -- ya que la variante "zen" se definió en setup().
    -- vim.cmd.colorscheme 'kanso'
  end,
}
