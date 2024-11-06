local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "ruff_format", "ruff_organize_imports" },
    go = { "gofumpt" },
    typescript = { "prettier" },
    typescriptreact = { "prettier" },
    bash = { "shfmt" },
    fish = { "fish_indent" },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

require("conform").setup(options)
