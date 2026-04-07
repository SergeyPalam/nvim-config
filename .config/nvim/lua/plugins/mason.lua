return {
    "mason-org/mason.nvim",
    event = "VeryLazy",
    opts = {
        ui = {
            icons = {
                package_installed = "✓",
                package_pending = "➜",
                package_uninstalled = "✗"
            }
        },
        ensure_installed = {
            "rust-analyzer",
            "codelldb",
            "tree-sitter-cli",
            "ripgrep",
        }
    }
}
