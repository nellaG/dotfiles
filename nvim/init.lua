-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = "\\" -- set leader key

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },

  { import = "plugins" },
}, lazy_config)

--#region custom config start
--
-- Prevent line wrap
vim.opt.whichwrap:remove "<"
vim.opt.whichwrap:remove ">"
vim.opt.colorcolumn = { 100, 120 }
vim.opt.encoding = "utf-8"
vim.opt.fileformats = { "unix" }
vim.opt.bomb = false

-- Run gofmt + goimports on save
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function(args)
    require("conform").format { bufnr = args.buf }
  end,
})

-- nvim-treesitter parser install config
require("nvim-treesitter.configs").setup {
  -- A list of parser names, or "all" (the listed parsers MUST always be installed)
  ensure_installed = {
    "css",
    "lua",
    "typescript",
    "yaml",
    "toml",
    "tmux",
    "terraform",
    "python",
    "json",
    "json5",
    "html",
    "gomod",
    "go",
    "goctl",
    "dockerfile",
    "csv",
    "bash",
    "rust",
    "fish",
    "vim",
    "vimdoc",
    "query",
    "markdown",
    "markdown_inline",
    "git_config",
    "git_rebase",
    "gitattributes",
    "gitcommit",
    "gitignore",
    "nginx",
    "requirements",
  },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,
}

local ch_presets = require("markview.presets").checkboxes
local he_presets = require("markview.presets").headings
local hl_presets = require("markview.presets").horizontal_rules

require("markview").setup {
  checkboxes = ch_presets.nerd,
  markdown = {
    headings = he_presets.slanted,
    horizontal_rules = hl_presets.arrowed,
  },
}

require("gitsigns").setup {
  signs = {
    add = { text = "✚" },
    change = { text = "┃" },
    delete = { text = "_" },
    topdelete = { text = "‾" },
    changedelete = { text = "~" },
    untracked = { text = "┆" },
  },
  signs_staged = {
    add = { text = "✚" },
    change = { text = "┃" },
    delete = { text = "_" },
    topdelete = { text = "‾" },
    changedelete = { text = "~" },
    untracked = { text = "┆" },
  },
  current_line_blame = true,
  current_line_blame_opts = {
    delay = 400,
    virt_text_pos = "right_align",
    use_focus = true,
  },
  current_line_blame_formatter = "🩵 <abbrev_sha> <author>, <author_time:%R> - <summary> ",
  on_attach = function(bufnr)
    local gitsigns = require "gitsigns"

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    map("n", "]c", function()
      if vim.wo.diff then
        vim.cmd.normal { "]c", bang = true }
      else
        gitsigns.nav_hunk "next"
      end
    end)

    map("n", "[c", function()
      if vim.wo.diff then
        vim.cmd.normal { "[c", bang = true }
      else
        gitsigns.nav_hunk "prev"
      end
    end)

    -- Actions
    map("n", "<leader>hs", gitsigns.stage_hunk)
    map("n", "<leader>hr", gitsigns.reset_hunk)
    map("v", "<leader>hs", function()
      gitsigns.stage_hunk { vim.fn.line ".", vim.fn.line "v" }
    end)
    map("v", "<leader>hr", function()
      gitsigns.reset_hunk { vim.fn.line ".", vim.fn.line "v" }
    end)
    map("n", "<leader>hS", gitsigns.stage_buffer)
    map("n", "<leader>hu", gitsigns.undo_stage_hunk)
    map("n", "<leader>hR", gitsigns.reset_buffer)
    map("n", "<leader>hp", gitsigns.preview_hunk_inline)
    map("n", "<leader>hb", function()
      gitsigns.blame_line { full = true }
    end)
    map("n", "<leader>tb", gitsigns.toggle_current_line_blame)
    map("n", "<leader>hd", gitsigns.diffthis)
    map("n", "<leader>hD", function()
      gitsigns.diffthis "~"
    end)
    map("n", "<leader>td", gitsigns.toggle_deleted)

    -- Text object
    map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
  end,
}

-- lsp go to definition setting
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    local opts = { buffer = ev.buf }
    -- Jumps to the definition of the symbol under the cursor.
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  end,
})

-- ibl setup
require("ibl").setup {
  scope = {
    enabled = true,
    show_start = true,
    show_end = false,
    show_exact_scope = true,
  },
}

-- delimiter and indent line colorization
local highlight = {
  "RainbowRed",
  "RainbowYellow",
  "RainbowBlue",
  "RainbowOrange",
  "RainbowGreen",
  "RainbowViolet",
  "RainbowCyan",
}
local hooks = require "ibl.hooks"
-- create the highlight groups in the highlight setup hook, so they are reset
-- every time the colorscheme changes
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
  vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
  vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
  vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
  vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
  vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
  vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
  vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
end)

require("ibl").setup {
  scope = {
    highlight = highlight,
    show_start = false,
    show_end = false,
    show_exact_scope = true,
  },
  indent = {
    highlight = highlight,
  },
}

require("hologram").setup {
  auto_display = true, -- WIP automatic markdown image display, may be prone to breaking
}
require("wilder").setup {
  modes = { ":", "/", "?" },
}
require("telescope").load_extension "remote-sshfs"

require("leetcode").setup {
  lang = "python",
}
require("exercism").setup {
  exercism_workspace = "~/exercism", -- Default workspace for exercism exercises
  default_language = "rust", -- Default language for exercise list
  add_default_keybindings = true, -- Whether to add default keybindings
  icons = {
    concept = "", -- Icon for concept exercises
    practice = "", -- Icon for practice exercises
  },
}
require("competitest").setup()

require("peek").setup {
  syntax = true,
  theme = "dark",
  update_on_change = true,
  app = "browser",
  filetype = { "markdown" },
}

require("claude-code").setup {
  -- Terminal window settings
  window = {
    split_ratio = 0.3, -- Percentage of screen for the terminal window (height for horizontal, width for vertical splits)
    position = "botright", -- Position of the window: "botright", "topleft", "vertical", "float", etc.
    enter_insert = true, -- Whether to enter insert mode when opening Claude Code
    hide_numbers = true, -- Hide line numbers in the terminal window
    hide_signcolumn = true, -- Hide the sign column in the terminal window

    -- Floating window configuration (only applies when position = "float")
    float = {
      width = "80%", -- Width: number of columns or percentage string
      height = "80%", -- Height: number of rows or percentage string
      row = "center", -- Row position: number, "center", or percentage string
      col = "center", -- Column position: number, "center", or percentage string
      relative = "editor", -- Relative to: "editor" or "cursor"
      border = "rounded", -- Border style: "none", "single", "double", "rounded", "solid", "shadow"
    },
  },
  -- File refresh settings
  refresh = {
    enable = true, -- Enable file change detection
    updatetime = 100, -- updatetime when Claude Code is active (milliseconds)
    timer_interval = 1000, -- How often to check for file changes (milliseconds)
    show_notifications = true, -- Show notification when files are reloaded
  },
  -- Git project settings
  git = {
    use_git_root = true, -- Set CWD to git root when opening Claude Code (if in git project)
  },
  -- Shell-specific settings
  shell = {
    separator = "&&", -- Command separator used in shell commands
    pushd_cmd = "pushd", -- Command to push directory onto stack (e.g., 'pushd' for bash/zsh, 'enter' for nushell)
    popd_cmd = "popd", -- Command to pop directory from stack (e.g., 'popd' for bash/zsh, 'exit' for nushell)
  },
  -- Command settings
  command = "claude", -- Command used to launch Claude Code
  -- Command variants
  command_variants = {
    -- Conversation management
    continue = "--continue", -- Resume the most recent conversation
    resume = "--resume", -- Display an interactive conversation picker

    -- Output options
    verbose = "--verbose", -- Enable verbose logging with full turn-by-turn output
  },
  -- Keymaps
  keymaps = {
    toggle = {
      normal = "<C-,>", -- Normal mode keymap for toggling Claude Code, false to disable
      terminal = "<C-,>", -- Terminal mode keymap for toggling Claude Code, false to disable
      variants = {
        continue = "<leader>cC", -- Normal mode keymap for Claude Code with continue flag
        verbose = "<leader>cV", -- Normal mode keymap for Claude Code with verbose flag
      },
    },
    window_navigation = true, -- Enable window navigation keymaps (<C-h/j/k/l>)
    scrolling = true, -- Enable scrolling keymaps (<C-f/b>) for page up/down
  },
}

-- OR setup with some options
require("nvim-tree").setup {
  filters = {
    dotfiles = false,
    git_ignored = false,
  },
}

hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
-- custom config end

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "nvchad.autocmds"

vim.schedule(function()
  require "mappings"
end)
