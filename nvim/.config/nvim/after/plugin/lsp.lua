vim.api.nvim_create_autocmd('LspAttach', {
    desc = 'LSP Actions',
    callback = function(event)
    -- Keybindings
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, {buffer=0})
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {buffer=0})
        vim.keymap.set('n', '<leader>dp', vim.diagnostic.goto_prev, {buffer=0})
        vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, {buffer=0})
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {buffer=0})
        vim.keymap.set('n', 'ga', vim.lsp.buf.code_action, {buffer=0})
        vim.keymap.set('n', '<leader>dp', vim.diagnostic.goto_prev, {buffer=0})
        vim.keymap.set('n', '<leader>dn', vim.diagnostic.goto_next, {buffer=0})
        vim.keymap.set('n', '<leader>dl', '<cmd>Telescope diagnostics<CR>', {buffer=0})
        vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, {buffer=0})
    end
})

require('mason').setup()
require('mason-lspconfig').setup {
    ensure_installed = {
        'lua_ls',
        'gopls',
        'eslint',
        'tsserver',
        'pyright',
        'rescriptls',
        'cucumber_language_server'
    }
}

local lspconfig = require('lspconfig')

lspconfig.lua_ls.setup {}
lspconfig.gopls.setup {
    on_attach = function()
    end
}
lspconfig.cucumber_language_server.setup{
    settings = {
        cucumber = {
            features = { "**/*.feature" },
            glue = { 
                "**/*.steps.ts",
                "**/*.step.ts"
            }
        }
    }
   -- on_attach = function(client, bufnr)
   --     vim.keymap.set('n', "<C-]>", vim.lsp.buf.definition, {buffer=0})
   --     vim.keymap.set('n', "gn", vim.diagnostic.goto_next, {buffer=0})
   --     vim.keymap.set('n', "gb", vim.diagnostic.goto_prev, {buffer=0})
   -- end
}
