return {
  -- Avoid the same blocking macOS FSEvents teardown as LSP file watchers.
  watch_gitdir = { enable = vim.uv.os_uname().sysname ~= "Darwin" },
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
  current_line_blame = false,
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
    map("n", "<leader>hu", gitsigns.stage_hunk)
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
    map("n", "<leader>td", gitsigns.preview_hunk_inline)

    -- Text object
    map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
  end,
}
