local function setup()
    require('nvim-treesitter').setup {
        -- Directory to install parsers and queries to (prepended to `runtimepath` to have priority)
        install_dir = vim.fn.stdpath('data') .. '/site'
    }
    require('nvim-treesitter').install { 'rust', 'cpp', 'lua', 'dot' }
    highlight = {
        enable = true, -- Enable highlighting
    }
end

return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  build = ':TSUpdate',
  config = setup,
}
