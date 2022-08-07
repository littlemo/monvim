return {
	-- 功能增强
	["folke/which-key.nvim"] = {
		disable = false,
	},
	["tpope/vim-surround"] = { -- 围绕选择
		event = "BufRead",
	},
	["tpope/vim-repeat"] = { -- 点模式增强
		event = "BufRead",
	},
	["farmergreg/vim-lastplace"] = { -- 恢复上次关闭时的位置
		-- NOTE: 此处需启动时加载插件，否则无法生效
		config = function()
			require("custom.plugins.configs.others").lastplace()
		end,
	},
	["bronson/vim-crosshairs"] = { -- 十字准线
		config = function()
			require("custom.plugins.configs.others").crosshairs()
		end,
	},
	["kevinhwang91/rnvimr"] = { -- ranger 文件管理器集成
		cmd = "RnvimrToggle",
		run = "pip3 install ranger-fm pynvim",
		config = function()
			require("custom.plugins.configs.rnvimr")
		end,
	},
	["kevinhwang91/nvim-hlslens"] = { -- 匹配高亮
		event = "BufRead",
		config = function()
			require("custom.plugins.configs.hlslens")
		end,
	},
	["haya14busa/vim-asterisk"] = { -- 星匹配增强
		after = "nvim-hlslens",
		event = "BufRead",
	},
	["xiyaowong/nvim-cursorword"] = { -- 高亮当前光标所在词
		event = "BufRead",
		config = function()
			require("custom.plugins.configs.others").cursorword()
		end,
	},
	["anuvyklack/pretty-fold.nvim"] = { -- 代码折叠
		event = "BufRead",
		config = function()
			require("custom.plugins.configs.others").prettyfold()
		end,
	},
	["anuvyklack/fold-preview.nvim"] = { -- 折叠预览
		requires = "anuvyklack/keymap-amend.nvim",
		event = "BufRead",
		config = function()
			require("custom.plugins.configs.others").foldpreview()
		end,
	},
	["anuvyklack/keymap-amend.nvim"] = {
		setup = function()
			require("core.lazy_load").on_file_open("keymap-amend.nvim")
		end,
	},
	["monaqa/dial.nvim"] = { -- 光标词加减增强
		event = "BufRead",
		config = function()
			require("custom.plugins.configs.dial")
		end,
	},

	-- 版本管理
	["tpope/vim-fugitive"] = { -- Git 集成
		cmd = "Git",
	},

	-- 格式化&语法检查
	["jose-elias-alvarez/null-ls.nvim"] = {
		after = "nvim-lspconfig",
		config = function()
			require("custom.plugins.configs.null-ls")
		end,
	},
	["godlygeek/tabular"] = { -- 文本对齐
		cmd = "Tabularize",
	},

	-- lsp stuff
	["neovim/nvim-lspconfig"] = {
		config = function()
			require("plugins.configs.lspconfig")
			require("custom.plugins.configs.lspconfig")
		end,
	},

	-- test stuff
	["nvim-neotest/neotest"] = { -- 单测框架
		setup = function()
			require("core.lazy_load").on_file_open("neotest")
		end,
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-neotest/neotest-python",
		},
		config = function()
			require("custom.plugins.configs.neotest")
		end,
	},
	["antoinemadec/FixCursorHold.nvim"] = {
		setup = function()
			require("core.lazy_load").on_file_open("FixCursorHold.nvim")
		end,
	},
	["nvim-neotest/neotest-python"] = {
		setup = function()
			require("core.lazy_load").on_file_open("neotest-python")
		end,
	},
	["andythigpen/nvim-coverage"] = { -- 单测覆盖报告展示
		cmd = { "CoverageLoad", "CoverageToggle", "CoverageSummary" },
		requires = "nvim-lua/plenary.nvim",
		config = function()
			require("custom.plugins.configs.coverage")
		end,
	},

	-- debug stuff
	["mfussenegger/nvim-dap"] = {
		module = "dap",
		config = function()
			require("custom.plugins.configs.dap").dap()
		end,
	},
	["rcarriga/nvim-dap-ui"] = {
		requires = "mfussenegger/nvim-dap",
		event = "BufRead",
		config = function()
			require("custom.plugins.configs.dap").dapui()
		end,
	},
	["theHamsta/nvim-dap-virtual-text"] = {
		requires = {
			"mfussenegger/nvim-dap",
			"nvim-treesitter/nvim-treesitter",
		},
		module = "nvim-dap-virtual-text",
		config = function()
			require("custom.plugins.configs.dap").virtual_text()
		end,
	},
	["mfussenegger/nvim-dap-python"] = {
		module = "dap-python",
		config = function()
			require("dap-python").setup()
		end,
	},
}
