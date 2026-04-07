local function set_keymap()
    vim.keymap.set('n', '<C-Left>', ':NvimTreeFocus<CR>', { desc = 'Focus tree' })
    vim.keymap.set('n', '<C-Right>', '<C-w>l', { desc = 'Focus code' })
    vim.keymap.set('n', '<C-Down>', ':NvimTreeToggle<CR>', { desc = 'Toggle tree' })
end

local function setup()
    require("nvim-tree").setup({})
    vim.api.nvim_create_autocmd("VimEnter", {
      callback = function()
        local tree = require("nvim-tree.api")
        -- открываем дерево, но не переводим фокус в него (чтобы остаться в редакторе)
        tree.tree.toggle(false, false)
      end,
    })
    set_keymap()
end

return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = setup,
}
