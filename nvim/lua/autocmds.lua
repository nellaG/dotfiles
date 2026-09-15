require "nvchad.autocmds"

-- NvChad's newer helper calls the main-branch installer. This configuration
-- pins the master API, whose TSInstall command accepts the parser list.
vim.api.nvim_create_user_command("TSInstallAll", function()
  vim.cmd("TSInstall " .. table.concat(require("configs.treesitter").ensure_installed, " "))
end, { force = true })
