-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "tokyodark",

  -- hl_override = {
  -- 	Comment = { italic = true },
  -- 	["@comment"] = { italic = true },
  -- },
}

M.ui = {
  telescope = { stype = "bordered" },
  tabufline = {
    order = { "treeOffset", "buffers", "tabs" },
    modules = {},
  },
  statusline = {
    enabled = true,
    theme = "default", -- default/vscode/vscode_colored/minimal
    -- default/round/block/arrow separators work only for default statusline theme
    -- round and block will work for minimal theme only
    separator_style = "arrow",
    order = {
      "mode",
      "file",
      "git",
      "%=",
      "lsp_msg",
      "%=",
      "ff_info",
      "bom_info",
      "diagnostics",
      "lsp",
      "cwd",
      "cursor",
    },
    modules = {
      ff_info = function()
        local ff = vim.bo.fileformat or ""

        if ff ~= "" then
          -- FF 정보만 반환 (띄어쓰기 포함)
          return string.format(" %s ", ff:upper())
        end
        return ""
      end,

      -- 2. BOM 유무 모듈
      bom_info = function()
        -- BOM이 설정되어 있으면 'BOM'을 반환
        local bomb = vim.bo.bomb and "BOM" or ""

        if bomb ~= "" then
          -- 'BOM' 문자열만 반환 (띄어쓰기 포함)
          return string.format(" %s ", bomb)
        end
        return ""
      end,
    },
  },
}

-- M.nvdash = { load_on_startup = true }
-- M.ui = {
--       tabufline = {
--          lazyload = false
--      }
-- }

return M
