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

require("gitsigns").setup {
  enabled = false,
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

require("telescope").load_extension "remote-sshfs"

require("peek").setup {
  syntax = true,
  theme = "dark",
  update_on_change = true,
  app = "browser",
  filetype = { "markdown" },
}

require("nvim-tree").setup {
  filters = {
    dotfiles = false,
    git_ignored = false,
  },
}

require("faster").setup()

hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
-- custom config end
-- Shutdown profiler: writes /tmp/nvim-quit.log every time nvim exits.
-- Tells you exactly which step (LSP shutdown, shada write, autocmds) takes time.
local function quit_log(msg)
  local f = io.open("/tmp/nvim-quit.log", "a")
  if f then
    f:write(string.format("[%.3f] %s\n", vim.uv.hrtime() / 1e9, msg))
    f:close()
  end
end

-- Trace the early shutdown stages so we can see where time goes before VimLeavePre.
for _, ev in ipairs({ "QuitPre", "ExitPre", "BufWinLeave", "BufLeave", "BufUnload", "BufWipeout" }) do
  vim.api.nvim_create_autocmd(ev, {
    callback = function(args)
      quit_log(string.format("%s buf=%s name=%s", ev, tostring(args.buf), args.file or ""))
    end,
  })
end

-- Tear down LSP at ExitPre — BEFORE BufUnload triggers the synchronous
-- LSP detach/shutdown path that can block for many seconds while
-- rust-analyzer is still indexing.
vim.api.nvim_create_autocmd("ExitPre", {
  callback = function()
    local t0 = vim.uv.hrtime()
    local function dt() return (vim.uv.hrtime() - t0) / 1e6 end
    quit_log("ExitPre: tearing down LSP")

    -- 1) SIGKILL all child processes FIRST. Once the LSP server is dead, its
    --    rpc pipes hit EOF and Neovim treats the client as exited.
    local self_pid = vim.fn.getpid()
    local pgrep = io.popen("pgrep -P " .. self_pid .. " 2>/dev/null")
    if pgrep then
      local out = pgrep:read("*a") or ""
      pgrep:close()
      for line in out:gmatch("[^\r\n]+") do
        local cpid = tonumber(line)
        if cpid then
          pcall(vim.uv.kill, cpid, 9)
          quit_log(string.format("  ExitPre SIGKILL pid=%d (+%.0fms)", cpid, dt()))
        end
      end
    end

    -- 2) Forcibly mark all LSP clients as stopped & wipe their attached_buffers,
    --    bypassing Neovim's shutdown protocol entirely. Without this, vim.lsp's
    --    internal BufUnload handler (and any stop_client call) can block for
    --    many seconds waiting for an initialize/shutdown handshake — even on a
    --    dead process — because notify("textDocument/didClose") may stall on a
    --    closed pipe and stop_client waits on the initialize state.
    for _, client in ipairs(vim.lsp.get_clients()) do
      -- best-effort: terminate the rpc channel
      if client.rpc and type(client.rpc.terminate) == "function" then
        pcall(client.rpc.terminate)
      end
      -- pretend no buffers are attached, so BufUnload skips the detach work
      client.attached_buffers = {}
      -- override is_stopped so any downstream code thinks it's done
      client.is_stopped = function() return true end
    end
    quit_log(string.format("ExitPre: done (+%.0fms)", dt()))
  end,
})

vim.api.nvim_create_autocmd("VimLeavePre", {
  callback = function()
    local t0 = vim.uv.hrtime()
    local function dt() return (vim.uv.hrtime() - t0) / 1e6 end
    quit_log("=== VimLeavePre start ===")

    -- belt-and-suspenders: kill any lingering LSP/job children that escaped
    -- the ExitPre teardown (e.g., paths that don't fire ExitPre)
    local self_pid = vim.fn.getpid()
    local pgrep = io.popen("pgrep -P " .. self_pid .. " 2>/dev/null")
    if pgrep then
      local out = pgrep:read("*a") or ""
      pgrep:close()
      for line in out:gmatch("[^\r\n]+") do
        local cpid = tonumber(line)
        if cpid then pcall(vim.uv.kill, cpid, 9) end
      end
    end

    -- Persist shada explicitly so we keep jumplist, marks, registers, and
    -- search/command history across sessions. Normally Neovim writes shada
    -- AFTER VimLeavePre and BEFORE VimLeave — but we're about to skip that.
    pcall(function() vim.cmd("wshada!") end)
    quit_log(string.format("  wshada done (+%.0fms)", dt()))

    -- Fast-exit: bypass the rest of Neovim's shutdown sequence (other plugins'
    -- VimLeavePre handlers, lazy.nvim cache write, libuv handle teardown,
    -- macOS pipe drain). These can collectively take many seconds, especially
    -- with active LSP rpc channels. Tradeoff: lazy.nvim will rebuild its
    -- plugin-spec cache on next startup (one-time small cost).
    quit_log(string.format("=== fast-exit os.exit(0) (+%.0fms) ===", dt()))
    os.exit(0)
  end,
})

-- Fallback only — unreachable if VimLeavePre os.exit fires as expected.
vim.api.nvim_create_autocmd("VimLeave", {
  callback = function()
    quit_log("=== VimLeave fired (fallback path) ===")
    os.exit(0)
  end,
})
-- load theme dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "autocmds"

vim.schedule(function()
  require "mappings"
end)
