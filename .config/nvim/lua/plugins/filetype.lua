local status, filetype = pcall(require, "filetype")
if not status then
	return
end

filetype.setup({
	-- overrides = {
	-- 	extensions = {
	-- 		js = "javascript",
	-- 		jsx = "javascriptreact",
	-- 		ts = "typescript",
	-- 		tsx = "typescriptreact",
	-- 		lua = "lua",
	-- 		vim = "vim",
	-- 		snippets = "snippets",
	-- 	},
	-- 	complex = {
	-- 		["*.json"] = "json",
	-- 		["tsconfig.json"] = "jsonc",
	-- 		["jsconfig.json"] = "jsonc",
	-- 		["**/i3/config"] = "i3config",
	-- 	},
	-- },
})
