local function setup()
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      -- 1. Настройка источников (порядок имеет значение)
      cmp.setup({
        sources = cmp.config.sources({
          { name = "nvim_lsp" },      -- сначала подсказки от LSP
          { name = "luasnip" },       -- затем сниппеты
        }, {
          { name = "buffer" },        -- потом слова из буферов
          { name = "path" },          -- пути файлов
        }),

        -- 2. Настройка маппингов клавиш
        mapping = cmp.mapping.preset.insert({
          -- Перемещение по меню
          ["<C-n>"] = cmp.mapping.select_next_item(),
          ["<C-p>"] = cmp.mapping.select_prev_item(),
          -- Подтверждение выбранного пункта
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          -- Показать меню вручную, если не появилось
          ["<C-Space>"] = cmp.mapping.complete(),
          -- Если меню открыто – закрыть, иначе – обычный <Tab>
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        }),
      })
end

return {
    {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter", -- загружается при входе в режим вставки
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",      -- LSP источник
      "hrsh7th/cmp-buffer",        -- источник из открытых буферов
      "hrsh7th/cmp-path",          -- источник для путей файлов
      "L3MON4D3/LuaSnip",          -- движок сниппетов
      "saadparwaiz1/cmp_luasnip",  -- источник для сниппетов LuaSnip
    },
    config = setup
    },
    -- Отдельно настраиваем LuaSnip (сниппеты)
  {
    "L3MON4D3/LuaSnip",
    build = "make install_jsregexp", -- для лучшей производительности (опционально)
    dependencies = {
      "rafamadriz/friendly-snippets", -- готовые сниппеты для многих языков, включая Rust
    },
    config = function()
      require("luasnip").filetype_extend("rust", { "rust" }) -- явно указать
      -- Загружаем сниппеты из friendly-snippets
      require("luasnip.loaders.from_vscode").lazy_load()
    end,
  },
}
