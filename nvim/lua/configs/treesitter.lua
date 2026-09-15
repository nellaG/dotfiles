return {
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
  auto_install = false,
}
