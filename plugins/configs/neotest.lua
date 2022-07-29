local present, neotest = pcall(require, "neotest")

if not present then
	return
end

local python_adapter_cfg = {
	-- Extra arguments for nvim-dap configuration
	dap = { justMyCode = false },

	-- Command line arguments for runner
	-- Can also be a function to return dynamic values
	args = { "--log-level", "DEBUG" },

	-- Runner to use. Will use pytest if available by default.
	-- Can be a function to return dynamic value.
	runner = "pytest",
}

local vim_test_adapter_cfg = {
	ignore_file_types = { "python", "vim", "lua" },
}

local config = {
	adapters = {
		require("neotest-python")(python_adapter_cfg),
		-- require("neotest-plenary"),
		-- require("neotest-vim-test")(vim_test_adapter_cfg),
	},
}

neotest.setup(config)
