return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
		"mfussenegger/nvim-dap",
		lazy = true,
		dependencies = {
			"jay-babu/mason-nvim-dap.nvim",
			"rcarriga/nvim-dap-ui",
		},
		config = function()
			require("configs.dapconfig")
		end,
	},
	{
		"rcarriga/nvim-dap-ui",
		lazy = true,
    dependencies = {
      "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"
    }
	},
	{
		"jay-babu/mason-nvim-dap.nvim",
		lazy = true,
		opts = {
			ensure_installed = { "python", "coreclr", "node2", "js", "chrome" }
		},
	},

  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' },
  },

  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = "cd app && yarn install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
  },

  {
  	"nvim-treesitter/nvim-treesitter",
  	opts = {
  		ensure_installed = {
  			"vim", "lua", "vimdoc",
       "html", "css"
  		},
  	},
  },
}
