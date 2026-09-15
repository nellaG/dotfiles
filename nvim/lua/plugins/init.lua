return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    cmd = "ConformInfo",
    opts = function()
      return require "configs.conform"
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    -- NvChad v2.5 uses the legacy configs API; keep its compatible branch.
    branch = "master",
    opts = function(_, opts)
      return vim.tbl_deep_extend("force", opts, require "configs.treesitter")
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    opts = function()
      return require "configs.gitsigns"
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    opts = function(_, opts)
      return vim.tbl_deep_extend("force", opts, require "configs.ibl")
    end,
  },
  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      filters = { dotfiles = false, git_ignored = false },
      filesystem_watchers = { enable = vim.uv.os_uname().sysname ~= "Darwin" },
    },
  },
}
