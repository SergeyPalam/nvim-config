local function calc_size()
    return math.floor(vim.o.lines * 0.33)
end

local function setup()
    require("toggleterm").setup{
        size = calc_size,
        persist_size = false,
        direction = 'horizontal',        
        close_on_exit = true,
        auto_scroll = true,
        open_mapping = [[<c-\>]],
        autochdir = true,
    }
end

return {
    'akinsho/toggleterm.nvim',
    version = "*",
    config = setup,
}
