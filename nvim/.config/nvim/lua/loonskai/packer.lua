vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	use({
		'nvim-telescope/telescope.nvim', 
		tag = '0.1.5', -- or , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	})
	use({ 
		'ellisonleao/gruvbox.nvim',
		as = 'gruvbox',
		config = function()
			vim.cmd.colorscheme('gruvbox')
		end
	})
	use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })  
	use('nvim-treesitter/playground')
	-- use('theprimeagen/harpoon')
	use('mbbill/undotree')
	use('tpope/vim-fugitive')
	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v3.x',
		requires = {
			--- Uncomment these if you want to manage LSP servers from neovim
			{'williamboman/mason.nvim'},
			{'williamboman/mason-lspconfig.nvim'},

			-- LSP Support
			{'neovim/nvim-lspconfig'},
			-- Autocompletion
			{'hrsh7th/nvim-cmp'},
			{'hrsh7th/cmp-nvim-lsp'},
			{'L3MON4D3/LuaSnip'},
		}
	}
    use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    })
    use { "mxsdev/nvim-dap-vscode-js", requires = {"mfussenegger/nvim-dap"} }
    use {
        "microsoft/vscode-js-debug",
        opt = true,
        run = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out" 
    }
    use "nvim-lua/plenary.nvim" -- don't forget to add this one if you don't have it yet!
    use {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        requires = { {"nvim-lua/plenary.nvim"} }
    }
    use {
        'Joakker/lua-json5',
        -- if you're on windows
        -- run = 'powershell ./install.ps1'
        run = './install.sh'
    }
end)
