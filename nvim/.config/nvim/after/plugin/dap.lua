local JS_DEBUG_PATH = '~/dev/microsoft/js-debug'
local js_based_languages = {
    'typescript',
    'javascript',
    'typescriptreact',
    'javascriptreact',
    'vue',
    'cucumber'
}
require('dap.ext.vscode').json_decode = require('json5').parse

vim.keymap.set({'n', 'v'}, '<Leader>dh', function()
    require('dap.ui.widgets').hover()
end)

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

