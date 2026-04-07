local function setup()
    local highlights = require("nord").bufferline.highlights({
        italic = true,
        bold = true,
    })
    require("bufferline").setup({
        options = {
            separator_style = "thin",
        },
        highlights = highlights,
    })
    vim.api.nvim_set_keymap('n', '<A-Right>', ':BufferLineCycleNext<CR>', {noremap=true, silent=true})
    vim.api.nvim_set_keymap('n', '<A-Left>', ':BufferLineCyclePrev<CR>', {noremap=true, silent=true})
end

return {
    'akinsho/bufferline.nvim',
    version = "*",
    lazy = false,
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = setup
}
