-- Esta es mi ex-configuracion.
-- return {
--   'nvim-lualine/lualine.nvim',
--   config = function()
--     local mode = {
--       'mode',
--       fmt = function(str)
--         return ' ' .. str
--         -- return ' ' .. str:sub(1, 1) -- displays only the first character of the mode
--       end,
--     }
--
--     local filename = {
--       'filename',
--       file_status = true, -- displays file status (readonly status, modified status)
--       path = 0,           -- 0 = just filename, 1 = relative path, 2 = absolute path
--     }
--
--     local hide_in_width = function()
--       return vim.fn.winwidth(0) > 100
--     end
--
--     local diagnostics = {
--       'diagnostics',
--       sources = { 'nvim_diagnostic' },
--       sections = { 'error', 'warn' },
--       symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' },
--       colored = false,
--       update_in_insert = false,
--       always_visible = false,
--       cond = hide_in_width,
--     }
--
--     local diff = {
--       'diff',
--       colored = false,
--       symbols = { added = ' ', modified = ' ', removed = ' ' }, -- changes diff symbols
--       cond = hide_in_width,
--     }
--     --[[  ]]
--     require('lualine').setup {
--       options = {
--         icons_enabled = true,
--         theme = 'gruvbox-material', -- Set theme based on environment variable
--         -- Some useful glyphs:
--         -- https://www.nerdfonts.com/cheat-sheet
--         --        
--         section_separators = { left = '', right = '' },
--         component_separators = { left = '', right = '' },
--         disabled_filetypes = { 'alpha', 'neo-tree' },
--         always_divide_middle = true,
--       },
--       sections = {
--         lualine_a = { mode },
--         lualine_b = { 'branch' },
--         lualine_c = { filename },
--         lualine_x = { diagnostics, diff, { 'encoding', cond = hide_in_width }, { 'filetype', cond = hide_in_width } },
--         lualine_y = { 'location' },
--         lualine_z = { 'progress' },
--       },
--       inactive_sections = {
--         lualine_a = {},
--         lualine_b = {},
--         lualine_c = { { 'filename', path = 1 } },
--         lualine_x = { { 'location', padding = 0 } },
--         lualine_y = {},
--         lualine_z = {},
--       },
--       tabline = {},
--       extensions = { 'fugitive' },
--     }
--   end,
-- }
-- Esta seria la nueva configuracion creada por Gemini
return {
  'nvim-lualine/lualine.nvim',
  config = function()
    local mode = {
      'mode',
      -- fmt = function(str) return ' ' .. str end, -- Tu versión original con icono

      -- Una versión más simple, solo la primera letra
      fmt = function(str)
        return str:sub(1, 1) -- 'N', 'I', 'V'
      end,
    }

    local filename = {
      'filename',
      file_status = true,
      path = 0, -- 0 = solo nombre de archivo
    }

    local hide_in_width = function()
      return vim.fn.winwidth(0) > 100
    end

    local diagnostics = {
      'diagnostics',
      sources = { 'nvim_diagnostic' },
      sections = { 'error', 'warn' },
      symbols = { error = ' ', warn = ' ' }, -- Iconos de error/warning
      colored = false,
      update_in_insert = false,
      always_visible = false,
      cond = hide_in_width,
    }

    local diff = {
      'diff',
      colored = false,
      symbols = { added = '+', modified = '~', removed = '-' }, -- Símbolos simples
      cond = hide_in_width,
    }

    require('lualine').setup {
      options = {
        icons_enabled = true,

        -- ▼▼ CAMBIO PRINCIPAL 1 ▼▼
        -- 'auto' usará los colores de tu tema 'kanso.nvim'
        theme = 'auto',
        -- ▲▲ CAMBIO PRINCIPAL 1 ▲▲

        -- ▼▼ CAMBIO PRINCIPAL 2 ▼▼
        -- Usa espacios para un look plano y minimalista
        section_separators = { left = ' ', right = ' ' },
        component_separators = { left = ' ', right = ' ' },
        -- ▲▲ CAMBIO PRINCIPAL 2 ▲▲

        disabled_filetypes = { 'alpha', 'neo-tree' },
        always_divide_middle = true,
      },
      sections = {
        -- lualine_a (Izquierda Lejana)
        lualine_a = { mode },

        -- lualine_b (Izquierda)
        lualine_b = { 'branch' },

        -- lualine_c (Centro)
        lualine_c = { filename },

        -- lualine_x (Derecha)
        lualine_x = { diagnostics, diff, { 'filetype', cond = hide_in_width } },

        -- lualine_y (Derecha)
        lualine_y = { 'location' },

        -- lualine_z (Derecha Lejana)
        lualine_z = { 'progress' },
      },
      inactive_sections = {
        lualine_c = { { 'filename', path = 1 } },
        lualine_x = { { 'location', padding = 0 } },
      },
      tabline = {},
      extensions = { 'fugitive' },
    }
  end,
}
