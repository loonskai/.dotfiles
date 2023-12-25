local JS_DEBUG_PATH = '~/dev/microsoft/js-debug'
local js_based_languages = {
    'typescript',
    'javascript',
    'typescriptreact',
    'javascriptreact',
    'vue',
    'cucumber'
}
-- require('dap.ext.vscode').json_decode = require('json5').parse

require('mason').setup()
require('mason-nvim-dap').setup {
    ensure_installed = {
        'delve'
    }
}
-- DAP UI
local dap, dapui = require("dap"), require("dapui")
dapui.setup()
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

vim.keymap.set('n', '<Leader>ds', function() require('dap').continue() end)
vim.keymap.set('n', '<Leader>dj', function() require('dap').step_over() end)
vim.keymap.set('n', '<Leader>dl', function() require('dap').step_into() end)
vim.keymap.set('n', '<Leader>dh', function() require('dap').step_out() end)
vim.keymap.set('n', '<Leader>b', function() require('dap').toggle_breakpoint() end)
vim.keymap.set('n', '<Leader>B', function() require('dap').set_breakpoint() end)
vim.keymap.set('n', '<Leader>lp', function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
vim.keymap.set('n', '<Leader>dr', function() require('dap').repl.open() end)
-- vim.keymap.set('n', '<Leader>dl', function() require('dap').run_last() end)
vim.keymap.set({'n', 'v'}, '<Leader>dh', function() require('dap.ui.widgets').hover() end)
vim.keymap.set({'n', 'v'}, '<Leader>dp', function() require('dap.ui.widgets').preview() end)
-- vim.keymap.set('n', '<Leader>df', function() require('dap.ui.widgets').centered_float(widgets.frames) end)
-- vim.keymap.set('n', '<Leader>ds', function() require('dap.ui.widgets').centered_float(widgets.scopes) end)
-- TODO: map only when go filetype: vim.keymap.set('n', '<Leader>dt', function() require('dap-go').debug_test end)
require('nvim-dap-virtual-text').setup()

-- JS
vim.keymap.set('n', '<leader>da', function()
    require('dap.ext.vscode').load_launchjs(nil, {
        ['pwa_node'] = js_based_languages,
        ['node'] = js_based_languages,
        ['chrome'] = js_based_languages,
        ['pwa_chrome'] = js_based_languages
    })
    require('dap').continue()
end)

require("dap").adapters["pwa_node"] = {
    type = "server",
    host = "localhost",
    port = "${port}",
    executable = {
        command = "node",
        -- 💀 Make sure to update this path to point to your installation
        args = {string.format("%s/src/dapDebugServer.js", JS_DEBUG_PATH), "${port}"},
    }
}

-- Go
require("dap-go").setup({
    
})