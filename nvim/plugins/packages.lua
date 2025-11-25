-- list custom installed packages

return {
  {
    "ray-x/go.nvim",
    dependencies = { -- optional packages
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("go").setup()
    end,
    event = { "CmdlineEnter" },
    ft = { "go", "gomod" },
    build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
  },
  {
    "numToStr/Navigator.nvim",
    config = function()
      require("Navigator").setup {
        auto_save = nil,
      }
    end,
    lazy = false,
  },
  {
    "HiPhish/rainbow-delimiters.nvim",
    lazy = false,
  },
  {
    "hat0uma/csvview.nvim",
    config = function()
      require("csvview").setup {
        view = {
          display_mode = "border",
        },
      }
    end,
  },
  {
    "edluffy/hologram.nvim",
  },
  {
    "nosduco/remote-sshfs.nvim",
  },
  { "akinsho/git-conflict.nvim", version = "*", config = true },
  {
    "topaxi/pipeline.nvim",
    keys = {
      { "<leader>ci", "<cmd>Pipeline<cr>", desc = "Open pipeline.nvim" },
    },
    -- optional, you can also install and use `yq` instead.
    build = "make",
    ---@type pipeline.Config
    opts = {},
  },
  {
    "gelguy/wilder.nvim",
    config = function()
      require("wilder").setup()
    end,
  },
  {
    "kawre/leetcode.nvim",
    build = ":TSUpdate html", -- if you have `nvim-treesitter` installed
    dependencies = {
      "nvim-telescope/telescope.nvim",
      -- "ibhagwan/fzf-lua",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    },
    opts = {
      -- configuration goes here
    },
  },
  {
    "OXY2DEV/markview.nvim",
    lazy = false, -- Recommended
    -- ft = "markdown" -- If you decide to lazy-load anyway

    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
  },
  {
    "2kabhishek/exercism.nvim",
    cmd = {
      "ExercismLanguages",
      "ExercismList",
      "ExercismSubmit",
      "ExercismTest",
    },
    keys = {
      "<leader>exa",
      "<leader>exl",
      "<leader>exs",
      "<leader>ext",
    },
    dependencies = {
      "2kabhishek/utils.nvim", -- required, for utility functions
      "stevearc/dressing.nvim", -- optional, highly recommended, for fuzzy select UI
      "2kabhishek/termim.nvim", -- optional, better UX for running tests
    },
    -- Add your custom configs here, keep it blank for default configs (required)
    opts = {},
  },
  {
    "xeluxee/competitest.nvim",
    dependencies = "MunifTanjim/nui.nvim",
    config = function()
      require("competitest").setup()
    end,
  },
  {
    "abecodes/tabout.nvim",
    lazy = false,
    config = function()
      require("tabout").setup {
        tabkey = "<Tab>", -- key to trigger tabout, set to an empty string to disable
        backwards_tabkey = "<S-Tab>", -- key to trigger backwards tabout, set to an empty string to disable
        act_as_tab = true, -- shift content if tab out is not possible
        act_as_shift_tab = false, -- reverse shift content if tab out is not possible (if your keyboard/terminal supports <S-Tab>)
        default_tab = "<C-t>", -- shift default action (only at the beginning of a line, otherwise <TAB> is used)
        default_shift_tab = "<C-d>", -- reverse shift default action,
        enable_backwards = true, -- well ...
        completion = false, -- if the tabkey is used in a completion pum
        tabouts = {
          { open = "'", close = "'" },
          { open = '"', close = '"' },
          { open = "`", close = "`" },
          { open = "(", close = ")" },
          { open = "[", close = "]" },
          { open = "{", close = "}" },
        },
        ignore_beginning = true, --[[ if the cursor is at the beginning of a filled element it will rather tab out than shift the content ]]
        exclude = {}, -- tabout will ignore these filetypes
      }
    end,
    dependencies = { -- These are optional
      "nvim-treesitter/nvim-treesitter",
      "L3MON4D3/LuaSnip",
      "hrsh7th/nvim-cmp",
    },
    opt = true, -- Set this to true if the plugin is optional
    event = "InsertCharPre", -- Set the event to 'InsertCharPre' for better compatibility
    priority = 1000,
  },
  {
    "L3MON4D3/LuaSnip",
    keys = function()
      -- Disable default tab keybinding in LuaSnip
      return {}
    end,
  },
  {
    "greggh/claude-code.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim", -- Required for git operations
    },
    config = function()
      require("claude-code").setup()
    end,
  },
  {
    "toppair/peek.nvim",
    event = { "VeryLazy" },
    build = "deno task --quiet build:fast",
    config = function()
      require("peek").setup()
      vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
      vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
    end,
  },
  {
    "github/copilot.vim",
    lazy = false,
    config = function() -- Mapping tab is already used in NvChad
      vim.g.copilot_no_tab_map = true -- Disable tab mapping
      vim.g.copilot_assume_mapped = true -- Assume that the mapping is already done
    end,
  },
}
