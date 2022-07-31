local present, coverage = pcall(require, "coverage")

if not present then
	return
end

coverage.setup({
	-- configuration options here
	highlights = {
		-- customize highlights
		covered = { fg = "#95F86D" }, -- supports style, fg, bg, sp (see :h highlight-gui)
		uncovered = { fg = "#F07178" },
	},
	signs = {
		-- customize signs
	},
	summary = {
		-- customize summary pop-up
	},
	lang = {
		-- customize langauge specific settings
	},
})
