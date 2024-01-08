vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function(use)
    use("wbthomason/packer.nvim")
    use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })
    use("nvim-treesitter/playground")
    use("mbbill/undotree")
    use("tpope/vim-fugitive")
    use({
        "iamcco/markdown-preview.nvim",
        run = function()
            vim.fn["mkdp#util#install"]()
        end
    })
    use("google/vim-jsonnet")
    use({
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    })
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }
    -- Formatting
    use("WhoIsSethDaniel/mason-tool-installer")
    use({"stevearc/conform.nvim"})
    -- Telescope
    use({
        "nvim-telescope/telescope.nvim",
        tag = "0.1.5", -- or , branch = "0.1.x",
        requires = { { "nvim-lua/plenary.nvim" } }
    })
    use("nvim-telescope/telescope-dap.nvim")
    -- Colorscheme - gruvbox
    use({
        "ellisonleao/gruvbox.nvim",
        as = "gruvbox",
        config = function()
            vim.cmd.colorscheme("gruvbox")
        end
    })
    -- Grammar check
    use("rhysd/vim-grammarous")
    -- LSP & Autocomplete
    use {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
        {
            "hrsh7th/nvim-cmp", -- Autocomplete
            requires = {
                "hrsh7th/cmp-nvim-lsp",
                "hrsh7th/cmp-buffer",
                "hrsh7th/cmp-path",
                "L3MON4D3/LuaSnip",
                "saadparwaiz1/cmp_luasnip"
            }
        }
    }
    -- DAP
    use { "mfussenegger/nvim-dap" }
    use { "rcarriga/nvim-dap-ui" }
    use { "theHamsta/nvim-dap-virtual-text" }
    use { "jay-babu/mason-nvim-dap.nvim" }
    -- DAP Go
    use { "leoluz/nvim-dap-go" }
    -- DAP JS
    use {
        "microsoft/vscode-js-debug",
        opt = true,
        run = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out"
    }
    use { "mxsdev/nvim-dap-vscode-js",
        requires = { "mfussenegger/nvim-dap" },
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
    }
    use({ "Joakker/lua-json5", run = "./install.sh" })
    -- Harpoon
    use("nvim-lua/plenary.nvim")
    use({
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        requires = { { "nvim-lua/plenary.nvim" } }
    })
end)
