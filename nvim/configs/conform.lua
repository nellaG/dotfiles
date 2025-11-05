local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "ruff_format", "ruff_organize_imports" },
    go = { "gofumpt" },
    typescript = { "deno_fmt", "biome", "prettier", stop_after_first = true },
    typescriptreact = { "deno_fmt", "biome", "prettier", stop_after_first = true },
    bash = { "shfmt" },
    fish = { "fish_indent" },
    htmldjango = { "djlint" },
    rust = { "rustfmt" },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

require("conform").setup(options)
