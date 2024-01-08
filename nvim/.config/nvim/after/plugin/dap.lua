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
require("dap-vscode-js").setup({
    -- node_path = "node", -- Path of node executable. Defaults to $NODE_PATH, and then "node"
    -- debugger_path = "(runtimedir)/site/pack/packer/opt/vscode-js-debug", -- Path to vscode-js-debug installation.
    -- debugger_cmd = { "js-debug-adapter" }, -- Command to use to launch the debug server. Takes precedence over `node_path` and `debugger_path`.
    adapters = {
        -- Default
        "pwa-node",
        "pwa-chrome",
        "pwa-msedge",
        "pwa-extensionHost",
        --- Default
        "chrome",
        "node",
        "node-terminal"
    }
    -- log_file_path = "(stdpath cache)/dap_vscode_js.log" -- Path for file logging
    -- log_file_level = false -- Logging level for output to file. Set to false to disable file logging.
    -- log_console_level = vim.log.levels.ERROR -- Logging level for output to console. Set to false to disable console output.
})
local js_based_languages = {
    'typescript',
    'javascript',
    'typescriptreact',
    'javascriptreact',
    'vue',
    'cucumber'
}
for _, language in ipairs(js_based_languages) do
  require("dap").configurations[language] = {
    -- Debug a single Node.js file
    {
      type = 'pwa-node',
      request = 'launch',
      name = 'Launch Current File (pwa-node)',
      cwd = "${workspaceFolder}", -- vim.fn.getcwd(),
      args = { '${file}' },
      sourceMaps = true,
    },
    -- Debug running Node.js processes (they should have been run with --inspect)
    {
      type = 'pwa-node',
      request = 'attach',
      name = 'Attach to Node.js process',
      processId = require("dap.utils").pick_process,
      cwd = "${workspaceFolder}", -- vim.fn.getcwd(),
      sourceMaps = true,
    },
    ---- Debug client side web application
    {
      type = 'pwa-chrome',
      request = 'launch',
      name = 'Launch & Debug Chrome',
      url = function ()
        local co = coroutine.running()
        return coroutine.create(function ()
            vim.ui.input({
                prompt = "Enter URL:",
                default = "http://localhost:3000"
            },
            function (url)
                if url == nil or url == "" then
                    return
                else
                    coroutine.resume(co, url)
                end
            end)
        end)
      end,
      webRoot = "${workspaceFolder}", -- vim.fn.getcwd(),
      skipFiles = { "<node_internals/**/*.js" },
      protocol = "inspector",
      sourceMaps = true,
    },
    ---- Just divide default configs
    {
        type = "",
        name = "---- launch.json configs ----",
        request = "launch"
    }
  }
end

-- require('dap.ext.vscode').json_decode = require'json5'.parse
-- require('dap').set_log_level('DEBUG')
vim.keymap.set('n', '<leader>da', function()
    if vim.fn.filereadable(".vscode/launch.json") then
        require('dap.ext.vscode').load_launchjs(nil, {
            ['pwa_node'] = js_based_languages,
            ['node'] = js_based_languages,
            ['chrome'] = js_based_languages,
            ['pwa_chrome'] = js_based_languages
        })
    else
        print("Cannot find launch.json", vim.fn.getcwd())
    end
    require('dap').continue()
end)

-- Go
require("dap-go").setup({
})
