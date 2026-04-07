local function setup()
-- Выполняем настройку
    defaults = {
        -- Глобальные настройки для всех пикеров (поисковиков)
        layout_config = {
            width = 0.75,    -- Ширина окна Telescope (в процентах)
        },
    }
    pickers = {
    -- Настройки, специфичные для конкретного пикера
        find_files = {
            hidden = true,     -- Показывать скрытые файлы
        },
    }
    -- Создаём локальную переменную для встроенных пикеров
    local builtin = require('telescope.builtin')

    -- Устанавливаем сочетания клавиш в нормальном режиме
    vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Найти файлы' })
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Найти текст (grep)' })
    vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Список буферов' })
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Справка' })
    vim.keymap.set('n', '<leader>fo', builtin.oldfiles, { desc = 'Недавние файлы' })
    -- Горячие клавиши для Telescope (интерактивный поиск)
    vim.keymap.set('n', '<leader>ld', builtin.lsp_definitions, { desc = '[LSP] Find Definitions (Telescope)' })
    vim.keymap.set('n', '<leader>lr', builtin.lsp_references, { desc = '[LSP] Find References (Telescope)' })
    vim.keymap.set('n', '<leader>ls', builtin.lsp_document_symbols, { desc = '[LSP] Document Symbols (Telescope)' })
end

return {
    'nvim-telescope/telescope.nvim', version = '*',
    dependencies = {
        'nvim-lua/plenary.nvim',
        -- optional but recommended
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    config = setup,
}
