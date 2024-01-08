require('mason-tool-installer').setup({
    ensure_installed = {
        'prettier'
    }
})
local js_based_languages = {
    'typescript',
    'javascript',
    'typescriptreact',
    'javascriptreact',
    'vue',
    'cucumber'
}

local formatters = {
    ["_"] = { "trim_whitespace" }
}
for _, lang in ipairs(js_based_languages) do
    formatters[lang] = { 'prettier' }
end

local conform = require("conform")
local format_options = {
        lsp_fallback = true,
        async = false,
        timeout_ms = 500,
}
conform.setup({
    formatters_by_ft = formatters,
    -- Format on save? format_on_save = format_options
})

vim.keymap.set({ "n", "v" }, "<leader>=", function()
    conform.format(format_options)
end)
