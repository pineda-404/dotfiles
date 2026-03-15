-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Toggle "Modo Aprendizaje" (<leader>um)
-- ON  → sin autocompletado alguno (escribes todo tú a mano)
-- OFF → LSP completo + auto-imports + sugerencias de librerías
Snacks.toggle({
  name = "Learning Mode (disable completion)",
  get = function() return vim.b.completion == false end,
  set = function(state)
    vim.b.completion = not state
  end,
}):map("<leader>um")
