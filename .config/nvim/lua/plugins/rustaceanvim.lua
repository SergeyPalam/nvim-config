local function setup()
      -- Расширяем capabilities для LSP-сервера (обязательно для rust-analyzer)
    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    vim.lsp.config("rust_analyzer", {
        capabilities = capabilities,
    })
end

return {
    'mrcjkb/rustaceanvim',
    version = '^8', -- Recommended
    lazy = false, -- This plugin is already lazy
    config = setup,
}
