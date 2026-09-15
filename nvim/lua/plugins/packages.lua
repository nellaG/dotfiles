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
      require("go").setup { lsp_cfg = false }
    end,
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
    event = "VeryLazy",
  },
  {
    "HiPhish/rainbow-delimiters.nvim",
    event = "VeryLazy",
  },
  {
    "nosduco/remote-sshfs.nvim",
    cmd = {
      "RemoteSSHFSConnect",
      "RemoteSSHFSDisconnect",
      "RemoteSSHFSEdit",
      "RemoteSSHFSReload",
      "RemoteSSHFSFindFiles",
      "RemoteSSHFSLiveGrep",
    },
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
    config = function()
      require("remote-sshfs").setup {}
      require("telescope").load_extension "remote-sshfs"
    end,
  },
  {
    "akinsho/git-conflict.nvim",
    cmd = {
      "GitConflictListQf",
      "GitConflictChooseOurs",
      "GitConflictChooseTheirs",
      "GitConflictChooseBoth",
      "GitConflictChooseNone",
      "GitConflictNextConflict",
      "GitConflictPrevConflict",
    },
    version = "*",
    config = true,
  },
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
    enabled = false,
    config = function()
      require("wilder").setup()
    end,
  },
  {
    "L3MON4D3/LuaSnip",
    keys = function()
      -- Disable default tab keybinding in LuaSnip
      return {}
    end,
  },
  {
    "toppair/peek.nvim",
    cmd = { "PeekOpen", "PeekClose" },
    build = "deno task --quiet build:fast",
    config = function()
      require("peek").setup {
        syntax = true,
        theme = "dark",
        update_on_change = true,
        app = "browser",
        filetype = { "markdown" },
      }
      vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
      vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
    end,
  },
  {
    "hat0uma/csvview.nvim",
    ---@module "csvview"
    ---@type CsvView.Options
    opts = {
      parser = { comments = { "#", "//" } },
      keymaps = {
        -- Text objects for selecting fields
        textobject_field_inner = { "if", mode = { "o", "x" } },
        textobject_field_outer = { "af", mode = { "o", "x" } },
        -- Excel-like navigation:
        -- Use <Tab> and <S-Tab> to move horizontally between fields.
        -- Use <Enter> and <S-Enter> to move vertically between rows and place the cursor at the end of the field.
        -- Note: In terminals, you may need to enable CSI-u mode to use <S-Tab> and <S-Enter>.
        jump_next_field_end = { "<Tab>", mode = { "n", "v" } },
        jump_prev_field_end = { "<S-Tab>", mode = { "n", "v" } },
        jump_next_row = { "<Enter>", mode = { "n", "v" } },
        jump_prev_row = { "<S-Enter>", mode = { "n", "v" } },
      },
    },
    cmd = { "CsvViewEnable", "CsvViewDisable", "CsvViewToggle" },
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    -- Keep NvChad's config callback, including completion integration.
  },
  {
    "folke/trouble.nvim",
    enabled = false,
    cmd = "Trouble",
    event = "LspAttach",
    keys = {
      {
        "<leader>xx",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>xX",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>cs",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Symbols (Trouble)",
      },
      {
        "<leader>cl",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP Definitions / references / ... (Trouble)",
      },
      {
        "<leader>xL",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location List (Trouble)",
      },
      {
        "<leader>xQ",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List (Trouble)",
      },
    },
  },
  {
    "pteroctopus/faster.nvim",
    event = "BufReadPre",
    opts = {},
  },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    opts = {
      suggestion = {
        enabled = not vim.g.ai_cmp,
        auto_trigger = true,
        debounce = 75,
        hide_during_completion = vim.g.ai_cmp,
        keymap = {
          accept = "<C-l>",
          next = "<M-]>",
          prev = "<M-[>",
        },
      },
      panel = { enabled = false },
      filetypes = {
        markdown = true,
        help = true,
      },
    },
  },
}
