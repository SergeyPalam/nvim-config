local function setup()
    extensions = {
        file_browser = {
        -- Включаем отображение Git-статуса
            git_status = true,
            -- Настраиваем отображение статистики
            display_stat = {
                size = true,   -- Показывать размер файла
                date = true,   -- Показывать дату изменения
                mode = true    -- Показывать права доступа
            },
        -- Дополнительно можно настроить ширину и выравнивание
        -- display_stat = {
        --   size = { width = 10, right_justify = true },
        --   date = { width = 12, right_justify = true }
        -- }
        }    
    }
    vim.keymap.set('n', '<leader>fb', '<cmd>Telescope file_browser<CR>')
end

return {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = setup,
}
