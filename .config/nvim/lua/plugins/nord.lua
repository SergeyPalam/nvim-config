local function setup()
    -- Example config in lua
    vim.g.nord_contrast = true
    vim.g.nord_cursorline_transparent = true
    -- Load the colorscheme
    require('nord').set({
        italics = {
            comments = true,
            functions = false,
            keywords = false,
            strings = true,
            variables = false,
        }
    })

    -- Bufferline init
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

end

return {
  "shaunsingh/nord.nvim",
  lazy = false,
  config = setup,
}
