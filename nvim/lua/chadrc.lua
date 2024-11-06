-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :( 

---@type ChadrcConfig
local M = {}

M.base46 = {
	theme = "everblush",

	-- hl_override = {
	-- 	Comment = { italic = true },
	-- 	["@comment"] = { italic = true },
	-- },
}

 M.ui = {
  telescope = { stype = "bordered"},
   statusline = {
     theme = "minimal",
     separator_style = "default",
     order = { "mode", "file", "git", "%=", "lsp_msg", "%=", "diagnostics", "encoding", "lsp", "cursor", "cwd", "xyz", "abc" },
     modules = {
       abc = function()
         return ""
       end,
       encoding = function()
         return vim.opt.fileencoding:get()
       end,
       xyz =  "",
       f = "%F"
     }
   },
 }

M.ui = {
     tabufline = {
       order = { "treeOffset", "buffers", "tabs"},
       modules = {
       }
     }
}

return M
