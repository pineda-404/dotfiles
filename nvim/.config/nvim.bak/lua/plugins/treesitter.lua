return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  config = function()
    local ok, configs = pcall(require, 'nvim-treesitter.configs')
    if not ok then return end
    configs.setup {
      ensure_installed = {
        'lua', 'python', 'javascript', 'typescript',
        'vimdoc', 'vim', 'regex', 'terraform', 'sql',
        'dockerfile', 'toml', 'json', 'java', 'groovy',
        'go', 'graphql', 'yaml', 'make', 'cmake',
        'markdown', 'markdown_inline', 'bash', 'tsx', 'css', 'html',
        -- 'gitignore', -- falla por incompatibilidad de rama (main vs master)
      },
      auto_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = { 'ruby' },
      },
      indent = { enable = true, disable = { 'ruby' } },
    }
  end,
}
